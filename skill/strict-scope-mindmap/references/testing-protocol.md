# Adaptive High-Rigor Verification & Visual Test Log Protocol

Apply this protocol whenever a task writes or modifies executable code, styles, queries, schemas, or scripts. Test **only** the target feature/functions in `Target Scope` - never waste time running unrelated repo-wide suites unless the user asks.

## 1. Understand the Project Before Selecting the Test Environment

Before writing tests or code, establish three facts from the project's root manifest and target entry point:

1. **Runtime & Purpose**: What does this application/service/plugin do, and how is the target feature invoked at runtime?

2. **Long-Term Future Blast Radius**: What happens over weeks or months in production if this feature experiences high load, slow I/O, repeated connects/disconnects, growing datasets, or malformed inputs?

3. **Hardest Available Harness**: Which test runner, typechecker, static analyzer, or runtime simulator provides the strictest verification for this exact stack? (Consult `references/tool-routing-matrix.md` and `plugins/`.)

## 2. Build a High-Diversity Scenario Matrix (Dozens to Hundreds of Cases)

Use parameterized tables (`test.each`, `@pytest.mark.parametrize`, table-driven tests in Go/Rust/Java) or property-based generators to run **dozens to hundreds of distinct cases** against the target feature:

| Scenario Category | What to Exercise on the Target Feature |
| --- | --- |
| **1. Core Functional & Holistic Cases** | Every explicit requirement + cohesive must-haves (e.g., all theme tokens/contrast ratios, pagination cursors, DTO fields) |
| **2. Boundary & Extreme Values** | `0`, `-1`, `MAX_SAFE_INTEGER`, empty strings `""`, whitespace-only, 10,000-item arrays, deep nesting, Unicode/RTL/emoji |
| **3. Malformed & Adversarial Inputs** | `null`, `undefined`, missing keys, wrong types, SQL/HTML/command special characters, truncated payloads |
| **4. State, Lifecycle & Concurrency** | Rapid repeated calls, out-of-order resolution, cancellation (`AbortSignal`), double-submit, race conditions |
| **5. Long-Term Future & Scale Risks** | Unbounded map/cache growth, listener/handle leaks, N+1 query scaling, clock skew, timezone/DST rollover, schema forward compatibility |

## 3. Adaptive Verification Loop (Maturity- & Future-Risk-Driven)

Do not blindly hard-lock the number of passes. Adapt the pass count to the **observed defect trend and long-term future safety**:

- **Pass 1 - Baseline, Holistic Contract & Static Verification**:
  - Run functional tests + static/type diagnostics (`Pyright`, `tsc --noEmit`, `cargo check`, `Semgrep`, etc.) on the target files.
  - Fix any detected bug or contract mismatch immediately at the owning boundary.

- **Pass 2 - High-Volume Stress, Boundary & Future-Risk Matrix**:
  - Execute the parameterized/property-based stress matrix (dozens to hundreds of scenarios) covering edge cases, malformed inputs, concurrency, and long-term lifecycle stability.
  - **Evaluate the Adaptive Gate after Pass 2**:
    - **Condition A (Early Stop Allowed at Pass 2)**: Error rate has dropped to **negligible/zero** (`0` failing scenarios) AND a long-term audit confirms **zero future-compounding risks** (no memory leaks, no race windows, no brittle assumptions). Stop at Pass 2 and write the log.
    - **Condition B (Mandatory Fix + Pass 3 / Pass N Continuation)**: If **any** defect remains—even a tiny edge case, warning, resource leak, or architectural fragility that could cause bugs **in the long run / future**—fix it immediately at the owning boundary and run **Pass 3** (and Pass 4+ if needed) until both immediate defects and long-term future risks are completely eliminated.

## 4. Write the Visual Test Log (`TEST_VERIFICATION_LOG.md`)

Always generate or update `TEST_VERIFICATION_LOG.md` so the user can inspect the test environment, scenario coverage, adaptive stop decision, and fixed bugs at a glance:

```markdown
# Test Verification Log: <Feature / Target Name>

## 1. Project Context & Selected Test Environment
- **Project Purpose & Runtime**: <Brief summary of what the project does and how the target feature runs>
- **Target Scope Tested**: `<exact files / functions tested>`
- **Excluded Out-of-Scope Files**: `<untouched modules skipped to save time>`
- **Selected Plugin & Test Harness**: `<Runner / Typechecker / Stress Tool>` — chosen as the strictest environment for this stack.

## 2. Adaptive Verification Passes

| Pass | Focus | Scenarios Executed | Bugs / Future Risks Found | Action Taken | Result | Duration |
| --- | --- | --- | --- | --- | --- | --- |
| **Pass 1** | Core Functional, Holistic & Static Contracts | <N cases> | <Count> | <Fixed X / None> | PASS / FIXED | <ms> |
| **Pass 2** | Parameterized Boundary, Fuzz, Concurrency & Long-Term Risk Matrix | <N cases (e.g., 120 cases)> | <Count> | <Fixed Y / Early Stop if 0> | PASS / FIXED | <ms> |
| **Pass 3+** *(if any bug or future risk existed in Pass 2)* | Post-Fix Regression & Future-Proof Stability Confirmation | <N cases (all combined)> | 0 | Verified clean for long-term use | 100% PASS | <ms> |

## 3. Adaptive Gate Decision & Long-Term Future Assessment
- **Stop Decision**: <Stopped at Pass 2 (zero residual or future risk) | Continued to Pass 3+ after fixing long-term edge cases in Pass 2>
- **Long-Term / Future-Proof Checks Verified**:
  - Memory & resource lifecycle (no leaks or unbounded growth)
  - Concurrency / race safety under repeated calls
  - Input boundary & schema forward-compatibility

## 4. Scenario Coverage Breakdown
- **Happy Path & Holistic Rules**: <e.g., 20 scenarios>
- **Boundary & Extreme Inputs**: <e.g., 45 scenarios>
- **Malformed / Adversarial Resilience**: <e.g., 35 scenarios>
- **Concurrency & Long-Term Lifecycle**: <e.g., 25 scenarios>

## 5. Bugs & Future Risks Caught and Fixed Immediately
1. **`<Bug / Long-Term Risk 1>`**:
   - **Symptom / Future Risk**: <What failed or what would break over time in production>
   - **Root Cause & Fix**: <How it was fixed at the owning boundary>
2. *(Or "Zero defects or future risks detected across Pass 1 and Pass 2; early stop criteria met.")*

## 6. Final Quality Metrics
- **Target Feature Error Rate**: `0.0%` (<Total Passed> / <Total Scenarios>)
- **Long-Term Future Risk Score**: `0 (Clean)`
- **Unrelated Files Modified**: `0`
```

## 5. Mandatory Closing Prompt

After presenting the completed work and `TEST_VERIFICATION_LOG.md`, always end your message in the terminal or chat with:

> **Bạn có muốn tôi kiểm luôn các file còn lại không?**
