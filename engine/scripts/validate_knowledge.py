#!/usr/bin/env python3
"""Offline authoring checks for the v17 neurosymbolic KB. Does not execute Rust."""
import json, sys
from pathlib import Path
root=Path(__file__).resolve().parents[2]
read=lambda p:json.loads((root/p).read_text(encoding='utf-8'))
scenarios=read('governance/threat_scenarios_v17_0.json')['scenarios']
controls=read('governance/control_requirements_v17_0.json')['controls']
sources=read('governance/public_sources_v17_0.json')['sources']+read('engine/kb/verified_legal_sources.json')['legal_sources']
rules=read('engine/kb/rules_v17_0.json')['rules']
edges=read('engine/kb/relations_v17_0.json')['edges']
ids=[x['id'] for x in scenarios+controls+rules]
sources_ids=[x['id'] for x in sources]
assert len(scenarios)==18 and len(controls)==15 and len(rules)==18 and len(edges)==54
assert len(ids)==len(set(ids)), 'Duplicate KB IDs'
assert len(sources_ids)==len(set(sources_ids)), 'Duplicate sources'
assert {s['id'] for s in scenarios}=={f'T{i:02}' for i in range(1,19)}
assert all(s['rights_gate'] and s['stop_condition'] and s['verification_method'] for s in scenarios)
assert all(c['hard_stop'] and c['required_evidence'] for c in controls)
for e in edges:
 assert e['from'] in ids and e['to'] in ids, e
 assert e['relation'] in ('governed_by','mitigated_by')
for scenario in scenarios:
 assert any(e['from']==scenario['id'] and e['relation']=='mitigated_by' for e in edges), scenario['id']
for rule in rules:
 assert rule['source_refs'] and set(rule['source_refs']).issubset(set(sources_ids)), rule['id']
 assert rule['check'] and all(isinstance(x['equals'],bool) for x in rule['check']+rule['when']),rule['id']
 assert rule['kind'] in {'statutory_reference','safety_guardrail','deployment_qualification','voluntary_recommendation'}
 assert rule['recommended_action'] and rule['accountable_owner']

# An independent reference implementation of the Boolean rules for fixture parity checks.
def interpret(rule,facts):
 def inspect(preds):
  missing=[p['fact'] for p in preds if p['fact'] not in facts]
  bad=[p['fact'] for p in preds if p['fact'] in facts and facts[p['fact']]!=p['equals']]
  return bad,missing
 bad,missing=inspect(rule['when'])
 if bad: return 'not_applicable'
 if missing: return 'scope_unknown'
 bad,missing=inspect(rule['check'])
 if bad: return 'deployment_hold' if rule['kind']=='safety_guardrail' else 'gap_for_review'
 if missing: return 'needs_evidence'
 return 'evidence_indicates_satisfied'

by_id={r['id']:r for r in rules}
assert interpret(by_id['WA-1242'],{})=='scope_unknown'
assert interpret(by_id['WA-1242'],{'external_security_provider':False})=='not_applicable'
assert interpret(by_id['WA-1242'],{'external_security_provider':True})=='needs_evidence'
assert interpret(by_id['G-004'],{'egress_obstructed_by_security':True})=='deployment_hold'
assert interpret(by_id['G-004'],{'egress_obstructed_by_security':False})=='evidence_indicates_satisfied'
sample=read('engine/examples/district_aggregate.json')['facts']
assert all(isinstance(v,bool) for v in sample.values())
assert interpret(by_id['WA-1242'],sample)=='gap_for_review'
for s in sources:assert s['url'].startswith('https://')
print(f'PASS: {len(scenarios)} scenarios, {len(controls)} controls, {len(edges)} edges, {len(rules)} rules, {len(sources)} sources; synthetic inference checks PASS.')
print('NOTE: Rust compilation, MCP interoperability and site-specific compliance not tested by this validator.')
