# 3-Pass High-Rigor Verification & Visual Test Log Protocol

Apply this protocol whenever a task writes or modifies executable code, styles, queries, schemas, or scripts. Test **only** the target feature/functions in `Target Scope` - never waste time running unrelated repo-wide suites unless the user asks.

## 1. Understand the Project Before Selecting the Test Environment

Before writing tests or code, establish three facts from the project's root manifest and target entry point:

1. **Runtime & Purpose**: What does this application/service/plugin do, and how is the target feature invoked at runtime?

2. **Failure Blast Radius**: What breaks if this feature receives malformed input, high load, slow I/O, or concurrent calls?

3. **Hardest Available Harness**: Which test runner, typechecker, static analyzer, or runtime simulator provides the strictest verification for this exact stack? (Consult `references/tool-routing-matrix.md`.)

## 2. Build a High-Diversity Scenario Matrix (Dozens to Hundreds of Cases)

Do not stop at 1-2 happy-path assertions. Use parameterized tables (`test.each`, `@pytest.mark.parametrize`, table-driven tests in Go/Rust/Java) or property-based generators to run **dozens to hundreds of distinct cases** against the target feature in milliseconds:

| Scenario Category | What to Exercise on the Target Feature |
| --- | --- |
| **1. Core Functional & Holistic Cases** | Every explicit requirement + cohesive must-haves (e.g., all theme tokens/contrast ratios, pagination cursors, DTO fields) |
| **2. Boundary & Extreme Values** | `0`, `-1`, `MAX_SAFE_INTEGER`, empty strings `""`, whitespace-only, 10,000-item arrays, deep nesting, Unicode/RTL/emoji |
| **3. Malformed & Adversarial Inputs** | `null`, `undefined`, missing keys, wrong types, SQL/HTML/command special characters, truncated payloads |
| **4. State, Lifecycle & Concurrency** | Rapid repeated calls, out-of-order resolution, cancellation (`AbortSignal`), double-submit, race conditions |
| **5. Error Recovery & Performance** | Upstream timeout/500 responses, clean fallback state, memory/time bounds under batch load |

## 3. Execute at Least 3 Verification Passes (With Immediate Auto-Fix)

Run the target test harness through a minimum of **3 distinct verification passes**:

- **Pass 1 - Baseline & Holistic Contract Verification**:
  - Run functional and contract tests + static/type checks (`Pyright`, `tsc --noEmit`, `cargo check`, `golangci-lint`, etc.) on the target files.
  - *If any bug or type mismatch appears*: Fix it immediately at the owning boundary before moving on.

- **Pass 2 - High-Volume Stress, Boundary & Fuzz Matrix**:
  - Execute the parameterized/property-based matrix (dozens to hundreds of scenarios) covering edge cases, malformed inputs, and concurrency.
  - *If any edge-case failure appears*: Fix the root cause immediately, add a regression assertion for that exact case, and re-run Pass 2 until 100% of scenarios pass.

- **Pass 3 - Clean Stability & Efficiency Confirmation**:
  - Re-run the full target scenario matrix from a clean state to confirm **0 errors**, deterministic repeatability, and fast execution time.
  - Note: If Pass 1 or Pass 2 required code fixes, continue running until you achieve **3 consecutive clean passes** on the final code.

## 4. Write the Visual Test Log (`TEST_VERIFICATION_LOG.md`)

Always generate or update `TEST_VERIFICATION_LOG.md` (or display it clearly alongside the deliverable) using this structure so the user can verify every test pass and bug fix at a glance:

```markdown
# Test Verification Log: <Feature / Target Name>

## 1. Project Context & Selected Test Environment
- **Project Purpose & Runtime**: <Brief summary of what the project does and how the target feature runs>
- **Target Scope Tested**: `<exact files / functions tested>`
- **Excluded Out-of-Scope Files**: `<untouched modules skipped to save time>`
- **Selected Test Harness & Why**: `<Runner / Typechecker / Stress Tool>` — chosen as the strictest environment for this stack.

## 2. Three-Pass Verification Summary

| Pass | Focus | Scenarios Executed | Bugs Found | Action Taken | Result | Duration |
| --- | --- | --- | --- | --- | --- | --- |
| **Pass 1** | Core Functional & Holistic Contracts | <N cases> | <Count> | <Fixed X / None> | PASS / FIXED | <ms> |
| **Pass 2** | Parameterized Boundary, Fuzz & Stress Matrix | <N cases (e.g., 120 cases)> | <Count> | <Fixed Y / None> | PASS / FIXED | <ms> |
| **Pass 3** | Final Clean Stability & Efficiency Run | <N cases (all combined)> | 0 | Verified clean | 100% PASS | <ms> |
| **Pass 4+** *(if re-run after fix)* | Consecutive Clean Confirmation | <N cases> | 0 | Verified clean | 100% PASS | <ms> |

## 3. Scenario Coverage Breakdown
- **Happy Path & Holistic Rules**: <e.g., 15 scenarios — verified surface contrast, hover states, and responsive layout>
- **Boundary & Extreme Inputs**: <e.g., 45 scenarios — empty, max-length, zero/negative, Unicode payloads>
- **Malformed / Error Resilience**: <e.g., 40 scenarios — nullish fields, invalid cursors, aborted requests>
- **Concurrency & Performance**: <e.g., 20 scenarios — parallel calls, latency under X ms>

## 4. Bugs Caught & Immediately Fixed During Testing
1. **`<Bug / Edge Case 1>`**:
   - **Symptom**: <What failed during Pass 1/2>
   - **Root Cause & Fix**: <How it was fixed at the owning boundary>
2. *(Or "Zero defects detected across all 3 passes; all contracts held on initial implementation.")*

## 5. Final Quality Metrics
- **Target Feature Error Rate**: `0.0%` (<Total Passed> / <Total Scenarios> across 3 clean passes)
- **Unrelated Files Modified**: `0`
```

## 5. Mandatory Closing Prompt

After presenting the completed work and `TEST_VERIFICATION_LOG.md`, always end your message in the terminal or chat with:

> **Bạn có muốn tôi kiểm luôn các file còn lại không?**
