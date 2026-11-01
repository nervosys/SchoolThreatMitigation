# Rust advisory engine and native tools

Version 0.4.0 RC10 uses KB 17.0-NSAI.4 and schema 2.0. The engine, host bridge, proof checker, evaluation, comparison, review, privacy inspection, manifest checks, packaging, and dependency inventory are Rust. Python is not part of the supported workflow.

Build both binaries with `cargo build --locked --release --manifest-path engine/Cargo.toml --bins`. Run Cargo format, clippy, and tests, then `stm-tool check` from the source root. On Windows `engine\CHECK_WINDOWS.cmd` performs this sequence with a staged native tool. Set `CARGO_TARGET_DIR=engine/target` when using a custom global target directory.

## Engine

`validate`, `facts`, `sources`, `source-check YYYY-MM-DD`, `search-stdin`, `ask-stdin auditor`, `explain ID`, `trace ID`, `assess -`, and `mcp` remain available. Knowledge is bundled, so the engine operates outside the checkout. `--kb-root` explicitly chooses a public source tree. The optional label is generic; facts are approved Booleans only. Both authorization flags always remain false.

## Native tool

Run `stm-tool --help` for flags. Common source-root selection is `--root DIRECTORY`.

| Command | Purpose |
| --- | --- |
| `bridge` | Pinned native execution and independent Rust replay; request on stdin |
| `verify-proof` | Check an assessment against the original request and trusted source |
| `check` | Write path-free native validation evidence; `--cargo` also checks Cargo from a staged tool |
| `check-mcp`, `check-reasoning` | Native MCP client and exhaustive per-rule runtime checks |
| `check-adversarial` | [Synthetic MCP authority, mutation and proof probes](docs/ADVERSARIAL_VALIDATION.md) |
| `retrieval-evaluate --fixture` | Existing frozen maintainer ranking cases |
| `retrieval-evaluate` | External dataset with source, executable, and dataset pins |
| `compare`, `compare-fixture` | Bounded exhaustive change analysis or retained baseline identity |
| `review-build`, `review-verify` | Generate/check an unaccepted review packet |
| `release-refresh`, `release-verify` | Explicit inventory and byte integrity |
| `privacy` | Inspect shipping bytes plus decoded JSON/PDF/XML content |
| `pack-source`, `pack-native`, `extract` | Native deterministic archives and bounded extraction |
| `verify-native`, `extract-native` | [Pinned native package checks and staging](docs/NATIVE_PACKAGES.md) |
| `sbom`, `publications` | Cargo dependency inventory and publication pair/structure/text checks |
| `render-publications` | Optional native orchestration of Pandoc/Typst into `output/pdf-rust` |

Normal runtime, verification, tests, and packaging require no document-rendering executables. Rebuilding publications optionally requires Pandoc and Typst and must receive fresh visual/accessibility review. Existing published assets retain their original hashes and prior QA; the migration does not claim a new visual review.

The second interpreter does not call the engine evaluator. It reconstructs every predicate proof, finding, summary, source-review result, fingerprint, and non-authorization flag. The implementations share Rust types and date parsing; this is separate implementation, not cross-language or organizational independence.

Privacy scanning reports no matched values or sensitive paths. A zero-finding scan is not an independent privacy review. Sources are still unreviewed for acceptance, assertions are not authenticated, and no deploy/signing authority is supplied by the software. See the linked root documentation for the remaining review requirements.

The validated local compiler is Rust 1.99.1. The official MCP Rust SDK is a dev dependency used by the all-target test suite; it is not linked into the production engine or native verifier. Use the SDK validation guide for exact coverage. Native package manifests identify their OS, architecture and matching source-manifest hash.

## Private build paths

Before producing distributable binaries, remap both the checkout and Cargo's crate cache. Release privacy inspection rejects embedded user paths, including WSL mount paths. Build/test consoles are still operator-controlled; never upload raw diagnostics.

PowerShell:

```powershell
$stmRoot = (Get-Location).Path
$stmCache = if ($env:CARGO_HOME) { $env:CARGO_HOME } else { Join-Path $env:USERPROFILE '.cargo' }
$env:CARGO_ENCODED_RUSTFLAGS = @("--remap-path-prefix=$stmRoot=/source", "--remap-path-prefix=$stmCache=/cargo-home") -join [char]31
cargo build --locked --release --manifest-path engine/Cargo.toml --bins
```

POSIX shell:

```sh
CARGO_ENCODED_RUSTFLAGS=$(printf '%s\037%s' "--remap-path-prefix=$PWD=/source" "--remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo-home")
export CARGO_ENCODED_RUSTFLAGS
cargo build --locked --release --manifest-path engine/Cargo.toml --bins
```

The Windows build wrapper preserves explicitly configured encoded flags. Run the native packager's privacy inspection before distributing either platform's binaries; a successful compilation alone is not a privacy check.

On Unix, the native extractor preserves executable bits for packaged programs while discarding special permission bits. The Linux package is verified by running its extracted engine and verifier, including pinned bridge and proof checks.

Dependency checks use pinned Rust cargo-audit/cargo-deny tools and the declared-license/source policy. The native check command validates the retained review's lockfile/policy bindings; fresh advisory checks run separately. See [dependency review](docs/DEPENDENCY_REVIEW.md) for findings, remediation, reproduction and remaining independent acceptance.
