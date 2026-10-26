use crate::model::*;
use serde::de::DeserializeOwned;
use serde_json::{json, Value};
use std::collections::{BTreeMap, HashSet};
use std::fs;
use std::path::{Path, PathBuf};

pub struct KnowledgeBase {
    pub rules: RuleRegister,
    pub scenarios: Vec<Scenario>,
    pub controls: Vec<Control>,
    pub sources: Vec<Source>,
    pub relations: Vec<Relation>,
}

fn read_json<T: DeserializeOwned>(path: &Path) -> Result<T, String> {
    let data = fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
    serde_json::from_str(&data).map_err(|e| format!("{}: {e}", path.display()))
}

impl KnowledgeBase {
    pub fn load(root: &Path) -> Result<Self, String> {
        let governance: PathBuf = root.join("governance");
        let kbdir = root.join("engine/kb");
        let rules: RuleRegister = read_json(&kbdir.join("rules_v17_0.json"))?;
        let scenarios: ScenarioRegister = read_json(&governance.join("threat_scenarios_v17_0.json"))?;
        let controls: ControlRegister = read_json(&governance.join("control_requirements_v17_0.json"))?;
        let mut sources: SourceRegister = read_json(&governance.join("public_sources_v17_0.json"))?;
        let legal: LegalRegister = read_json(&kbdir.join("verified_legal_sources.json"))?;
        sources.sources.extend(legal.legal_sources);
        let graph: RelationRegister = read_json(&kbdir.join("relations_v17_0.json"))?;
        let kb = Self { rules, scenarios: scenarios.scenarios, controls: controls.controls, sources: sources.sources, relations: graph.edges };
        kb.validate()?;
        Ok(kb)
    }
    pub fn validate(&self) -> Result<(), String> {
        let mut ids = HashSet::new();
        let mut source_ids = HashSet::new();
        for source in &self.sources {
            if !source_ids.insert(source.id.as_str()) { return Err(format!("Duplicate source ID: {}", source.id)); }
            if !source.url.starts_with("https://") { return Err(format!("Insecure or malformed source URL: {}", source.id)); }
        }
        for scenario in &self.scenarios {
            if !ids.insert(scenario.id.as_str()) { return Err(format!("Duplicate scenario: {}",scenario.id)); }
            if scenario.rights_gate.is_empty() || scenario.stop_condition.is_empty() {
                return Err(format!("Missing rights/stop condition: {}",scenario.id));
            }
        }
        for control in &self.controls {
            if !ids.insert(control.id.as_str()) { return Err(format!("Duplicate control: {}",control.id)); }
        }
        for rule in &self.rules.rules {
            if !ids.insert(rule.id.as_str()) { return Err(format!("Duplicate rule: {}",rule.id)); }
            if rule.check.is_empty() || rule.source_refs.is_empty() {return Err(format!("Uncheckable or uncited rule: {}",rule.id));}
            for reference in &rule.source_refs {
                if !source_ids.contains(reference.as_str()) {return Err(format!("Missing source {} for rule {}",reference,rule.id));}
            }
            for pred in rule.when.iter().chain(rule.check.iter()) {
                if pred.fact.trim().is_empty() || !pred.equals.is_boolean() {
                    return Err(format!("Unsupported predicate in {}", rule.id));
                }
            }
        }
        for edge in &self.relations {
            if !ids.contains(edge.from.as_str()) || !ids.contains(edge.to.as_str()) {
                return Err(format!("Dangling graph reference {} -> {}",edge.from,edge.to));
            }
            if edge.relation != "mitigated_by" && edge.relation != "governed_by" {
                return Err(format!("Unsupported relation: {}",edge.relation));
            }
        }
        for scenario in &self.scenarios {
            if !self.relations.iter().any(|e|e.from == scenario.id && e.relation=="mitigated_by") {
                return Err(format!("Threat has no mapped defensive control: {}",scenario.id));
            }
        }
        Ok(())
    }
    pub fn admissible_facts(&self) -> HashSet<&str> {
        self.rules.rules.iter().flat_map(|r| r.when.iter().chain(r.check.iter()).map(|p| p.fact.as_str())).collect()
    }
    pub fn inspect_input(&self, facts: &Facts) -> Result<(), String> {
        if facts.len() > 80 { return Err("Too many facts: only aggregate, rule-defined facts allowed".into()); }
        let admissible = self.admissible_facts();
        for (key, value) in facts {
            if !admissible.contains(key.as_str()) { return Err(format!("Fact not on public aggregate whitelist: {key}")); }
            if !value.is_boolean() { return Err(format!("Non-boolean or potentially identifying fact: {key}")); }
        }
        Ok(())
    }
    pub fn evaluate(&self, facts: &Facts) -> Result<Assessment, String> {
        self.inspect_input(facts)?;
        let mut findings = Vec::new();
        let mut summary = BTreeMap::new();
        for rule in &self.rules.rules {
            let (scope_bad, scope_missing) = assess_predicates(&rule.when, facts);
            let (status, bad, missing) = if !scope_bad.is_empty() {
                ("not_applicable", Vec::new(), Vec::new())
            } else if !scope_missing.is_empty() {
                ("scope_unknown", Vec::new(), scope_missing)
            } else {
                let (bad, missing) = assess_predicates(&rule.check, facts);
                let status = if !bad.is_empty() {
                    if rule.kind == "safety_guardrail" { "deployment_hold" } else { "gap_for_review" }
                } else if !missing.is_empty() { "needs_evidence" } else { "evidence_indicates_satisfied" };
                (status, bad, missing)
            };
            *summary.entry(status.to_string()).or_insert(0) += 1;
            findings.push(Finding {
                rule_id: rule.id.clone(), title: rule.title.clone(), classification: rule.kind.clone(),
                status: status.into(), priority: rule.priority.clone(), accountable_owner: rule.accountable_owner.clone(),
                missing_facts: missing, mismatched_facts: bad, source_refs: rule.source_refs.clone(),
                recommended_action: rule.recommended_action.clone(), rationale: rule.rationale.clone(),
            });
        }
        Ok(Assessment {
            knowledgebase_version: self.rules.kb_version.clone(), classification: "public_advisory_assessment".into(),
            legal_certification: false, deployment_authorization: false,
            data_handling: "No individual student or household records accepted; supplied facts are not persisted.".into(),
            findings, summary,
            review_required: "Human/legal verification of evidence, Washington law and campus conditions is mandatory. Unknown is never a compliance pass.".into(),
        })
    }
    pub fn trace(&self,id:&str)->Value {
        let edges:Vec<&Relation>=self.relations.iter().filter(|e|e.from.eq_ignore_ascii_case(id) || e.to.eq_ignore_ascii_case(id)).collect();
        json!({"item":self.explain(id),"relations":edges,"version":self.rules.kb_version,
            "warning":"Relationships are engineering hypotheses/trace links, not measured causal effectiveness."})
    }
    pub fn source(&self, id: &str) -> Option<&Source> {self.sources.iter().find(|s| s.id.eq_ignore_ascii_case(id))}
    pub fn explain(&self, id: &str) -> Value {
        if let Some(s) = self.scenarios.iter().find(|x| x.id.eq_ignore_ascii_case(id)) { return json!({"kind":"threat_scenario","item":s,"source":"governance/threat_scenarios_v17_0.json","legal_certification":false}); }
        if let Some(c) = self.controls.iter().find(|x| x.id.eq_ignore_ascii_case(id)) { return json!({"kind":"control","item":c,"source":"governance/control_requirements_v17_0.json","legal_certification":false}); }
        if let Some(r) = self.rules.rules.iter().find(|x| x.id.eq_ignore_ascii_case(id)) {
            let sources: Vec<&Source> = r.source_refs.iter().filter_map(|x|self.source(x)).collect();
            return json!({"kind":"rule","item":r,"source_details":sources,"legal_certification":false});
        }
        if let Some(s)=self.source(id) {return json!({"kind":"source","item":s});}
        json!({"error":format!("Unknown knowledge ID: {id}")})
    }
}

fn assess_predicates(predicates: &[Predicate], facts: &Facts) -> (Vec<String>, Vec<String>) {
    let mut mismatched = Vec::new(); let mut missing = Vec::new();
    for pred in predicates {
        match facts.get(&pred.fact) {
            None => missing.push(pred.fact.clone()),
            Some(value) if value != &pred.equals => mismatched.push(pred.fact.clone()),
            _ => {}
        }
    }
    (mismatched, missing)
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn three_valued_missing_is_not_a_pass() {
        let pred = vec![Predicate{fact:"example".to_string(),equals:json!(true)}];
        let (bad,missing)=assess_predicates(&pred,&Facts::new());
        assert!(bad.is_empty()); assert_eq!(missing,vec!["example"]);
    }
    #[test]
    fn failed_predicate_is_not_unknown() {
        let pred = vec![Predicate{fact:"example".to_string(),equals:json!(false)}];
        let mut f=Facts::new(); f.insert("example".into(),json!(true));
        let (bad,missing)=assess_predicates(&pred,&f);
        assert_eq!(bad,vec!["example"]);assert!(missing.is_empty());
    }
}
