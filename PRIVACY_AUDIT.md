# Privacy review

The 0.4.0 RC5 workflow performs native Rust inspection of the explicit public source inventory, decoded JSON, PDF text/metadata and every expanded presentation part, with XML/notes/SVG entity decoding. Runtime inputs and subprocess output are bounded; rejection diagnostics omit submitted values and paths. See [privacy boundaries](engine/docs/PRIVACY_BOUNDARIES.md) and [current evidence](qa/implementation_validation.json).

The briefing retains its existing sanitization and slide XML. Public attribution to NERVOSYS, LLC is intentional. No private account export, individual case record or credential is used as a fixture. Historical archives remain separate from the current source distribution.

Automated scans are heuristic. Independent review of public text, metadata, images and release contents remains required. A zero-finding scan does not certify absence of private data. Clients, terminals and operating systems may retain inputs independently.

Presentation inspection now validates part sizes and CRCs, including binary parts, and rejects unsupported ZIP64 metadata before parsing. Readable image metadata receives pattern inspection; image pixels and arbitrary nested encodings require independent review. No presentation members are extracted to disk during inspection.
