use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::BTreeMap;

fn fixed_string<'de, D: serde::Deserializer<'de>>(
    deserializer: D,
    expected: &str,
) -> Result<String, D::Error> {
    let value = String::deserialize(deserializer)?;
    if value != expected {
        return Err(serde::de::Error::custom("Unsupported register version"));
    }
    Ok(value)
}
fn publication_version<'de, D: serde::Deserializer<'de>>(
    deserializer: D,
) -> Result<String, D::Error> {
    fixed_string(deserializer, "17.0")
}
fn register_date<'de, D: serde::Deserializer<'de>>(deserializer: D) -> Result<String, D::Error> {
    let value = String::deserialize(deserializer)?;
    crate::currency::Date::parse(&value)
        .map_err(|_| serde::de::Error::custom("Invalid register date"))?;
    Ok(value)
}
fn public_release<'de, D: serde::Deserializer<'de>>(deserializer: D) -> Result<bool, D::Error> {
    if !bool::deserialize(deserializer)? {
        return Err(serde::de::Error::custom("Public release flag required"));
    }
    Ok(true)
}
fn no_deployment_certification<'de, D: serde::Deserializer<'de>>(
    deserializer: D,
) -> Result<bool, D::Error> {
    if bool::deserialize(deserializer)? {
        return Err(serde::de::Error::custom(
            "Deployment certification forbidden",
        ));
    }
    Ok(false)
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Source {
    pub id: String,
    pub title: String,
    pub url: String,
    pub interpretation: String,
}
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SourceRegister {
    #[serde(deserialize_with = "register_date")]
    pub retrieved: String,
    pub sources: Vec<Source>,
}
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LegalRegister {
    #[serde(deserialize_with = "register_date")]
    pub reviewed_on: String,
    pub legal_sources: Vec<Source>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SourceReview {
    pub source_id: String,
    pub status: String,
    pub reviewed_on: Option<String>,
    pub valid_through: Option<String>,
    pub evidence_locator: String,
    pub review_note: String,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SourceReviewRegister {
    pub schema_version: String,
    pub kb_version: String,
    pub policy: String,
    pub sources: Vec<SourceReview>,
}
#[derive(Clone, Debug, Serialize)]
pub struct SourceReviewCheck {
    pub source_id: String,
    pub status: String,
    pub review_required: bool,
    pub evidence_locator: String,
    pub note: String,
}
#[derive(Clone, Debug, Serialize)]
pub struct SourceReviewReport {
    pub as_of_utc: String,
    pub review_required: bool,
    pub independent_acceptance: bool,
    pub checks: Vec<SourceReviewCheck>,
    pub as_of_basis: String,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FactDefinition {
    pub fact: String,
    pub true_means: String,
    pub false_means: String,
    pub evidence_required: String,
    pub rule_refs: Vec<String>,
    pub source_refs: Vec<String>,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FactCatalog {
    pub schema_version: String,
    pub kb_version: String,
    pub review_status: String,
    pub facts: Vec<FactDefinition>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PredicateStep {
    pub fact: String,
    pub expected: bool,
    pub observed: Option<bool>,
    pub outcome: String,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RuleProof {
    pub rule_id: String,
    pub rule_kind: String,
    pub applicability_operator: String,
    pub applicability: Vec<PredicateStep>,
    pub requirements_evaluated: bool,
    pub requirement_operator: String,
    pub requirements: Vec<PredicateStep>,
    pub verdict: String,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReasoningCertificate {
    pub specification: String,
    pub engine_version: String,
    pub knowledgebase_version: String,
    pub knowledge_sha256: String,
    pub assertions_authenticated: bool,
    pub asserted_facts: BTreeMap<String, bool>,
    pub rule_proofs: Vec<RuleProof>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Scenario {
    pub id: String,
    pub threat: String,
    pub classification: String,
    pub observable_signal: String,
    pub objective: String,
    pub countermeasure: String,
    pub owner: String,
    pub verification_method: String,
    pub metric: String,
    pub evidence_label: String,
    pub rights_gate: String,
    pub stop_condition: String,
}
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ScenarioRegister {
    #[serde(deserialize_with = "publication_version")]
    pub version: String,
    #[serde(deserialize_with = "public_release")]
    pub public_release: bool,
    #[serde(deserialize_with = "no_deployment_certification")]
    pub deployment_certified: bool,
    pub scenarios: Vec<Scenario>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Control {
    pub id: String,
    pub name: String,
    pub objective: String,
    pub required_evidence: String,
    pub owner: String,
    pub hard_stop: String,
}
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ControlRegister {
    #[serde(deserialize_with = "publication_version")]
    pub version: String,
    pub controls: Vec<Control>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Predicate {
    pub fact: String,
    pub equals: Value,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Rule {
    pub id: String,
    pub title: String,
    pub kind: String,
    pub jurisdiction: String,
    pub scope: String,
    pub when: Vec<Predicate>,
    pub check: Vec<Predicate>,
    pub source_refs: Vec<String>,
    pub accountable_owner: String,
    pub recommended_action: String,
    pub rationale: String,
    pub priority: String,
}
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RuleRegister {
    pub reasoning_specification: String,
    pub schema_version: String,
    pub review_status: String,
    pub kb_version: String,
    pub source_proposal: String,
    pub rules_reviewed_as_of: String,
    pub legal_status: String,
    pub rules: Vec<Rule>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Relation {
    pub from: String,
    pub to: String,
    pub relation: String,
    pub basis: String,
}
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RelationRegister {
    pub version: String,
    pub edges: Vec<Relation>,
}

pub type Facts = BTreeMap<String, Value>;
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AssessmentInput {
    pub site_label: Option<String>, // A generic label only; never a student identifier.
    pub facts: Facts,
    pub as_of: Option<String>,
    pub expected_kb_version: Option<String>,
}
#[derive(Clone, Debug, Serialize)]
pub struct Finding {
    pub rule_id: String,
    pub title: String,
    pub classification: String,
    pub status: String,
    pub priority: String,
    pub accountable_owner: String,
    pub missing_facts: Vec<String>,
    pub mismatched_facts: Vec<String>,
    pub source_refs: Vec<String>,
    pub source_details: Vec<Source>,
    pub source_review_required: bool,
    pub recommended_action: String,
    pub rationale: String,
}
#[derive(Clone, Debug, Serialize)]
pub struct Assessment {
    pub knowledgebase_version: String,
    pub classification: String,
    pub legal_certification: bool,
    pub deployment_authorization: bool,
    pub data_handling: String,
    pub findings: Vec<Finding>,
    pub summary: BTreeMap<String, usize>,
    pub review_required: String,
    pub source_review: SourceReviewReport,
    pub reasoning_certificate: ReasoningCertificate,
}
#[derive(Clone, Debug, Serialize)]
pub struct SearchHit {
    pub id: String,
    pub kind: String,
    pub title: String,
    pub description: String,
    pub relevance: u32,
    pub source_refs: Vec<String>,
    pub source_details: Vec<Source>,
    pub provenance_scope: String,
}
#[derive(Clone, Debug, Serialize)]
pub struct AgentResponse {
    pub engine_version: String,
    pub knowledge_sha256: String,
    pub logical_verdicts_included: bool,
    pub reasoning_available_via: String,
    pub audience: String,
    pub question: String,
    pub workflow: Vec<String>,
    pub recommendations: Vec<SearchHit>,
    pub caution: String,
    pub next_human_action: String,
    pub citations_available_via: String,
    pub source_review: SourceReviewReport,
}
