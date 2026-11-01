use crate::engine::KnowledgeBase;
use crate::model::*;

/// A deterministic, read-only multi-stage planner. External LLM hosts can
/// invoke the same functions via MCP, but never supply or rewrite rule outcomes.
impl KnowledgeBase {
    pub fn ask_for_role(&self, question: &str, role: &str) -> Result<AgentResponse, String> {
        let role = role.to_lowercase();
        if ![
            "general",
            "administrator",
            "educator",
            "policymaker",
            "auditor",
        ]
        .contains(&role.as_str())
        {
            return Err("Unsupported presentation audience (not an authorization role)".into());
        }
        let question = question.trim();
        crate::privacy::public_query(question)?;
        let workflow=vec![
            "Planner: identify threat topics in public question".into(),
            "Retriever: rank versioned scenarios, controls, rules and sources".into(),
            "Rule reasoning: call kb_assess with approved facts; retrieval alone does not establish a verdict".into(),
            "Human reviewer: obtain district- and site-specific facts before any compliance conclusion".into(),
        ];
        let recommendations = self.search(question, 8)?;
        let next_human_action=match role.as_str(){
            "administrator"=>"Verify the campus facts and local policies, review evidence with counsel, then document an accountable human decision.",
            "educator"=>"Use the source records to raise questions with the designated school safety team; do not submit student details here.",
            "policymaker"=>"Check statutory scope and measured evidence, obtain community and legal review, and define public accountability metrics.",
            "auditor"=>"Inspect the source and verification IDs, request non-identifying proof, and record unresolved gaps and adverse consequences.",
            _=>"Open cited IDs with explain/trace, verify source material, and use assess only with anonymous aggregate booleans.",
        };
        let caution = if recommendations.is_empty() {
            "No supported records found. Obtain qualified human review; no conclusion can be drawn."
        } else {
            "Retrieved draft proposals; independent review pending. Not findings about a person or campus, enforcement authority, or legal certification."
        };
        Ok(AgentResponse {
            engine_version: env!("CARGO_PKG_VERSION").into(),
            knowledge_sha256: self.knowledge_sha256(),
            logical_verdicts_included: false,
            reasoning_available_via:
                "MCP kb_assess or CLI assess; replay with stm-tool verify-proof".into(),
            audience: role.clone(),
            question: "Public question processed in memory; original text not echoed".into(),
            workflow,
            recommendations,
            caution: caution.into(),
            next_human_action: next_human_action.into(),
            citations_available_via: "explain <ID> or MCP kb_explain".into(),
            source_review: self.review_report(None)?,
        })
    }
}
