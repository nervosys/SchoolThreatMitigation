# Deterministic Rule Reasoning Contract

The knowledgebase contains public scenario and control records. The executable reasoning layer separately evaluates 18 declarative logical rules. Agents may retrieve records and supply approved Boolean assertions; they cannot submit new rules, change the evaluator, or choose a verdict. Optional generated prose is an explanation, not a substitute for the verified structured result.

## Rule language

The executable specification is `stm-conjunctive-1`. Each rule declares `when` applicability predicates and `check` requirement predicates. A predicate is exactly `fact == boolean`. All predicates within a clause are conjoined. The language intentionally has no executable scripts, probabilistic scores, arbitrary expressions, or hidden model inference. It is a bounded constraint evaluator rather than a general theorem prover.

Predicate values are MATCHED, MISMATCHED, or UNKNOWN. A missing fact is UNKNOWN; an asserted `false` is a known Boolean value and may satisfy a requirement expecting `false`. An empty applicability clause is true. Within conjunction, any mismatch establishes false; otherwise any missing value establishes unknown; otherwise the conjunction is true. Duplicate predicates and contradictory applicability/requirement combinations are rejected during authoring and loading.

| Applicability | Requirements | Result |
| --- | --- | --- |
| False | Not evaluated | `not_applicable` |
| Unknown | Not evaluated | `scope_unknown` |
| True | Unknown with no mismatch | `needs_evidence` |
| True | All matched | `evidence_indicates_satisfied` |
| True | At least one mismatch | `gap_for_review` |
| True | At least one mismatch in a safety guardrail | `deployment_hold` |

False dominates unknown within a clause. A missing applicability fact cannot trigger requirement evaluation unless every applicability predicate matches. Findings follow the declared versioned rule order; facts and summary keys have canonical ordering. The logical result has no randomness, network calls, model invocation, or wall-clock dependency.

## Requests and date context

Assessments accept only the whitelisted Boolean fact map, an optional approved generic label, optional `as_of` in UTC YYYY-MM-DD form, and optional `expected_kb_version`. A version mismatch is rejected before reasoning. The default `as_of` is the KB reference date, and the response explicitly identifies this basis. Supply an explicit date to assess source currency for another day. `source-check` without a date is a separate current-UTC diagnostic; it does not silently alter reasoning requests.

Source review is reported independently of Boolean verdicts. Unreviewed, conflicting, withdrawn, expired, or future-dated reviews require attention. A current maintainer review is not independent acceptance. Neither a source review nor a matched logical constraint authenticates supplied evidence or authorizes institutional use. Both authorization flags always remain false.

## Replayable certificates

Every assessment includes `reasoning_certificate` with the specification, engine version, KB version, knowledge SHA-256, accepted Boolean assertions, and one proof per rule. Each proof records applicability and requirement operators, expected and observed values, unknown/matched/mismatched outcomes, whether requirements were evaluated, and the final verdict. No original free-text question, site-specific label, rejected input, or personal record enters the certificate.

The knowledge fingerprint covers the typed rule register, scenarios, controls, combined source records, graph edges, source-review register, and fact-definition catalog. Its canonical JSON uses UTF-8, lexicographically sorted object keys, compact separators, unescaped Unicode, and original array order. Unsupported or malformed knowledge is rejected before evaluation. SHA-256 binds content; it is not a digital signature or proof of publisher identity.

Use the separate Rust checker against the original request and a trusted extracted source bundle:

```text
stm-neurosymbolic assess engine/examples/district_aggregate.json > output/assessment.json
stm-tool verify-proof --trusted-manifest-sha256 TRUSTED_MANIFEST_SHA256 --request engine/examples/district_aggregate.json --assessment output/assessment.json
```

The command first checks an externally supplied trusted manifest pin and the bundle's release inventory and hashes, then independently reconstructs the fingerprint, every proof, finding, summary, source-review result, and fixed non-authorization statements. It rejects extra assessment fields and any discrepancy. The original request is required so an agent cannot substitute different facts and present an internally consistent certificate as the requested result. A hash manifest itself must come from a trusted source; release signing remains a separate acceptance requirement.

## Agent contract

1. Pin a reviewed KB version and obtain only anonymous, approved Boolean assertions.
2. Call `kb_assess` with those facts, an explicit evaluation date when current source status matters, and `expected_kb_version`.
3. Preserve the structured assessment. Verify it against the original request and trusted KB using the independent checker.
4. Present logical verdicts, missing facts, source-review limitations, and human-review actions together.
5. Keep optional agent commentary separate. Do not claim that a proof authenticates facts, establishes legal compliance, or grants deployment authority.

Verifiable predictability means the same pinned knowledge, assertions, and context reproduce the same structured result, and altered results fail replay. It does not mean that a fact assertion is true or that a proposed intervention is effective.


## Approved fact definitions

Run `stm-neurosymbolic facts` or explain a definition such as `FACT-WA-PUBLIC-SCHOOL`. MCP tool discovery supplies the same Boolean property names and definitions. False must be an explicit human assertion; missing facts remain unknown. No input defaults to false. The fact catalog states the scope, meaning, evidence expectation, related rules, and source IDs without collecting the underlying personal records. Its draft status remains visible and its content is included in the knowledge fingerprint.

The standalone checker and bridge require the manifest pin from trusted host configuration. See [release trust](RELEASE_TRUST.md); deriving a pin from an unauthenticated download is not publisher verification. The low-level `tooling::replay::verify` library function performs logical replay only; host integrations must establish bundle trust before calling it.

The verified host bridge also requires an external executable SHA-256 pin and validates requests before launch. Its verification metadata binds both artifact pins to the returned assessment. These host checks do not change the logical certificate or KB fingerprint; see [agent integration](AGENT_INTEGRATION.md).
