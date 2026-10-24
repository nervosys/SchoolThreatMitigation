# Public release privacy review — 2026-10-23

## Scope

Only the final 14.6 Kokoro video assets, the 14.5 published advisory package, reproducible media/Typst sources, and essential release metadata were selected for this repository. Temporary files, caches, original previous-version ZIP archives, Git history, local user directories, and build outputs were excluded.

## Checks performed

- Text files and notebook sources scanned for common credential formats, access keys, passwords with assignment syntax, email addresses, machine-specific home directories, and paths.
- The three PDF documents inspected for author/creator metadata and external hyperlink targets. No personal or private document-author metadata or non-public link destinations were detected in this scan.
- Original PNG sources and the cover asset inspected for EXIF and embedded PNG text metadata; none detected.
- Final MP4 stream/container metadata inspected; no location, device identifier, account name, or user-path tags detected.
- No private email address, telephone number, personal street address, secret key, student record, or local Windows user folder was identified in the included source and media metadata.
- No files from the user's account, other than the explicitly supplied final MP4 and WAV, were introduced.

## Intentional public attribution

The original advisory documents identify **NERVOSYS, LLC**, **Dr. Adam Erickson** as a contact, and the organization's public website (`https://nervosys.ai`). Those are intentionally published credits, not hidden metadata; they were preserved.

## Residual risk

This is a best-effort automated plus targeted manual review, not a guarantee. It does **not** validate every factual assertion in the advisory, determine ownership of every font/media component, or assess new material contributors might add. Review content and rights again before pushing publicly. Never publish credentials or sensitive site-specific plans.
