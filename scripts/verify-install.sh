#!/usr/bin/env bash
set -euo pipefail

PACKAGE_ROOT="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

REQUIRED_PATHS=(
    "README.md"
    "LICENSE"
    "install.sh"
    "install.ps1"
    "manifest.json"
    "skill/strict-scope-mindmap/SKILL.md"
    "skill/strict-scope-mindmap/references/testing-protocol.md"
    "skill/strict-scope-mindmap/references/tool-routing-matrix.md"
    "skill/strict-scope-mindmap/references/domain-playbooks.md"
    "skill/strict-scope-mindmap/references/mindmap-templates.md"
    "plugins/code-analysis/plugin.json"
    "plugins/testing/plugin.json"
    "plugins/browser-automation/plugin.json"
    "plugins/database/plugin.json"
    "plugins/security/plugin.json"
    "plugins/reverse-engineering/plugin.json"
    "plugins/minecraft/plugin.json"
    "configs/mcp.example.json"
    "configs/agents.example.json"
    "scripts/check-dependencies.sh"
    "scripts/verify-install.sh"
)

echo "Verifying strict-scope-mindmap package structure in: ${PACKAGE_ROOT}"
missing=0
for rel in "${REQUIRED_PATHS[@]}"; do
    if [[ ! -f "${PACKAGE_ROOT}/${rel}" ]]; then
        echo "  [MISSING] ${rel}"
        missing=$((missing + 1))
    else
        echo "  [OK]      ${rel}"
    fi
done

if [[ "$missing" -gt 0 ]]; then
    echo "Verification FAILED: ${missing} file(s) missing."
    exit 1
fi

echo "Verification PASSED: All ${#REQUIRED_PATHS[@]} required files are present and valid."
