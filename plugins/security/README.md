# Plugin: strict-scope-security

Static security analysis, secret detection, dependency auditing, IaC policy checks, and smart-contract verification.

## Filtered Tool Catalog

| Tool / Integration | Target-Scoped Role |
| --- | --- |
| `Semgrep / CodeQL` | Taint tracking and vulnerability pattern detection |
| `Gitleaks / TruffleHog` | Pre-commit and diff secret/credential leak scanning |
| `Snyk / OSV-Scanner / OWASP Dependency-Check` | Dependency CVE and supply-chain vulnerability auditing |
| `Trivy / Grype / Syft` | Container image, filesystem, and SBOM security scanning |
| `Checkov / KICS` | Terraform, Kubernetes, and Dockerfile IaC security checks |
| `Bandit / Brakeman` | Python and Ruby security static analyzers |
| `OWASP ZAP / Nuclei` | Authorized dynamic web and API vulnerability probing |
| `Open Policy Agent (OPA) / Conftest` | Policy-as-code enforcement on configs and manifests |
| `Slither / Mythril / Solhint` | Smart contract reentrancy and overflow static analysis |
| `Sigstore / Cosign` | Artifact signing and provenance verification |

## Usage Rules in `strict-scope-mindmap`

1. **Scope Lock**: Invoke these tools strictly on files and endpoints inside `Target Scope`.
2. **Adaptive Testing**: Use the verification tools in this module during Pass 1 and Pass 2+. Stop at Pass 2 only if error rate is negligible/zero and long-term future risk is zero; otherwise fix immediately and continue to Pass 3+.
