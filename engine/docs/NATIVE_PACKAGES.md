# Native package verification and staging

Use an already trusted `stm-tool` installation. Configure archive and source-manifest SHA-256 pins through the host's approved release channel. Measuring a downloaded archive and accepting that measurement proves no publisher identity. These candidate packages are unsigned and still await independent acceptance.

```text
stm-tool verify-native --root TRUSTED_SOURCE --archive CANDIDATE_ZIP --trusted-archive-sha256 APPROVED_ARCHIVE_SHA256 --trusted-manifest-sha256 APPROVED_SOURCE_MANIFEST_SHA256 --platform windows --architecture x86_64
stm-tool extract-native --root TRUSTED_SOURCE --archive CANDIDATE_ZIP --trusted-archive-sha256 APPROVED_ARCHIVE_SHA256 --trusted-manifest-sha256 APPROVED_SOURCE_MANIFEST_SHA256 --platform windows --architecture x86_64 --output NEW_STAGING_DIRECTORY
```

Use `--platform linux` for Linux packages; only `x86_64` packages are currently supported. Verification is read-only and rejects `--output`. Extraction requires a new directory and writes the same in-memory bytes that passed verification. Neither command executes the candidate, activates an installation, updates trusted pins, or grants deployment authority.

The verifier checks the external archive pin before parsing ZIP metadata, verifies the externally pinned source inventory, and requires exactly five regular archive members: the two binaries, LICENSE, NOTICE.md, and BINARY_MANIFEST.json. The strict manifest binds engine/KB versions, OS, architecture, source-manifest hash, pending-acceptance status, and four file hashes. Unknown manifest fields and duplicate JSON keys are rejected. Binary modes must be executable and text modes non-executable. PE32+ AMD64 or ELF64 little-endian AMD64 headers must match the configured OS. Header consistency does not establish loader validity, runtime behavior, absence of malware, or independent acceptance; execute the separate platform/runtime qualification checks after authenticating a candidate.

The source privacy patterns also inspect the four payloads. Findings and errors do not print submitted content or paths. This heuristic cannot establish that arbitrary binaries contain no private data; host permissions, reviewed inputs, path-remapped builds, and independent review remain necessary.

## ZIP extraction boundary

Both generic `extract` and pinned `extract-native` validate all members, decoded contents, declared sizes, and CRCs before creating the output directory or its parents. Generic extraction does not authenticate a package; authenticate its digest separately. Existing output directories are rejected rather than updated.

Supported ZIPs have a standard single-disk layout, at most 4,096 entries, an 8 MiB central directory, an 80 MiB archive/total expansion bound, and a 20 MiB per-member expansion bound. ZIP64 footers and gaps between the central directory and trailer are rejected before the ZIP reader can allocate using alternate counts. The portable filename subset permits ASCII letters, digits, internal spaces, periods, underscores, hyphens, and slash separators. Paths are limited to 240 bytes, 32 components, and 128 bytes per component. Traversal, absolute/drive paths, backslashes, empty components, trailing dots/spaces, Windows device names (including spaces before an extension), case aliases, duplicate members, file/directory collisions, links and special files are rejected. The supported release inventory uses this subset.

On Unix, extracted regular files receive 0755 for executable members and 0644 otherwise; special permission bits are discarded. Windows execution uses its native file rules. This is staging into a trusted parent directory: its permissions must prevent concurrent untrusted replacement of paths. Validation failures create no output. An I/O failure during writing can leave a partially populated new staging directory; no transactional rollback is claimed. Inspect or discard failed staging before retrying with a new destination. Existing installations are never selected automatically.

See [release trust and update ownership](RELEASE_TRUST.md) for authentication, activation, and rollback responsibilities.
