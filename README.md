# Strict Scope Mindmap

A workflow skill for coding agents that helps keep implementation focused: clarify the request, identify the files involved, avoid unrelated changes, and verify the result.

Strict Scope Mindmap is a collection of instructions and reference files—not a standalone application. It guides an agent; it does not sandbox file access or guarantee bug-free code.

## What it does

- Separates a task into direct requirements, necessary related work, and out-of-scope work.
- Has the agent outline a target scope before deep searches or edits.
- Encourages focused code inspection instead of broad repository scans.
- Requires the agent to ask before crossing a stated boundary to inspect or change another file.
- Provides testing guidance, tool catalogs, and a test-log template.

## Install

You need Git to clone the repository. The installers copy the packaged Skill into a project directory. They do not install the optional tools listed in the catalogs.

### Windows Command Prompt (CMD)

```bat
git clone https://github.com/lamdayne123/strict-scope-mindmap.git
cd strict-scope-mindmap
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -TargetRoot "C:\path\to\your\project"
```

Replace `C:\path\to\your\project` with the project where your coding agent will work. To install into the current directory instead, omit `-TargetRoot`:

```bat
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

### PowerShell

From the cloned repository:

```powershell
.\install.ps1 -TargetRoot "C:\path\to\your\project"
```

Or use the current directory:

```powershell
.\install.ps1
```

### macOS, Linux, Git Bash, or WSL

```bash
git clone https://github.com/lamdayne123/strict-scope-mindmap.git
cd strict-scope-mindmap
./install.sh /path/to/your/project
```

Omit the project path to use the current directory:

```bash
./install.sh
```

The installers copy the Skill to these five locations under the target root:

```text
.agents/skills/strict-scope-mindmap
.claude/skills/strict-scope-mindmap
.codex/skills/strict-scope-mindmap
.cursor/skills/strict-scope-mindmap
.agent/skills/strict-scope-mindmap
```

They create all five locations. Your agent needs to support its corresponding skill directory to use the installed files.

## npm

This repository is not published as an npm package and does not contain a `package.json`. There is no supported `npm install` or `npm run` command for installing this Skill. Use the scripts above instead. Some example MCP configurations use `npx` to launch separately configured tools; that is unrelated to installing Strict Scope Mindmap.

## Use it

After installation, ask your coding agent to follow `strict-scope-mindmap` for a task. For example:

> Add cursor pagination to `GET /api/v1/transactions`. Before editing, identify the target files and what is out of scope. Ask me before inspecting or changing files outside that scope. Implement the necessary changes and report how you verified them.

The agent should first identify the goal and project context, outline its target scope, inspect relevant code, and then implement and test the requested change. The Skill recommends available tools based on the project's stack; it does not automatically install or run them.

## Testing and verification

For code changes, the Skill directs the agent to select a suitable test environment and focus checks on the target feature. Its guidance covers functional behavior, boundary and malformed inputs, concurrency, and relevant lifecycle or scale risks. It also provides a template for recording verification in `TEST_VERIFICATION_LOG.md`.

The packaged Skill allows testing to stop after Pass 2 only when no scenarios fail and the future-risk review is clean; if issues remain, the agent should fix them and continue testing. The separate root-level `SKILL.md` specifies at least three passes. The installers use the packaged version in `skill/strict-scope-mindmap/`.

## Repository files

- `skill/strict-scope-mindmap/` — packaged Skill and references copied by the installers.
- `SKILL.md` and `references/` — root-level copies of the Skill instructions and guides.
- `plugins/` — tool catalogs and manifests; these do not install the listed tools.
- `configs/` — example agent and MCP configuration files.
- `install.sh`, `install.ps1` — installation scripts for Bash and PowerShell.
- `scripts/check-dependencies.sh` — reports selected optional commands available in a Unix-like shell.
- `scripts/verify-install.sh` — checks for expected package files; run it from Bash, Git Bash, or WSL.
- `manifest.json` — package metadata and paths to the Skill, plugins, and scripts.

Optional checks, run from the cloned repository in Bash, Git Bash, or WSL:

```bash
./scripts/check-dependencies.sh
./scripts/verify-install.sh
```

These scripts do not install missing tools or confirm that an agent has loaded the Skill.

## Notes

- Tool catalogs are suggestions. Install and configure any tools separately.
- Example configuration files may need changes for your environment.
- The Skill relies on the coding agent following its instructions; it is not a technical access-control boundary.

## License

MIT. See [LICENSE](LICENSE).
