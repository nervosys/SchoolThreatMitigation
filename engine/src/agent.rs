use crate::engine::KnowledgeBase;
use crate::model::*;

/// A deterministic, read-only multi-stage planner. External LLM hosts can
/// invoke the same functions via MCP, but never supply or rewrite rule outcomes.
impl KnowledgeBase {
    pub fn ask(&self, question: &str) -> Result<AgentResponse,String> {
        self.ask_for_role(question, "general")
    }
    pub fn ask_for_role(&self, question: &str, role: &str) -> Result<AgentResponse,String> {
        let role=role.to_lowercase();
        if !["general","administrator","educator","policymaker","auditor"].contains(&role.as_str()) {
            return Err("Unsupported presentation audience (not an authorization role)".into());
        }
        let question=question.trim();
        if question.is_empty() || question.len()>2400 { return Err("Question must be 1–2400 characters".into()); }
        let lowered=question.to_lowercase();
        let personal_markers=["student id", "pupil id", "social security", "date of birth", "home address", "serial number"];
        let suspicious_digits=question.chars().fold((0usize,0usize), |(current,maximum), c| {
            let n=if c.is_ascii_digit(){current+1}else{0};(n,maximum.max(n))
        }).1;
        if question.contains('@') || suspicious_digits>=7 || personal_markers.iter().any(|t|lowered.contains(t)) {
            return Err("Public questions only; remove person-specific or identifying information".into());
        }
        let workflow=vec![
            "Planner: identify threat topics in public question".into(),
            "Retriever: rank versioned scenarios, controls, rules and sources".into(),
            "Verifier: make all evidence limitations and rights guardrails visible".into(),
            "Human reviewer: obtain district- and site-specific facts before any compliance conclusion".into(),
        ];
        let recommendations=self.search(question,8);
        let next_human_action=match role.as_str(){
            "administrator"=>"Verify the campus facts and local policies, review evidence with counsel, then document an accountable human decision.",
            "educator"=>"Use the source records to raise questions with the designated school safety team; do not submit student details here.",
            "policymaker"=>"Check statutory scope and measured evidence, obtain community and legal review, and define public accountability metrics.",
            "auditor"=>"Inspect the source and verification IDs, request non-identifying proof, and record unresolved gaps and adverse consequences.",
            _=>"Open cited IDs with explain/trace, verify source material, and use assess only with anonymous aggregate booleans.",
        };
        Ok(AgentResponse{
            audience:role.clone(),
            question: "Public question processed in memory; original text not echoed".into(),workflow,recommendations,
            caution:"These are retrieved proposal records, not findings about an actual student, campus, or firearm owner. No automatic enforcement, force, lockdown or legal certification.".into(),
            next_human_action:next_human_action.into(),
            citations_available_via:"explain <ID> or MCP kb_explain".into(),
        })
    }
}
