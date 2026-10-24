#!/bin/sh
set -eu
cd "$(dirname "$0")"
command -v weasyprint >/dev/null 2>&1 || { echo 'WeasyPrint is required' >&2; exit 1; }
for doc in School_Safety_Field_Guide Executive_Summary National_School_Safety_Innovation_Forum; do
  weasyprint "${doc}_VERSION_14_4.html" "${doc}_VERSION_14_4.pdf"
done
