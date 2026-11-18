---
name: strict-scope-mindmap
description: Enforce two-pass prompt triage, execution mind-mapping, holistic owning-boundary completion, adaptive future-proof stress testing with visual test logs, and fail-closed scope gates across coding, UI, backend, database, CLI, game dev, and debugging tasks. Use to make agents execute the exact requested goal completely, stress-test the changed feature across dozens of scenarios until future-proof, fix bugs immediately, and never touch unrelated files without asking.
---

# Strict Scope Mindmap

Pin the user's primary objective on the first read, understand the project's runtime architecture, complete the target feature holistically at its owning boundary, verify it through an adaptive multi-scenario stress-test loop until zero future-compounding risk remains, and fail closed at every unrequested boundary.

## Scope Compatibility with Other Skills

- **Coding, UI, Backend, DB, CLI, Security, Reverse Engineering & Game Dev Tasks**: Apply the full workflow below (Two-Pass Triage -> Mind Map -> Holistic Implementation -> Adaptive Future-Proof Test Loop & Visual Log). When a domain skill is active (such as `minecraft-plugin-dev` for Paper/Purpur/Folia), combine its domain architecture rules with this skill's scope and testing gates.

- **Non-Coding Tasks** (writing, ideation, prompt design, energy planning): Apply only Steps 1-2 (Two-Pass Triage and Scope Lock) and defer output formatting to the matching skill (`match-my-writing-style`, `generate-fresh-ideas`, `focus-my-energy`, `get-more-perspectives`, `expert-prompt-architect`). Skip the code test runner on non-code tasks.

## 1. Two-Pass Prompt Triage & Project Fingerprint

Before editing any file, complete two fast passes:

1. **Pass 1 (Primary Goal & Project Context Lock)**:
   - Skim the prompt to isolate the single primary outcome (`Objective`).
   - Identify **what the project does, how it executes, and what short- and long-term runtime impact this change has** by inspecting only the minimal project descriptor (`package.json`, `pyproject.toml`, `Cargo.toml`, `pom.xml`/`build.gradle.kts`, `go.mod`, etc.) and the target entry point. Never write code blindly without knowing how the project runs.

2. **Pass 2 (Scope & Test Classification)**:
   - Sort every detail into three strict buckets:
     - **Direct Requirements**: Explicit user instructions and constraints.
     - **Holistic Must-Haves**: Co-dependent updates inside the owning boundary and its direct consumers so the primary goal is complete, cohesive, and free of long-term technical debt (e.g., switching a theme to white requires harmonizing surfaces, text contrast, borders, shadows, and interactive states together).
     - **Hard Boundary (Out of Scope)**: Sibling modules, unrelated files, and unrequested refactors.

## 2. Build the Execution Mind Map First

Before running deep searches or edits, sketch a compact Execution Mind Map:

```text
[Objective]: <One-sentence primary goal + runtime effect in this project>
├── Direct Requirements
│   └── <Explicit user instructions>
├── Holistic Must-Haves (Owning Boundary + Direct Consumers)
│   ├── <Producing change>
│   └── <Cohesive layout / state / contract / future-safety adjustments>
├── Target Scope (Allowed Reads & Edits)
│   └── <Exact files and symbols to open and modify>
├── Hardest Test Environment (Adaptive Multi-Scenario Loop on Target Scope)
│   └── <Selected plugin/runner + 20-100+ scenario matrix + adaptive stop criteria>
└── Hard Boundary (Fail-Closed Zone)
    └── <Unrelated files, modules, and sibling features strictly off-limits>
```

## 3. Target-First Implementation & Filtered Plugin Routing

- **Precision Lookups Only**: Use targeted tools (`plugins/code-analysis`: `LSP`, `ast-grep`, `Tree-sitter`, `ripgrep`) on `Target Scope` rather than scanning the entire repository. Consult `references/tool-routing-matrix.md` to select the right plugin module (`code-analysis`, `testing`, `browser-automation`, `database`, `security`, `reverse-engineering`, `minecraft`).

