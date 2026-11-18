# Strict Scope Mindmap

A workflow skill for coding agents that helps keep a task focused: understand the request, map what is in and out of scope, make the needed changes, and verify them before wrapping up.

It is a set of instructions and reference files, not a standalone app. It does not sandbox an agent or guarantee that its changes are correct.

## What it does

- Separates a request into explicit requirements, necessary related work, and out-of-scope changes.
- Gets the agent to make a short execution plan before deep code searches or edits.
- Encourages targeted inspection instead of broad, unrelated repository scans.
- Asks the agent to pause and get approval when a required change crosses the agreed boundary.
- Provides testing guidance and a template for recording verification.
- Includes optional tool catalogs and example configuration for several coding environments.

## Install

You need Git to clone the repository. The installer copies the skill and its supporting files into a project directory; it does not install third-party tools listed in the catalogs.

### Windows Command Prompt (CMD)

Clone the repository, then run the PowerShell installer from CMD:

```bat
git clone https://github.com/lamdayne123/strict-scope-mindmap.git
cd strict-scope-mindmap
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1 -TargetRoot "C:\path\to\your\project"
```

To install into the current directory instead, leave off `-TargetRoot`:

```bat
powershell -NoProfile -ExecutionPolicy Bypass -File .\install.ps1
```

Replace `C:\path\to\your\project` with the project where your coding agent will work. The install script can be run again to refresh the installed files.

### PowerShell

From the repository directory:

```powershell
.\install.ps1 -TargetRoot "C:\path\to\your\project"
```

Or install into the current directory:

```powershell
.\install.ps1
```

### macOS, Linux, Git Bash, or WSL

```bash
git clone https://github.com/lamdayne123/strict-scope-mindmap.git
cd strict-scope-mindmap
./install.sh /path/to/your/project
```

Omit the project path to install into the current directory:

```bash
./install.sh
```

## About npm

This repository is not an npm package and has no `package.json`. You do not need `npm install` or `npm run` to install the skill. Use the installer above. The example MCP configuration uses `npx` to launch optional MCP servers; those are separate tools and are only needed if you choose to configure them.

## Where the files are installed

The installers copy the skill into these directories under your target project:

```text
.agents/skills/strict-scope-mindmap
.claude/skills/strict-scope-mindmap
.codex/skills/strict-scope-mindmap
.cursor/skills/strict-scope-mindmap
.agent/skills/strict-scope-mindmap
```

The installers create all five locations. Your coding agent will use the one matching its conventions, if it supports that skill directory.

## Use it

After installation, ask your coding agent to follow `strict-scope-mindmap` while working on a task. For example:

> Add cursor pagination to `GET /api/v1/transactions`. Keep the change limited to the endpoint and the direct files needed to complete it. Before editing, outline the requirements, target files, boundaries, and verification plan. Ask me before touching anything outside that scope.

The skill guides the agent to identify the goal and project context, outline its target scope, inspect relevant code, implement the requested change, and report what it checked. Its testing guidance is a template for the agent to apply to the project; the actual tests depend on the repository and available tools.

## Repository contents

| Path | Purpose |
| --- | --- |
| `skill/strict-scope-mindmap/` | Packaged skill and its reference guides; this is what the installers copy. |
| `SKILL.md` and `references/` | Root-level copies of the skill instructions and guides. |
| `plugins/` | Manifests and readmes describing optional tool groups. These do not install the tools. |
| `configs/` | Example agent and MCP configuration files. Adapt them to your setup before use. |
| `install.sh`, `install.ps1` | Install the packaged files on Unix-like systems and Windows. |
| `scripts/check-dependencies.sh` | Lists selected optional commands found in a Unix-like shell. It does not install anything. |
| `scripts/verify-install.sh` | Checks that expected package files are present. Run it from Bash, Git Bash, or WSL. |
| `manifest.json` | Package metadata, supported agent names, plugin references, and script paths. |

## Optional checks

On Windows, run the package-file check from Git Bash or WSL. From the repository root:

```bash
./scripts/verify-install.sh
```

To check which optional tools are available in that shell:

```bash
./scripts/check-dependencies.sh
```

These scripts do not test an installed coding agent or install missing dependencies.

## Notes

- The tool lists are suggestions, not bundled integrations. Install and configure any tools separately.
- The example files in `configs/` are starting points, not ready-made configuration for every agent.
- The skill relies on the coding agent following its instructions. It is not a technical access-control boundary.
- The packaged copy under `skill/strict-scope-mindmap/` is the version installed by the scripts.

## License

MIT. See [LICENSE](LICENSE).
