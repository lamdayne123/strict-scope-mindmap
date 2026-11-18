# strict-scope-mindmap

A production-grade AI agent skill and filtered plugin bundle for **Antigravity, Claude Code, Codex, Cursor, Gemini CLI, Cline, Roo Code, and OpenHands**.

## Core Guarantees

1. **Two-Pass Prompt Triage & Project Fingerprint**:
   - **Pass 1**: Skim the prompt to lock onto the single primary objective and inspect the project manifest/entrypoint so the agent understands what the project does and how it runs before touching code.
   - **Pass 2**: Classify every requirement into **Direct Requirements**, **Holistic Must-Haves** (e.g., switching a website theme to white updates surfaces, text contrast, borders, shadows, and interactive states together), and **Hard Boundary (Out of Scope)**.
2. **Execution Mind Map Before Action**:
   - Maps Objective, Holistic Must-Haves, Target Scope, Hardest Test Environment, and Fail-Closed Boundaries before opening files.
3. **Fail-Closed Scope Gate**:
   - Never wanders into unrelated files or refactors unrequested modules. If Task A genuinely requires reading or editing Area B, the agent stops and asks the user first.
4. **Adaptive, Future-Proof Multi-Scenario Testing & Visual Log (`TEST_VERIFICATION_LOG.md`)**:
   - Automatically selects the strongest test environment from the bundled `plugins/` catalog.
   - Runs dozens to hundreds of diverse scenarios strictly on the requested feature (`Target Scope`).
   - **Adaptive Pass Rule**: If by **Pass 2** defects have dropped to negligible/zero and there are **zero long-term future risks**, the agent stops early to save time. If **any** issue remains—even a small edge case, memory leak, or concurrency risk that could compound in the future—the agent fixes it immediately and continues running **Pass 3, Pass 4, ...** until clean.
   - Always concludes code/test responses with: **`Bạn có muốn tôi kiểm luôn các file còn lại không?`**

## Package Layout

```text
strict-scope-mindmap/
├── README.md
├── LICENSE
├── install.sh
├── install.ps1
├── manifest.json
├── skill/
│   └── strict-scope-mindmap/
│       ├── SKILL.md
│       └── references/
│           ├── testing-protocol.md
│           ├── tool-routing-matrix.md
│           ├── domain-playbooks.md
│           └── mindmap-templates.md
├── plugins/
│   ├── code-analysis/
│   ├── testing/
│   ├── browser-automation/
│   ├── database/
│   ├── security/
│   ├── reverse-engineering/
│   └── minecraft/
├── configs/
│   ├── mcp.example.json
│   └── agents.example.json
└── scripts/
    ├── check-dependencies.sh
    └── verify-install.sh
```

## Quick Start

### Linux / macOS
```bash
chmod +x install.sh scripts/*.sh
./scripts/verify-install.sh
./scripts/check-dependencies.sh
./install.sh /path/to/your/project
```

### Windows (PowerShell)
```powershell
.\install.ps1 -TargetRoot "C:\path\to\your\project"
```
