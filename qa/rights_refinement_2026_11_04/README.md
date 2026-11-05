# Public synthetic rights-guardrail evidence

These requests describe deliberately prohibited hypothetical program behaviors, not any real person, household or school. They supply only defined Boolean facts, an explicit evaluation date (2026-11-04), and expected KB version 17.0-NSAI.4. Missing facts remain unknown.

- `request.json`, `assessment.json`, `proof_verification.json`: G-001 returns `deployment_hold` for a synthetic firearm-owner registry.
- `profiling-request.json`, `profiling-assessment.json`, `profiling-proof-verification.json`: G-002 returns `deployment_hold` for synthetic demographic/political risk profiling.

Each original request is retained. The pinned bridge and separate Rust proof interpreter verified the complete 18-rule assessment. The source was the controlled published baseline commit `1fa3d5eb976b761608959cfdd4ab1e5a961d4aa6`, manifest SHA-256 `6314ff422e4536319a2408b3fa758b4f24771133395044e8885ae03e08b39dc2`. The current editorial refinement retains the same knowledge fingerprint `2bcb941487fb138f3e014ff57a71140fcecd8e6bbe7fef5496abef2188b1f34c` and executable rules.

Reproduce with a separately trusted verifier and matching baseline source:

```text
stm-tool verify-proof --root BASELINE_SOURCE --trusted-manifest-sha256 BASELINE_PIN --request qa/rights_refinement_2026_11_04/request.json --assessment qa/rights_refinement_2026_11_04/assessment.json
stm-tool verify-proof --root BASELINE_SOURCE --trusted-manifest-sha256 BASELINE_PIN --request qa/rights_refinement_2026_11_04/profiling-request.json --assessment qa/rights_refinement_2026_11_04/profiling-assessment.json
```

An additional local schema test rejected an unsupported `political_profile` key with no assessment. That demonstrates input-schema enforcement, not an automated judgment of constitutional compliance. Assertion authentication, all 20 source reviews, independent legal/editorial/accessibility acceptance, publisher authentication and deployment authorization remain unresolved or false. Keep actual evidence and review responses in the controlled review system.
