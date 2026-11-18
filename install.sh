#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ROOT="${1:-$(pwd)}"

echo "[strict-scope-mindmap] Installing skill and filtered plugins into: ${TARGET_ROOT}"

for AGENT_DIR in ".agents/skills" ".claude/skills" ".codex/skills" ".cursor/skills" ".agent/skills"; do
    DEST="${TARGET_ROOT}/${AGENT_DIR}/strict-scope-mindmap"
    mkdir -p "${DEST}"
    cp -R "${SCRIPT_DIR}/skill/strict-scope-mindmap/"* "${DEST}/"
    mkdir -p "${DEST}/plugins" "${DEST}/configs"
    cp -R "${SCRIPT_DIR}/plugins/"* "${DEST}/plugins/"
    cp -R "${SCRIPT_DIR}/configs/"* "${DEST}/configs/"
    cp "${SCRIPT_DIR}/manifest.json" "${DEST}/manifest.json"
    echo "  -> Installed to ${DEST}"
done

echo "[strict-scope-mindmap] Installation complete. Run ./scripts/verify-install.sh "${TARGET_ROOT}" to verify."
