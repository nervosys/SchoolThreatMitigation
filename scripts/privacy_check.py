#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Conservative secret/PII and accidental-file scanner for public releases."""
from pathlib import Path
import os, re, sys
ROOT = Path(__file__).resolve().parents[1]
BAD_EXTENSIONS = {'.p12', '.pfx', '.pem', '.p8', '.key'}
BAD_DIRS = {'.git', '.venv', '__pycache__', '.idea', '.vscode', 'secrets', 'private', 'confidential'}
CHECK_SUFFIXES = {'.py', '.typ', '.html', '.css', '.json', '.md', '.txt', '.yml', '.yaml', '.cmd', '.sh', '.srt', '.ipynb'}
PATTERNS = [
    ('private key', re.compile(rb'-----BEGIN (?:[A-Z ]+ )?PRIVATE KEY-----')),
    ('GitHub token', re.compile(rb'\b(?:ghp_|gho_|ghs_|ghu_|github_pat_)[A-Za-z0-9_]{10,}')),
    ('AWS key', re.compile(rb'\b(?:AKIA|ASIA)[A-Z0-9]{16}\b')),
    ('OpenAI token', re.compile(rb'\bsk-(?:proj-)?[A-Za-z0-9_-]{20,}')),
    ('private local path', re.compile(rb'(?i)(?:[A-Z]:\\Users\\[^\\\s]+|/Users/[^/\s]+|/home/(?!oai)[a-z0-9._-]+/)')),
    ('email address', re.compile(rb'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b')),
    ('credential assignment', re.compile(rb'(?im)\b(?:api[_-]?key|access[_-]?token|secret[_-]?key|password|client[_-]?secret)\s*[:=]\s*[\"\'][^\"\']{8,}[\"\']')),
]
def main():
    issues=[];checked=0
    for p in ROOT.rglob('*'):
        if not p.is_file(): continue
        rel=p.relative_to(ROOT)
        if rel.as_posix() == 'scripts/privacy_check.py': continue  # scanner patterns are not leaked paths
        if any(x in BAD_DIRS for x in rel.parts):
            issues.append((rel,'private/cache directory'));continue
        if p.suffix.lower() in BAD_EXTENSIONS:
            issues.append((rel,'credential-like extension'));continue
        if p.name.startswith('.env'):
            issues.append((rel,'environment file'));continue
        if p.suffix.lower() not in CHECK_SUFFIXES:continue
        checked+=1;data=p.read_bytes()
        for label,regex in PATTERNS:
            if regex.search(data): issues.append((rel,label))
    for f,label in issues: print(f'ERROR: {f}: {label} (match redacted)')
    print(f'Privacy check scanned {checked} text files; findings: {len(issues)}')
    return 1 if issues else 0
if __name__ == '__main__': sys.exit(main())
