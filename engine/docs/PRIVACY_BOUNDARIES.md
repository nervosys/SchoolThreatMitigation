# Privacy boundaries

The Rust engine is an offline, read-only public advisory tool. It makes no network requests and writes no question or assessment history. Assessments accept only approved Boolean facts and generic allowlisted labels. Search and question inputs use bounded public-topic checks. These checks are heuristics, not complete recognition of private information; hosts must submit approved public or synthetic inputs only.

## Input and retention

Prefer `ask-stdin`, `search-stdin`, `assess -` and the verified bridge over putting inputs in shell arguments. Terminals, operating systems and parent clients may capture input; configure their logging, retention and crash-dump policies separately. Never use private information in MCP IDs, client metadata or arguments. Valid protocol request IDs are echoed.

CLI input and MCP lines are bounded to 65,536 bytes. Oversized MCP lines receive a fixed error and close the session. Questions are limited to 2,400 characters; fact maps to 80 entries. Unknown keys, non-Boolean values and duplicate JSON keys fail with redacted errors. No returned proof authenticates its input assertions.

## Public release checks

`stm-tool privacy --root SOURCE_DIRECTORY` inspects the explicit public inventory in `scripts/release_files.json`, including extracted source distributions. It does not scan arbitrary ignored checkout files. Additions to this allowlist require review; never populate it from arbitrary directory contents. `pack-source` verifies all inventory hashes, validates knowledge, rejects Python source/requirements, and repeats privacy inspection.

The Rust scanner checks raw bytes, decoded JSON strings, PDF text and metadata including UTF-16 strings, and presentation XML/notes with decoded entities. It rejects encrypted PDFs, PDF attachments, presentation executables, malformed documents, links/reparse points, credential-like file classes and oversized inputs. It does not comprehensively inspect raster pixels or every binary encoding. Zero findings are engineering evidence, not proof that private data cannot exist. Independent public-file review remains pending.

Errors omit matched values and private paths. `stm-tool check` stores allowlisted summaries without raw compiler logs, environment values or submitted inputs. No upload or hosting is performed. Historical archives may contain retired Python implementation files; they are preserved evidence and are excluded from the current source package.

## Verified bridge bounds

`stm-tool bridge` checks externally configured source-manifest and executable pins before launching the engine. Requests are validated before launch. Input goes through stdin without intake files; stdout is read incrementally with a 1 MiB limit. The first stderr byte causes failure and is discarded. Child environment values are cleared except Windows SystemRoot.

Nonzero exit, excess stdout, any stderr or failure to complete input/output within 30 seconds causes a fixed redacted error. The directly launched process is killed and reaped on failure. OS process creation and termination are not hard real-time operations; hosts must enforce an outer deadline and process containment. The pinned engine spawns no descendants. Host-controlled immutable installation directories prevent concurrent executable replacement after hashing.

Only a clean completed process response is decoded and fully replayed against the original request by the separate Rust interpreter. No partial assessment or diagnostic is returned. Successful results retain both artifact hashes, the effective date and KB context, and fixed non-authorization flags. The bridge writes no intake or diagnostic files. Institutional authentication, evidence custody, host logging and approval remain host responsibilities.

Release inspection also rejects private paths expressed through WSL mounts. Remap checkout and crate-cache paths when building artifacts; see the native workflow guide. Platform-native manifests bind the source manifest, OS, architecture, binary files and license files. These measurements remain unsigned.

## Presentation containers

Presentation inspection validates a standard single-disk ZIP footer before the ZIP reader is constructed. ZIP64, central-directory gaps, trailing data, over 2,000 parts, and an over-8-MiB central directory are rejected. The compressed input is limited to 20 MiB, each expanded part to 20 MiB and total declared expansion to 40 MiB. Every part is read with an expansion bound, checked against its declared size and CRC, and inspected with the same privacy patterns. This includes readable metadata in image and other non-XML parts, plus member names. XML, relationships and SVG text receive entity decoding as well. Ambiguous names, traversal, links, special or executable members and existing blocked executable extensions fail closed; diagnostics omit matched values.

The scanner does not render slides, perform OCR, follow external links, or decode arbitrary nested image/embedded formats. It cannot establish that images or arbitrary binary encodings contain no private data. Independent review of rendered public assets remains required.