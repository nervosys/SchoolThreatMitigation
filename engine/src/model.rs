use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::BTreeMap;

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Source {
    pub id: String,
    pub title: String,
    pub url: String,
    pub interpretation: String,
}
#[derive(Clone, Debug, Deserialize)]
pub struct SourceRegister { pub sources: Vec<Source> }
#[derive(Clone, Debug, Deserialize)]
pub struct LegalRegister { pub legal_sources: Vec<Source> }

#[derive(Clone, Debug, Serialize, Deserialize)]
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
pub struct ScenarioRegister { pub scenarios: Vec<Scenario> }

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Control {
    pub id: String,
    pub name: String,
    pub objective: String,
    pub required_evidence: String,
    pub owner: String,
    pub hard_stop: String,
}
#[derive(Clone, Debug, Deserialize)]
pub struct ControlRegister { pub controls: Vec<Control> }

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Predicate { pub fact: String, pub equals: Value }
#[derive(Clone, Debug, Serialize, Deserialize)]
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
#[derive(Clone, Debug, Deserialize)]
pub struct RuleRegister {
    pub kb_version: String,
    pub source_proposal: String,
    pub rules_reviewed_as_of: String,
    pub legal_status: String,
    pub rules: Vec<Rule>,
}

#[derive(Clone, Debug, Serialize, Deserialize)]
pub struct Relation {
    pub from: String,
    pub to: String,
    pub relation: String,
    pub basis: String,
}
#[derive(Clone, Debug, Deserialize)]
pub struct RelationRegister { pub edges: Vec<Relation> }

pub type Facts = BTreeMap<String, Value>;
#[derive(Clone, Debug, Deserialize)]
pub struct AssessmentInput {
    pub site_label: Option<String>, // A generic label only; never a student identifier.
    pub facts: Facts,
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
}
#[derive(Clone, Debug, Serialize)]
pub struct SearchHit {
    pub id: String,
    pub kind: String,
    pub title: String,
    pub description: String,
    pub relevance: u32,
}
#[derive(Clone, Debug, Serialize)]
pub struct AgentResponse {
    pub audience: String,
    pub question: String,
    pub workflow: Vec<String>,
    pub recommendations: Vec<SearchHit>,
    pub caution: String,
    pub next_human_action: String,
    pub citations_available_via: String,
}