- **Holistic Completion**: Deliver a finished, production-grade implementation inside `Target Scope` with zero drive-by edits outside it.

- **Fail-Closed Boundary Gate**: If completing Task A genuinely requires reading or editing an out-of-scope file (Area B), **stop immediately** and ask the user by stating the exact file in Area B, why Task A fails without it, and the minimal change needed. Wait for confirmation before touching Area B.

## 4. Adaptive Future-Proof Stress Testing & Immediate Bug Repair

Whenever you write or modify code, test the requested feature using an **adaptive verification loop** driven by project maturity and long-term reliability (not a blind fixed count):

1. **Select the Strongest Test Environment for the Project**:
   - Based on the project fingerprint, choose the strictest, most realistic test harness available from `plugins/testing`, `plugins/browser-automation`, `plugins/database`, `plugins/security`, or `plugins/minecraft`. See `references/tool-routing-matrix.md` and `references/testing-protocol.md`.

2. **Stress-Test Across Diverse Scenarios (Target Feature Only)**:
   - Test **only** the feature/functions requested by the user (`Target Scope`), not unrelated files across the repo.
   - Design a heavy scenario matrix (dozens to hundreds of parameterized/generated cases where applicable) covering: happy paths, boundary/extreme values, null/empty/malformed inputs, concurrency/race conditions, memory/resource lifecycle, and failure recovery.

3. **Adaptive Pass Loop (Stop Early at Pass 2 When Clean, or Continue Until Zero Future Risk)**:
   - **Pass 1 (Functional, Holistic & Static Contract Matrix)**: Verify core behavior, types, and holistic requirements. Fix any immediate bug on the spot.
   - **Pass 2 (High-Volume Stress, Boundary, Concurrency & Long-Term Risk Matrix)**: Run the heavy parameterized/fuzz matrix and evaluate **long-term future impact** (memory growth, race windows, schema evolution, edge-case silent corruption, tick/latency budget).
   - **Adaptive Stopping & Continuation Rule**:
     - **Stop after Pass 2**: If Pass 2 shows defects have dropped to **negligible/zero** AND there are **no subtle bugs or long-term future risks** remaining, stop testing immediately after Pass 2 to save time.
     - **Mandatory Pass 3, 4, ... Continuation**: If Pass 2 (or any pass) reveals **any significant defect or even the smallest issue that could compound in the future** (e.g., potential memory leak on disconnect, unhandled edge-case input, subtle contrast/layout flaw, race condition under load, missing cleanup), you **must** fix it immediately at the owning boundary and run Pass 3 (and further passes as needed) until error rate is minimal/zero and long-term efficiency is proven.

4. **Write a Visual Test Log File**:
   - Record the test execution in a clear, human-readable log file (`TEST_VERIFICATION_LOG.md` in the workspace/output directory) using the template in `references/testing-protocol.md` so the user sees the chosen test environment, scenarios executed per pass, why testing stopped at Pass 2 or continued to Pass 3+, bugs fixed, and long-term stability metrics.

## 5. Read Only the Relevant Reference Guide

Load only the reference file needed for the current step:

- **Adaptive stress-testing rules, long-term risk gate, and `TEST_VERIFICATION_LOG.md` template**: `references/testing-protocol.md`

- **Filtered plugin catalog (`code-analysis`, `testing`, `browser-automation`, `database`, `security`, `reverse-engineering`, `minecraft`)**: `references/tool-routing-matrix.md`

- **Cross-domain holistic vs. half-baked vs. scope-creep playbooks**: `references/domain-playbooks.md`

- **Execution Mind Map & Fail-Closed Boundary Gate templates**: `references/mindmap-templates.md`

## 6. Mandatory Closing Question (Scope Expansion Offer)

Because testing and code changes are strictly confined to the user's requested feature (`Target Scope`) to save time and prevent unrequested edits, always conclude your final response in the terminal or chat box with this exact question:

> **Bạn có muốn tôi kiểm luôn các file còn lại không?**
