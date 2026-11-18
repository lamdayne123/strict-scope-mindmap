---
name: strict-scope-mindmap
description: Enforce two-pass prompt triage, execution mind-mapping, holistic owning-boundary completion, 3-pass high-rigor feature testing with visual test logs, and fail-closed scope gates across coding, UI, backend, database, CLI, game dev, and debugging tasks. Use to make agents execute the exact requested goal completely, stress-test the changed feature across dozens of scenarios, fix bugs immediately, and never touch unrelated files without asking.
---

# Strict Scope Mindmap

Pin the user's primary objective on the first read, understand the project's runtime architecture, complete the target feature holistically at its owning boundary, verify it through at least 3 high-rigor test passes, and fail closed at every unrequested boundary.

## Scope Compatibility with Other Skills

- **Coding, UI, Backend, DB, CLI, & Game Dev Tasks**: Apply the full workflow below (Two-Pass Triage -> Mind Map -> Holistic Implementation -> 3-Pass Stress Test & Visual Log). When a domain-specific skill is active (such as `minecraft-plugin-dev` for Paper/Purpur/Folia), combine its domain rules with this skill's scope and testing gates.

- **Non-Coding Tasks** (writing, ideation, prompt design, energy planning): Apply only Steps 1-2 (Two-Pass Triage and Scope Lock) and defer output formatting to the matching skill (`match-my-writing-style`, `generate-fresh-ideas`, `focus-my-energy`, `get-more-perspectives`, `expert-prompt-architect`). Skip the code test runner on non-code tasks.

## 1. Two-Pass Prompt Triage & Project Fingerprint

Before editing any file, complete two fast passes:

1. **Pass 1 (Primary Goal & Project Context Lock)**:
   - Skim the prompt to isolate the single primary outcome (`Objective`).
   - Identify **what the project does, how it executes, and what runtime impact this change has** by inspecting only the minimal project descriptor (`package.json`, `pyproject.toml`, `Cargo.toml`, `pom.xml`/`build.gradle.kts`, `go.mod`, etc.) and the target entry point. Never write code blindly without knowing how the project runs.

2. **Pass 2 (Scope & Test Classification)**:
   - Sort every detail into three strict buckets:
     - **Direct Requirements**: Explicit user instructions and constraints.
     - **Holistic Must-Haves**: Co-dependent updates inside the owning boundary and its direct consumers so the primary goal is complete and cohesive (e.g., switching a theme to white requires harmonizing surfaces, text contrast, borders, shadows, and interactive states together).
     - **Hard Boundary (Out of Scope)**: Sibling modules, unrelated files, and unrequested refactors.

## 2. Build the Execution Mind Map First

Before running deep searches or edits, sketch a compact Execution Mind Map:

```text
[Objective]: <One-sentence primary goal + runtime effect in this project>
├── Direct Requirements
│   └── <Explicit user instructions>
├── Holistic Must-Haves (Owning Boundary + Direct Consumers)
│   ├── <Producing change>
│   └── <Cohesive layout / state / contract adjustments>
├── Target Scope (Allowed Reads & Edits)
│   └── <Exact files and symbols to open and modify>
├── Hardest Test Environment (Target Feature Only)
│   └── <Selected runner/verifier + multi-scenario stress matrix (3+ passes)>
└── Hard Boundary (Fail-Closed Zone)
    └── <Unrelated files, modules, and sibling features strictly off-limits>
```

## 3. Target-First Implementation & Filtered Tool Routing

- **Precision Lookups Only**: Use targeted tools (`LSP`, `ast-grep`, `Tree-sitter`, `ripgrep`) on `Target Scope` rather than scanning the entire repository. Consult `references/tool-routing-matrix.md` to select the right code-intelligence, build, or domain tool.

- **Holistic Completion**: Deliver a finished, production-grade implementation inside `Target Scope` with zero drive-by edits outside it.

- **Fail-Closed Boundary Gate**: If completing Task A genuinely requires reading or editing an out-of-scope file (Area B), **stop immediately** and ask the user by stating the exact file in Area B, why Task A fails without it, and the minimal change needed. Wait for confirmation before touching Area B.

## 4. Mandatory 3-Pass High-Rigor Testing & Immediate Bug Repair

Whenever you write or modify code, you **must** test the requested feature before finishing:

1. **Select the Strongest Test Environment for the Project**:
   - Based on the project fingerprint, choose the strictest, most realistic test harness available (e.g., `Vitest`/`Jest` + `Playwright`, `pytest` + `Hypothesis`/`Schemathesis`, `cargo test`, `go test -race`, `JUnit`/`Gradle`, `Foundry`, `Paper/Purpur` test harness). See `references/tool-routing-matrix.md` and `references/testing-protocol.md`.

2. **Stress-Test Across Diverse Scenarios (Target Feature Only)**:
   - Test **only** the feature/functions requested by the user (`Target Scope`), not unrelated files across the repo.
   - Design a rigorous scenario matrix (dozens to hundreds of parameterized/generated cases where applicable) covering: happy paths, boundary/extreme values, null/empty/malformed inputs, concurrency/race conditions, and failure/recovery paths.

3. **Execute at Least 3 Verification Passes with Immediate Bug Fixing**:
   - **Pass 1 (Functional & Contract Matrix)**: Verify core behavior and holistic requirements.
   - **Pass 2 (Adversarial, Boundary & Stress Matrix)**: Push edge cases, fuzz/parameterized inputs, and concurrency.
   - **Pass 3 (Stability & Efficiency Lock)**: Confirm zero regressions, lowest possible error rate (0 unhandled failures), and optimal execution efficiency.
   - **Immediate Repair Rule**: If any pass reveals a bug, fix it immediately at the owning boundary and restart/continue verification until **at least 3 clean, stable passes** succeed.

4. **Write a Visual Test Log File**:
   - Record the test execution in a clear, human-readable log file (`TEST_VERIFICATION_LOG.md` in the workspace/output directory) using the template in `references/testing-protocol.md` so the user can inspect what project environment was chosen, how many scenarios ran across each pass, what bugs were caught and fixed, and the final stability metrics.

## 5. Read Only the Relevant Reference Guide

Load only the reference file needed for the current step:

- **3-Pass stress-testing rules, scenario generation, and `TEST_VERIFICATION_LOG.md` template**: `references/testing-protocol.md`

- **Filtered plugin, MCP, CLI, and test-engine routing catalog across stacks**: `references/tool-routing-matrix.md`

- **Cross-domain holistic vs. half-baked vs. scope-creep playbooks**: `references/domain-playbooks.md`

- **Execution Mind Map & Fail-Closed Boundary Gate templates**: `references/mindmap-templates.md`

## 6. Mandatory Closing Question (Scope Expansion Offer)

Because testing and code changes are strictly confined to the user's requested feature (`Target Scope`) to save time and prevent unrequested edits, always conclude your final response in the terminal or chat box with this exact question:

> **Bạn có muốn tôi kiểm luôn các file còn lại không?**
