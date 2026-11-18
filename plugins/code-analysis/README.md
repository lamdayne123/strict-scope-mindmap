# Plugin: strict-scope-code-analysis

Precision AST, LSP, symbol, and static analysis tools for reading only Target Scope without repo-wide noise.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `LSP (typescript-language-server / Pyright / gopls / rust-analyzer / jdtls / clangd)` | Symbol definitions, hover types, references, and diagnostics |
| `Tree-sitter` | Multi-language incremental AST parsing |
| `ast-grep` | Structural AST pattern search and targeted rewrite |
| `ripgrep (rg)` | Fast path-scoped regex search |
| `SCIP / ctags` | Symbol indexing and cross-reference lookup |
| `Semgrep` | Rule-based AST bug and anti-pattern analysis |
| `CodeQL` | Semantic code query and dataflow analysis |
| `SonarQube` | Code smells, complexity, and maintainability gates |
| `Understand` | Dependency and architecture graph inspection |
| `Sourcegraph / Zoekt / OpenGrok` | Multi-repository indexed code search |
| `Gitingest` | Targeted repository digest generation |
| `Git CLI / GitHub MCP / gh / glab` | Diff verification and scope containment audit |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
