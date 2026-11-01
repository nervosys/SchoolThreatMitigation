use crate::model::*;
use serde::de::DeserializeOwned;
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet, HashSet};
use std::fs;
use std::path::{Path, PathBuf};

#[derive(Clone)]
pub struct KnowledgeBase {
    pub rules: RuleRegister,
    pub scenarios: Vec<Scenario>,
    pub controls: Vec<Control>,
    pub sources: Vec<Source>,
    pub relations: Vec<Relation>,
    pub source_reviews: SourceReviewRegister,
    pub fact_catalog: FactCatalog,
}

fn read_json<T: DeserializeOwned>(path: &Path) -> Result<T, String> {
    let data =
        fs::read_to_string(path).map_err(|_| "Required knowledge file unavailable".to_string())?;
    crate::json_input::decode(data.as_bytes())
        .map_err(|_| "Knowledge file does not match the required schema".to_string())
}

impl KnowledgeBase {
    pub fn embedded() -> Result<Self, String> {
        fn parse<T: DeserializeOwned>(text: &str) -> Result<T, String> {
            crate::json_input::decode(text.as_bytes())
                .map_err(|_| "Bundled knowledge schema is invalid".into())
        }
        let rules: RuleRegister = parse(include_str!("../kb/rules_v17_0.json"))?;
        let scenarios: ScenarioRegister =
            parse(include_str!("../../governance/threat_scenarios_v17_0.json"))?;
        let controls: ControlRegister = parse(include_str!(
            "../../governance/control_requirements_v17_0.json"
        ))?;
        let mut sources: SourceRegister =
            parse(include_str!("../../governance/public_sources_v17_0.json"))?;
        let legal: LegalRegister = parse(include_str!("../kb/verified_legal_sources.json"))?;
        sources.sources.extend(legal.legal_sources);
        let technology: SourceRegister = parse(include_str!("../kb/technology_sources.json"))?;
        sources.sources.extend(technology.sources);
        let graph: RelationRegister = parse(include_str!("../kb/relations_v17_0.json"))?;
        if graph.version != rules.kb_version {
            return Err("Relationship register version mismatch".into());
        }
        let source_reviews: SourceReviewRegister =
            parse(include_str!("../kb/source_reviews.json"))?;
        let fact_catalog: FactCatalog = parse(include_str!("../kb/fact_catalog.json"))?;
        let kb = Self {
            rules,
            scenarios: scenarios.scenarios,
            controls: controls.controls,
            sources: sources.sources,
            relations: graph.edges,
            source_reviews,
            fact_catalog,
        };
        kb.validate()?;
        Ok(kb)
    }
    pub fn load(root: &Path) -> Result<Self, String> {
        let governance: PathBuf = root.join("governance");
        let kbdir = root.join("engine/kb");
        let rules: RuleRegister = read_json(&kbdir.join("rules_v17_0.json"))?;
        let scenarios: ScenarioRegister =
            read_json(&governance.join("threat_scenarios_v17_0.json"))?;
        let controls: ControlRegister =
            read_json(&governance.join("control_requirements_v17_0.json"))?;
        let mut sources: SourceRegister = read_json(&governance.join("public_sources_v17_0.json"))?;
        let legal: LegalRegister = read_json(&kbdir.join("verified_legal_sources.json"))?;
        sources.sources.extend(legal.legal_sources);
        let technology: SourceRegister = read_json(&kbdir.join("technology_sources.json"))?;
        sources.sources.extend(technology.sources);
        let graph: RelationRegister = read_json(&kbdir.join("relations_v17_0.json"))?;
        if graph.version != rules.kb_version {
            return Err("Relationship register version mismatch".into());
        }
        let source_reviews: SourceReviewRegister = read_json(&kbdir.join("source_reviews.json"))?;
        let fact_catalog: FactCatalog = read_json(&kbdir.join("fact_catalog.json"))?;
        let kb = Self {
            rules,
            scenarios: scenarios.scenarios,
            controls: controls.controls,
            sources: sources.sources,
            relations: graph.edges,
            source_reviews,
            fact_catalog,
        };
        kb.validate()?;
        Ok(kb)
    }
    pub fn validate(&self) -> Result<(), String> {
        let compatibility: Value = crate::json_input::decode(include_bytes!("../../release.json"))
            .map_err(|_| "Release compatibility metadata invalid")?;
        if compatibility["engine_version"] != env!("CARGO_PKG_VERSION")
            || compatibility["kb_version"] != self.rules.kb_version
            || compatibility["schema_version"] != self.rules.schema_version
            || compatibility["publication_version"] != "17.0"
        {
            return Err(
                "Engine, knowledge, schema, and publication versions are incompatible".into(),
            );
        }
        if self.rules.schema_version != "2.0"
            || self.rules.reasoning_specification != "stm-conjunctive-1"
            || self.rules.kb_version != "17.0-NSAI.4"
            || self.rules.source_proposal != "SchoolThreatMitigation V17.0"
            || self.rules.review_status != "draft_independent_review_pending"
            || self.rules.rules_reviewed_as_of.trim().is_empty()
            || self.rules.legal_status.trim().is_empty()
        {
            return Err("Unsupported or incomplete knowledgebase metadata".into());
        }
        crate::currency::Date::parse(&self.rules.rules_reviewed_as_of)?;
        let mut ids = HashSet::new();
        let mut source_ids = HashSet::new();
        for source in &self.sources {
            if !crate::privacy::knowledge_id(&source.id)
                || source.title.trim().is_empty()
                || source.interpretation.trim().is_empty()
            {
                return Err("Invalid source metadata".into());
            }
            if !source_ids.insert(source.id.as_str()) {
                return Err(format!("Duplicate source ID: {}", source.id));
            }
            if !source.url.starts_with("https://") {
                return Err(format!("Insecure or malformed source URL: {}", source.id));
            }
        }
        for scenario in &self.scenarios {
            if !crate::privacy::knowledge_id(&scenario.id) {
                return Err("Invalid scenario ID".into());
            }
            if !ids.insert(scenario.id.as_str()) {
                return Err(format!("Duplicate scenario: {}", scenario.id));
            }
            if scenario.rights_gate.is_empty() || scenario.stop_condition.is_empty() {
                return Err(format!("Missing rights/stop condition: {}", scenario.id));
            }
        }
        let mut review_ids = HashSet::new();
        if self.source_reviews.schema_version != self.rules.schema_version
            || self.source_reviews.kb_version != self.rules.kb_version
            || self.source_reviews.policy.trim().is_empty()
        {
            return Err("Incompatible source-review registry".into());
        }
        for review in &self.source_reviews.sources {
            if !review_ids.insert(review.source_id.as_str())
                || !source_ids.contains(review.source_id.as_str())
                || !["unreviewed", "reviewed", "conflict", "withdrawn"]
                    .contains(&review.status.as_str())
                || review.evidence_locator.trim().is_empty()
                || review.review_note.trim().is_empty()
            {
                return Err("Invalid or duplicate source-review metadata".into());
            }
            let start = review
                .reviewed_on
                .as_deref()
                .map(crate::currency::Date::parse)
                .transpose()?;
            let end = review
                .valid_through
                .as_deref()
                .map(crate::currency::Date::parse)
                .transpose()?;
            if review.status == "reviewed" && (start.is_none() || end.is_none() || start > end) {
                return Err("Reviewed sources require an ordered validity interval".into());
            }
        }
        if review_ids != source_ids {
            return Err("Source-review coverage incomplete".into());
        }
        for control in &self.controls {
            if !crate::privacy::knowledge_id(&control.id)
                || control.hard_stop.trim().is_empty()
                || control.required_evidence.trim().is_empty()
            {
                return Err("Incomplete control metadata".into());
            }
            if !ids.insert(control.id.as_str()) {
                return Err(format!("Duplicate control: {}", control.id));
            }
        }
        for rule in &self.rules.rules {
            if !crate::privacy::knowledge_id(&rule.id)
                || rule.scope.trim().is_empty()
                || rule.accountable_owner.trim().is_empty()
                || rule.recommended_action.trim().is_empty()
                || ![
                    "statutory_reference",
                    "safety_guardrail",
                    "deployment_qualification",
                    "voluntary_recommendation",
                ]
                .contains(&rule.kind.as_str())
            {
                return Err("Invalid rule metadata or scope".into());
            }
            if !ids.insert(rule.id.as_str()) {
                return Err(format!("Duplicate rule: {}", rule.id));
            }
            if rule.check.is_empty() || rule.source_refs.is_empty() {
                return Err(format!("Uncheckable or uncited rule: {}", rule.id));
            }
            for reference in &rule.source_refs {
                if !source_ids.contains(reference.as_str()) {
                    return Err(format!("Missing source {} for rule {}", reference, rule.id));
                }
            }
            for pred in rule.when.iter().chain(rule.check.iter()) {
                if pred.fact.trim().is_empty() || !pred.equals.is_boolean() {
                    return Err(format!("Unsupported predicate in {}", rule.id));
                }
            }
            for phase in [&rule.when, &rule.check] {
                let unique: HashSet<_> = phase.iter().map(|p| &p.fact).collect();
                if unique.len() != phase.len() {
                    return Err("Duplicate predicate in a logical clause".into());
                }
            }
            let mut requirements = BTreeMap::new();
            for predicate in rule.when.iter().chain(&rule.check) {
                if requirements
                    .insert(&predicate.fact, &predicate.equals)
                    .is_some_and(|v| v != &predicate.equals)
                {
                    return Err("Contradictory applicability and requirement predicates".into());
                }
            }
        }
        let mut edge_keys = HashSet::new();
        for edge in &self.relations {
            if !edge_keys.insert((&edge.from, &edge.to, &edge.relation)) {
                return Err("Duplicate graph relation".into());
            }
            let valid_from = self.scenarios.iter().any(|s| s.id == edge.from);
            let valid_to = match edge.relation.as_str() {
                "mitigated_by" => self.controls.iter().any(|c| c.id == edge.to),
                "governed_by" => self.rules.rules.iter().any(|r| r.id == edge.to),
                _ => false,
            };
            if !valid_from || !valid_to || edge.basis.trim().is_empty() {
                return Err("Invalid graph endpoint type or relation basis".into());
            }
            if !ids.contains(edge.from.as_str()) || !ids.contains(edge.to.as_str()) {
                return Err(format!(
                    "Dangling graph reference {} -> {}",
                    edge.from, edge.to
                ));
            }
            if edge.relation != "mitigated_by" && edge.relation != "governed_by" {
                return Err(format!("Unsupported relation: {}", edge.relation));
            }
        }
        for scenario in &self.scenarios {
            if !self
                .relations
                .iter()
                .any(|e| e.from == scenario.id && e.relation == "mitigated_by")
            {
                return Err(format!(
                    "Threat has no mapped defensive control: {}",
                    scenario.id
                ));
            }
        }
        let fact_names: HashSet<_> = self
            .fact_catalog
            .facts
            .iter()
            .map(|f| f.fact.as_str())
            .collect();
        if self.fact_catalog.schema_version != self.rules.schema_version
            || self.fact_catalog.kb_version != self.rules.kb_version
            || self.fact_catalog.review_status != "draft_independent_review_pending"
            || fact_names.len() != self.fact_catalog.facts.len()
            || fact_names != self.admissible_facts()
        {
            return Err("Fact definitions do not match the approved logical predicates".into());
        }
        for fact in &self.fact_catalog.facts {
            let expected_rules: BTreeSet<_> = self
                .rules
                .rules
                .iter()
                .filter(|r| r.when.iter().chain(&r.check).any(|p| p.fact == fact.fact))
                .map(|r| r.id.as_str())
                .collect();
            let expected_sources: BTreeSet<_> = self
                .rules
                .rules
                .iter()
                .filter(|r| expected_rules.contains(r.id.as_str()))
                .flat_map(|r| r.source_refs.iter().map(String::as_str))
                .collect();
            if fact.true_means.trim().is_empty()
                || fact.false_means.trim().is_empty()
                || fact.evidence_required.trim().is_empty()
                || fact
                    .rule_refs
                    .iter()
                    .map(String::as_str)
                    .collect::<BTreeSet<_>>()
                    != expected_rules
                || fact
                    .source_refs
                    .iter()
                    .any(|id| !source_ids.contains(id.as_str()))
                || fact
                    .source_refs
                    .iter()
                    .map(String::as_str)
                    .collect::<BTreeSet<_>>()
                    != expected_sources
            {
                return Err("Incomplete or inconsistent fact definition".into());
            }
        }
        Ok(())
    }
    pub fn admissible_facts(&self) -> HashSet<&str> {
        self.rules
            .rules
            .iter()
            .flat_map(|r| r.when.iter().chain(r.check.iter()).map(|p| p.fact.as_str()))
            .collect()
    }
    pub fn inspect_input(&self, facts: &Facts) -> Result<(), String> {
        if facts.len() > 80 {
            return Err("Too many facts: only aggregate, rule-defined facts allowed".into());
        }
        let admissible = self.admissible_facts();
        for (key, value) in facts {
            if !admissible.contains(key.as_str()) {
                return Err("Fact not on public aggregate whitelist; input redacted".into());
            }
            if !value.is_boolean() {
                return Err("Only aggregate Boolean facts are accepted; input redacted".into());
            }
        }
        Ok(())
    }
    pub fn evaluate(&self, facts: &Facts) -> Result<Assessment, String> {
        self.evaluate_with_context(facts, None, None)
    }
    pub fn evaluate_with_context(
        &self,
        facts: &Facts,
        as_of: Option<&str>,
        expected_kb_version: Option<&str>,
    ) -> Result<Assessment, String> {
        self.inspect_input(facts)?;
        if expected_kb_version.is_some_and(|v| v != self.rules.kb_version) {
            return Err("Requested knowledgebase version is unavailable; input redacted".into());
        }
        let review = self.review_report(as_of)?;
        let mut findings = Vec::new();
        let mut summary = BTreeMap::new();
        let mut proofs = Vec::new();
        for rule in &self.rules.rules {
            let (scope_bad, scope_missing) = assess_predicates(&rule.when, facts);
            let requirements_evaluated = scope_bad.is_empty() && scope_missing.is_empty();
            let (status, bad, missing) = if !scope_bad.is_empty() {
                ("not_applicable", Vec::new(), Vec::new())
            } else if !scope_missing.is_empty() {
                ("scope_unknown", Vec::new(), scope_missing)
            } else {
                let (bad, missing) = assess_predicates(&rule.check, facts);
                let status = if !bad.is_empty() {
                    if rule.kind == "safety_guardrail" {
                        "deployment_hold"
                    } else {
                        "gap_for_review"
                    }
                } else if !missing.is_empty() {
                    "needs_evidence"
                } else {
                    "evidence_indicates_satisfied"
                };
                (status, bad, missing)
            };
            *summary.entry(status.to_string()).or_insert(0) += 1;
            let applicability = predicate_steps(&rule.when, facts);
            proofs.push(RuleProof {
                rule_id: rule.id.clone(),
                rule_kind: rule.kind.clone(),
                applicability_operator: "all".into(),
                applicability,
                requirements_evaluated,
                requirement_operator: "all".into(),
                requirements: if requirements_evaluated {
                    predicate_steps(&rule.check, facts)
                } else {
                    Vec::new()
                },
                verdict: status.into(),
            });
            findings.push(Finding {
                rule_id: rule.id.clone(),
                title: rule.title.clone(),
                classification: rule.kind.clone(),
                status: status.into(),
                priority: rule.priority.clone(),
                accountable_owner: rule.accountable_owner.clone(),
                missing_facts: missing,
                mismatched_facts: bad,
                source_refs: rule.source_refs.clone(),
                source_details: rule
                    .source_refs
                    .iter()
                    .filter_map(|id| self.source(id).cloned())
                    .collect(),
                source_review_required: review.checks.iter().any(|check| {
                    rule.source_refs.contains(&check.source_id) && check.review_required
                }),
                recommended_action: rule.recommended_action.clone(),
                rationale: rule.rationale.clone(),
            });
        }
        Ok(Assessment {
            knowledgebase_version: self.rules.kb_version.clone(), classification: "public_advisory_assessment".into(),
            legal_certification: false, deployment_authorization: false,
            data_handling: "Whitelisted Boolean self-attestations only; evidence is not authenticated. The engine does not persist supplied facts. Hosts must minimize intake and logging.".into(),
            findings, summary,
            review_required: "Human/legal verification of evidence, Washington law and campus conditions is mandatory. Unknown is never a compliance pass.".into(),
            source_review:review,
            reasoning_certificate:ReasoningCertificate {specification:"stm-conjunctive-1".into(),engine_version:env!("CARGO_PKG_VERSION").into(),
                knowledgebase_version:self.rules.kb_version.clone(),knowledge_sha256:self.knowledge_sha256(),assertions_authenticated:false,
                asserted_facts:facts.iter().map(|(k,v)|(k.clone(),v.as_bool().expect("validated Boolean fact"))).collect(),rule_proofs:proofs},
        })
    }

