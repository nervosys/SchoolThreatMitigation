#!/usr/bin/env python3
"""Check current release structure, required content, and exclusion of prior editions."""
from pathlib import Path
import json,csv,sys
root=Path(__file__).resolve().parents[1]
err=[]
pdfs=list((root/'docs/advisory-v17.0').glob('*.pdf'))
html=list((root/'docs/advisory-v17.0').glob('*.html'))
if len(pdfs)!=6 or len(html)!=6:err.append(f'expected 6 PDF/HTML pairs, found {len(pdfs)}/{len(html)}')
for p in html:
 if not p.with_suffix('.pdf').is_file():err.append('missing PDF: '+p.name)
 if '17.0' not in p.read_text(encoding='utf-8'):err.append('missing version: '+p.name)
q=json.loads((root/'governance/threat_scenarios_v17_0.json').read_text())
if len(q['scenarios'])!=18:err.append('scenario count is not 18')
c=json.loads((root/'governance/control_requirements_v17_0.json').read_text())
if len(c['controls'])!=15:err.append('control count is not 15')
if len({i['id'] for i in q['scenarios']})!=18:err.append('duplicate scenario IDs')
if len({i['id'] for i in c['controls']})!=15:err.append('duplicate control IDs')
if not (root/'media/v17.0/SchoolThreatMitigation_Briefing_V17_0.pptx').is_file():err.append('missing deck')
for path in root.rglob('*'):
 if path.is_file() and ('v16.0' in path.as_posix().lower() or 'v15.' in path.as_posix().lower()):err.append('obsolete named file: '+str(path))
for e in err:print('FAIL:',e)
if err:sys.exit(1)
print('PASS release structure, 6 document pairs, 18 scenarios, 15 control requirements, current slide deck')
