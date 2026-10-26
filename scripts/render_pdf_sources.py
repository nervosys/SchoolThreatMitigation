#!/usr/bin/env python3
"""Render Version 17.0 editable HTML publications into PDFs (pip install weasyprint)."""
from pathlib import Path
from weasyprint import HTML
root=Path(__file__).resolve().parents[1]
d=root/'docs'/'advisory-v17.0'
for p in sorted(d.glob('*.html')):
    output=p.with_suffix('.pdf')
    HTML(filename=str(p),base_url=str(d)).write_pdf(output)
    print('Rendered',output.relative_to(root))