    pub fn knowledge_sha256(&self) -> String {
        let payload = json!({"rule_register":self.rules,"scenarios":self.scenarios,"controls":self.controls,
            "sources":self.sources,"relations":self.relations,"source_reviews":self.source_reviews,"fact_catalog":self.fact_catalog});
        format!(
            "{:x}",
            Sha256::digest(
                serde_json::to_vec(&payload).expect("validated JSON knowledge serializes")
            )
        )
    }
    pub fn review_report(&self, as_of: Option<&str>) -> Result<SourceReviewReport, String> {
        let date = crate::currency::Date::parse(as_of.unwrap_or(&self.rules.rules_reviewed_as_of))?;
        let checks: Vec<_> = self
            .source_reviews
            .sources
            .iter()
            .map(|r| crate::currency::source_check(r, date))
            .collect();
        Ok(SourceReviewReport {
            as_of_utc: date.iso(),
            review_required: checks.iter().any(|c| c.review_required),
            independent_acceptance: false,
            checks,
            as_of_basis: if as_of.is_some() {
                "explicit_evaluation_date"
            } else {
                "knowledgebase_reference_date_not_wall_clock"
            }
            .into(),
        })
    }
    pub fn provenance_for(&self, id: &str) -> (Vec<String>, Vec<Source>, String) {
        if !crate::privacy::knowledge_id(id) {
            return (Vec::new(), Vec::new(), "no_direct_source_mapping".into());
        }
        let fact_name = id
            .to_ascii_lowercase()
            .strip_prefix("fact-")
            .map(|name| name.replace('-', "_"));
        let fact = fact_name
            .as_deref()
            .and_then(|name| self.fact_catalog.facts.iter().find(|f| f.fact == name));
        let rule = self
            .rules
            .rules
            .iter()
            .find(|r| r.id.eq_ignore_ascii_case(id));
        let mut refs = BTreeSet::new();
        if let Some(fact) = fact {
            refs.extend(fact.source_refs.iter().cloned());
        } else if let Some(rule) = rule {
            refs.extend(rule.source_refs.iter().cloned());
        } else if let Some(source) = self.source(id) {
            refs.insert(source.id.clone());
        } else {
            let mut scenarios = BTreeSet::new();
            if let Some(scenario) = self
                .scenarios
                .iter()
                .find(|s| s.id.eq_ignore_ascii_case(id))
            {
                scenarios.insert(scenario.id.clone());
            }
            for edge in &self.relations {
                if edge.to.eq_ignore_ascii_case(id) && edge.relation == "mitigated_by" {
                    scenarios.insert(edge.from.clone());
                }
            }
            for edge in &self.relations {
                if scenarios.contains(&edge.from) && edge.relation == "governed_by" {
                    if let Some(rule) = self.rules.rules.iter().find(|r| r.id == edge.to) {
                        refs.extend(rule.source_refs.iter().cloned());
                    }
                }
            }
        }
        let refs: Vec<_> = refs.into_iter().collect();
        let details = refs
            .iter()
            .filter_map(|id| self.source(id).cloned())
            .collect();
        let scope = if fact.is_some() {
            "declared_fact_sources"
        } else if rule.is_some() {
            "declared_rule_sources"
        } else if self.source(id).is_some() {
            "source_record"
        } else if refs.is_empty() {
            "no_direct_source_mapping"
        } else {
            "thematic_governance_trace_not_effectiveness_evidence"
        };
        (refs, details, scope.into())
    }
    pub fn trace(&self, id: &str) -> Value {
        if !crate::privacy::knowledge_id(id) {
            return json!({"error":"Invalid knowledge ID; input redacted"});
        }
        let edges: Vec<&Relation> = self
            .relations
            .iter()
            .filter(|e| e.from.eq_ignore_ascii_case(id) || e.to.eq_ignore_ascii_case(id))
            .collect();
        json!({"item":self.explain(id),"relations":edges,"version":self.rules.kb_version,"traversal":"direct_adjacent_relations",
            "warning":"Relationships are engineering hypotheses/trace links, not measured causal effectiveness."})
    }
    pub fn source(&self, id: &str) -> Option<&Source> {
        self.sources.iter().find(|s| s.id.eq_ignore_ascii_case(id))
    }
    pub fn explain(&self, id: &str) -> Value {
        if !crate::privacy::knowledge_id(id) {
            return json!({"error":"Invalid knowledge ID; input redacted"});
        }
        let with_provenance = |mut record: Value| {
            let (refs, details, scope) = self.provenance_for(id);
            record["source_refs"] = json!(refs);
            record["source_details"] = json!(details);
            record["provenance_scope"] = json!(scope);
            record["legal_certification"] = json!(false);
            record
        };
        if let Some(name) = id.to_ascii_lowercase().strip_prefix("fact-") {
            let fact = name.replace('-', "_");
            if let Some(definition) = self.fact_catalog.facts.iter().find(|d| d.fact == fact) {
                return with_provenance(json!({"kind":"fact_definition","item":definition}));
            }
        }
        if let Some(s) = self
            .scenarios
            .iter()
            .find(|x| x.id.eq_ignore_ascii_case(id))
        {
            return with_provenance(
                json!({"kind":"threat_scenario","item":s,"source":"governance/threat_scenarios_v17_0.json"}),
            );
        }
        if let Some(c) = self.controls.iter().find(|x| x.id.eq_ignore_ascii_case(id)) {
            return with_provenance(
                json!({"kind":"control","item":c,"source":"governance/control_requirements_v17_0.json"}),
            );
        }
        if let Some(r) = self
            .rules
            .rules
            .iter()
            .find(|x| x.id.eq_ignore_ascii_case(id))
        {
            return with_provenance(json!({"kind":"rule","item":r}));
        }
        if let Some(s) = self.source(id) {
            return with_provenance(json!({"kind":"source","item":s}));
        }
        json!({"error":"Unknown knowledge ID; input redacted"})
    }
}

