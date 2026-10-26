use crate::engine::KnowledgeBase;
use crate::model::*;
use std::collections::HashSet;

fn words(text: &str) -> Vec<String> {
    text.to_lowercase().split(|c: char| !c.is_alphanumeric())
        .filter(|w| w.len() >= 3).map(str::to_owned).collect()
}
fn expansion(q: &str) -> Vec<String> {
    let mut terms: HashSet<String> = words(q).into_iter().collect();
    for (a,b) in [
        ("gun","firearm"),("guns","firearm"),("weapon","firearm"),
        ("lockdown","egress"),("shooting","threat"),("police","security"),
        ("ai","artificial"),("cyber","cybersecurity"),("dog","canine"),
        ("rights","constitutional"),("safe","safety"),
        ("school","campus"),("storage","firearm"),
    ] {
        if terms.contains(a) {terms.insert(b.to_string());}
    }
    let mut out:Vec<String>=terms.into_iter().collect();out.sort();out
}
fn score(terms: &[String],title: &str, description: &str) -> u32 {
    let title_words=words(title);
    let description_words=words(description);
    terms.iter().map(|t| {
        let head=title_words.iter().filter(|x| *x == t).count() as u32;
        let body=description_words.iter().filter(|x| *x == t).count() as u32;
        head.saturating_mul(8)+body.min(6)
    }).sum()
}
impl KnowledgeBase {
    pub fn search(&self, query: &str, limit: usize) -> Vec<SearchHit> {
        let terms=expansion(query);
        if terms.is_empty() {return Vec::new();}
        let mut hits = Vec::new();
        for s in &self.scenarios {
            let description=format!("{} {} {} {} {} {}",s.observable_signal,s.objective,s.countermeasure,s.verification_method,s.rights_gate,s.stop_condition);
            let relevance=score(&terms,&s.threat,&description);
            if relevance>0 {hits.push(SearchHit{id:s.id.clone(),kind:"scenario".into(),title:s.threat.clone(),description:s.countermeasure.clone(),relevance});}
        }
        for c in &self.controls {
            let description=format!("{} {} {}",c.objective,c.required_evidence,c.hard_stop);
            let relevance=score(&terms,&c.name,&description);
            if relevance>0 {hits.push(SearchHit{id:c.id.clone(),kind:"control".into(),title:c.name.clone(),description:c.objective.clone(),relevance});}
        }
        for r in &self.rules.rules {
            let description=format!("{} {} {}",r.rationale,r.recommended_action,r.accountable_owner);
            let relevance=score(&terms,&r.title,&description);
            if relevance>0 {hits.push(SearchHit{id:r.id.clone(),kind:"rule".into(),title:r.title.clone(),description:r.recommended_action.clone(),relevance});}
        }
        for s in &self.sources {
            let relevance=score(&terms,&s.title,&s.interpretation);
            if relevance>0 {hits.push(SearchHit{id:s.id.clone(),kind:"source".into(),title:s.title.clone(),description:s.interpretation.clone(),relevance});}
        }
        hits.sort_by(|a,b| b.relevance.cmp(&a.relevance).then(a.id.cmp(&b.id)));
        hits.truncate(limit.min(20));hits
    }
}
#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn tokenizer_avoids_empty_tokens() {
        assert!(words("... !!").is_empty());
        assert_eq!(words("Firearm-storage"),vec!["firearm","storage"]);
    }
}
