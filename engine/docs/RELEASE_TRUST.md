# Release trust, updates, and rollback

Byte integrity, logical correctness, and release authenticity are separate checks. The source manifest binds file bytes. Reasoning replay binds conclusions to the approved facts and knowledge. Neither identifies the publisher by itself.

## Trusted manifest pin

The agent bridge and standalone proof checker require `--trusted-manifest-sha256` with exactly 64 lowercase hexadecimal characters. Obtain this pin through an authenticated, independently approved release channel and keep it in the trusted host configuration, outside the agent workspace and downloaded bundle. Never let an agent choose or update its own pin. A pin calculated solely from an untrusted download establishes no authenticity.

Use a trusted installation of the verifier. Running checker code from an untrusted bundle before authenticating that code cannot bootstrap trust. A trusted installer or operator must first verify the source archive digest through an authenticated channel, then establish the manifest pin. The packaging command prints the archive digest; calculate the source-manifest digest separately for review; these are unsigned local candidate measurements, not an accepted publishing channel.

```text
stm-tool release-verify --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256
stm-tool bridge --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --trusted-executable-sha256 TRUSTED_EXECUTABLE_SHA256 --binary PATH_TO_TRUSTED_EXECUTABLE < engine/examples/district_aggregate.json
stm-tool verify-proof --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --request engine/examples/district_aggregate.json --assessment output/assessment.json
```

Trust verification checks the exact manifest bytes before parsing bundle-controlled metadata, then verifies the full explicit inventory and hashes. Missing, malformed, incorrect, or oversized manifest inputs fail closed. Even an altered bundle with internally consistent new hashes is rejected against the original external pin. The bridge does not start the engine until trust verification succeeds.

The executable must also be authenticated by the host's installation process. The bridge now requires an independently configured `--trusted-executable-sha256` pin and checks the selected file before launch. A reasoning proof can detect an inconsistent output but cannot stop an untrusted executable from performing unrelated actions. Keep tool paths and pins in trusted configuration; never accept them from model-generated arguments or user-supplied assessment JSON.

## Candidate update procedure

1. Preserve the accepted archive, manifest pin, executable digest, engine/KB/schema versions, and approved date context in institution-controlled release records. Keep assessment data out of public release records.
2. Stage a new candidate in a separate directory. Verify archive provenance and externally supplied manifest pin before executing its code. Check the native archive and executable against separately approved digests.
3. Review version compatibility, rule and fact-definition changes, source-review changes, and test evidence. Reassess public synthetic regression cases. A new pin alone is not approval of changed rule meaning.
4. Complete independent source, domain, security, and selected-client acceptance before changing the trusted host's active pin and executable together. Do not auto-accept a new version returned by an agent or retrieved document.
5. If verification fails, retain the existing trusted installation and return a verification error. Never downgrade to an unverified reasoning path.

## Rollback

Stop assessment processing while restoring the previously accepted immutable source/native pair and its matching externally retained pin and context. Re-run inventory verification, synthetic proof replay, and client checks before resuming. Do not overwrite an old installation with new files or mix certificates across knowledge fingerprints. Rollback does not make expired, conflicting, or unreviewed sources current; review those limitations again for the intended evaluation date.

## Ownership and acceptance still required

No publisher signing key, signed release, authenticated distribution service, or independent release approval is claimed. The project owner must designate release approvers, a protected distribution channel, signing/key-custody and rotation policy if signatures are adopted, pin distribution/revocation, and rollback authority. Automated implementation and hash generation cannot fill those roles. An external pin protects the selected bundle only when the pin and verifier installation are already trusted.

## Executable pin enforcement

The bridge requires separate manifest and executable pins. Obtain both through the host's approved release process; never trust a digest solely because it appears in the same downloaded native manifest. The native packager records each executable SHA-256 in `BINARY_MANIFEST.json` for review. Packaging measurements are unsigned and do not identify the publisher.

Before starting a child process, the bridge validates the public request and hashes the selected executable against the externally configured pin. Missing or malformed pins, mismatches, non-regular files, final-component links/reparse points, and files over 64 MiB are rejected. The resolved executable path is used for launch; returned verification metadata includes its checked hash without exposing its installation path. No unapproved request fields or host-setting overrides are forwarded to the engine.

Install the trusted verifier, source bundle, and executable under host-controlled permissions that prevent agent or untrusted writes. Hashing a file before launch does not protect against a privileged concurrent replacement of the installation. The host must keep the executable and its directory immutable during verification and execution. Pin enforcement does not replace publisher authentication, source approval, signing policy, or independent acceptance.

The standalone proof checker does not execute a native program, so it continues to require only the manifest pin. Direct CLI and MCP launchers remain low-level interfaces: their host must authenticate the installed executable before launching it. Use the verified bridge for the enforced assessment path.

## Native package checks

Use the trusted verifier's verify-native and extract-native commands to enforce archive/source pins, exact member hashes, and configured OS/architecture before staging. See [native package verification](NATIVE_PACKAGES.md) for commands, bounds, and I/O limitations. Staging never activates a candidate or updates host trust.