fn assess_predicates(predicates: &[Predicate], facts: &Facts) -> (Vec<String>, Vec<String>) {
    let mut mismatched = Vec::new();
    let mut missing = Vec::new();
    for pred in predicates {
        match facts.get(&pred.fact) {
            None => missing.push(pred.fact.clone()),
            Some(value) if value != &pred.equals => mismatched.push(pred.fact.clone()),
            _ => {}
        }
    }
    (mismatched, missing)
}

fn predicate_steps(predicates: &[Predicate], facts: &Facts) -> Vec<PredicateStep> {
    predicates
        .iter()
        .map(|p| {
            let expected = p.equals.as_bool().expect("validated Boolean predicate");
            let observed = facts.get(&p.fact).and_then(Value::as_bool);
            PredicateStep {
                fact: p.fact.clone(),
                expected,
                observed,
                outcome: match observed {
                    None => "unknown",
                    Some(v) if v == expected => "matched",
                    _ => "mismatched",
                }
                .into(),
            }
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn three_valued_missing_is_not_a_pass() {
        let pred = vec![Predicate {
            fact: "example".to_string(),
            equals: json!(true),
        }];
        let (bad, missing) = assess_predicates(&pred, &Facts::new());
        assert!(bad.is_empty());
        assert_eq!(missing, vec!["example"]);
    }
    #[test]
    fn failed_predicate_is_not_unknown() {
        let pred = vec![Predicate {
            fact: "example".to_string(),
            equals: json!(false),
        }];
        let mut f = Facts::new();
        f.insert("example".into(), json!(true));
        let (bad, missing) = assess_predicates(&pred, &f);
        assert_eq!(bad, vec!["example"]);
        assert!(missing.is_empty());
    }
}

#[cfg(test)]
mod acceptance_tests {
    use super::*;
    fn kb() -> KnowledgeBase {
        KnowledgeBase::embedded().expect("public bundled KB loads")
    }

    #[test]
    fn actual_shipped_rules_require_complete_scopes_and_typed_edges() {
        let mut knowledge = kb();
        assert_eq!(knowledge.rules.rules.len(), 18);
        assert!(knowledge
            .rules
            .rules
            .iter()
            .all(|r| !r.scope.trim().is_empty()));
        knowledge.rules.rules[0].scope.clear();
        assert!(knowledge.validate().is_err());
        let mut knowledge = kb();
        knowledge.relations[0].to = knowledge.rules.rules[0].id.clone();
        assert!(knowledge.validate().is_err());
        let mut knowledge = kb();
        knowledge.relations.push(knowledge.relations[0].clone());
        assert!(knowledge.validate().is_err());
    }

    #[test]
    fn missing_scope_cannot_deserialize_as_a_valid_rule() {
        let knowledge = kb();
        let mut rule = serde_json::to_value(&knowledge.rules.rules[0]).unwrap();
        rule.as_object_mut().unwrap().remove("scope");
        assert!(serde_json::from_value::<Rule>(rule).is_err());
    }

    #[test]
    fn every_rule_preserves_scope_unknowns_mismatches_and_false_requirements() {
        let knowledge = kb();
        for (index, rule) in knowledge.rules.rules.iter().enumerate() {
            let facts: Facts = rule
                .when
                .iter()
                .chain(&rule.check)
                .map(|p| (p.fact.clone(), p.equals.clone()))
                .collect();
            let assess = |facts: &Facts| {
                let result = knowledge.evaluate(facts).unwrap();
                assert!(!result.legal_certification);
                assert!(!result.deployment_authorization);
                result.findings[index].status.clone()
            };
            assert_eq!(
                assess(&facts),
                "evidence_indicates_satisfied",
                "{}",
                rule.id
            );
            for predicate in &rule.when {
                let mut incomplete = facts.clone();
                incomplete.remove(&predicate.fact);
                assert_eq!(assess(&incomplete), "scope_unknown", "{}", rule.id);
                let mut inapplicable = facts.clone();
                inapplicable.insert(
                    predicate.fact.clone(),
                    json!(!predicate.equals.as_bool().unwrap()),
                );
                assert_eq!(assess(&inapplicable), "not_applicable", "{}", rule.id);
            }
            if rule.check.len() > 1 {
                let mut mixed = facts.clone();
                mixed.remove(&rule.check[1].fact);
                mixed.insert(
                    rule.check[0].fact.clone(),
                    json!(!rule.check[0].equals.as_bool().unwrap()),
                );
                let expected = if rule.kind == "safety_guardrail" {
                    "deployment_hold"
                } else {
                    "gap_for_review"
                };
                assert_eq!(assess(&mixed), expected, "{}", rule.id);
            }
            for predicate in &rule.check {
                let mut incomplete = facts.clone();
                incomplete.remove(&predicate.fact);
                assert_eq!(assess(&incomplete), "needs_evidence", "{}", rule.id);
                let mut failed = facts.clone();
                failed.insert(
                    predicate.fact.clone(),
                    json!(!predicate.equals.as_bool().unwrap()),
                );
                let expected = if rule.kind == "safety_guardrail" {
                    "deployment_hold"
                } else {
                    "gap_for_review"
                };
                assert_eq!(assess(&failed), expected, "{}", rule.id);
            }
        }
    }

    #[test]
    fn rejected_fact_keys_and_ids_are_never_reflected() {
        let knowledge = kb();
        let marker = ["synthetic", "@", "example.invalid"].concat();
        let mut facts = Facts::new();
        facts.insert(marker.clone(), json!(true));
        assert!(!knowledge.evaluate(&facts).unwrap_err().contains(&marker));
        assert!(!knowledge.explain(&marker).to_string().contains(&marker));
        assert!(!knowledge.trace(&marker).to_string().contains(&marker));
        facts.clear();
        facts.insert("wa_public_school".into(), json!(marker));
        assert!(knowledge.evaluate(&facts).is_err());
    }

    #[test]
    fn search_and_agent_share_privacy_checks_and_unknown_topics_abstain() {
        let knowledge = kb();
        for query in [
            ["synthetic", "@", "example.invalid"].concat(),
            "student id 1234567".into(),
            "555-123-4567".into(),
            ["drive:", "\\", "Users", "\\", "synthetic", "\\", "file"].concat(),
        ] {
            assert!(knowledge.search(&query, 8).is_err());
            assert!(knowledge.ask_for_role(&query, "general").is_err());
        }
        assert!(!knowledge.search("AI", 8).unwrap().is_empty());
        let response = knowledge
            .ask_for_role("xylophonicalquasar", "auditor")
            .unwrap();
        assert!(response.recommendations.is_empty());
        assert!(response.caution.contains("No supported records"));
    }
}

#[cfg(test)]
mod source_reasoning_tests {
    use super::*;
    #[test]
    fn source_validity_is_explicit_and_does_not_override_logical_verdicts() {
        let mut kb = KnowledgeBase::embedded().unwrap();
        let review = kb
            .source_reviews
            .sources
            .iter_mut()
            .find(|r| r.source_id == "SRC-04")
            .unwrap();
        review.status = "reviewed".into();
        review.reviewed_on = Some("2026-10-01".into());
        review.valid_through = Some("2026-10-31".into());
        kb.validate().unwrap();
        let status = |date: &str| {
            kb.review_report(Some(date))
                .unwrap()
                .checks
                .into_iter()
                .find(|r| r.source_id == "SRC-04")
                .unwrap()
                .status
        };
        assert_eq!(status("2026-10-31"), "current");
        assert_eq!(status("2026-11-01"), "expired");
        assert_eq!(status("2026-09-30"), "review_date_in_future");
        kb.source_reviews.sources[0].status = "conflict".into();
        assert_eq!(
            kb.review_report(Some("2026-10-26")).unwrap().checks[0].status,
            "conflict"
        );
        kb.source_reviews.sources[0].status = "withdrawn".into();
        assert_eq!(
            kb.review_report(Some("2026-10-26")).unwrap().checks[0].status,
            "withdrawn"
        );
        assert!(kb
            .evaluate_with_context(&Facts::new(), Some("2026-02-30"), None)
            .is_err());
        assert!(kb
            .evaluate_with_context(&Facts::new(), None, Some("unavailable-version"))
            .is_err());
    }
    #[test]
    fn contradictory_or_duplicate_predicates_and_invalid_source_reviews_fail_loading() {
        let mut kb = KnowledgeBase::embedded().unwrap();
        let duplicate = kb.rules.rules[0].check[0].clone();
        kb.rules.rules[0].check.push(duplicate);
        assert!(kb.validate().is_err());
        let mut kb = KnowledgeBase::embedded().unwrap();
        let mut opposite = kb.rules.rules[0].when[0].clone();
        opposite.equals = json!(false);
        kb.rules.rules[0].check.push(opposite);
        assert!(kb.validate().is_err());
        let mut kb = KnowledgeBase::embedded().unwrap();
        kb.source_reviews.sources[0].status = "reviewed".into();
        assert!(kb.validate().is_err());
    }
}
