#!/usr/bin/env bash
set -euo pipefail

echo "=== strict-scope-mindmap: Environment & Plugin Tool Discovery ==="
check_group() {
    local group_name="$1"
    shift
    local found=()
    local missing=()
    for cmd in "$@"; do
        if command -v "$cmd" >/dev/null 2>&1; then
            found+=("$cmd")
        else
            missing+=("$cmd")
        fi
    done
    echo "[$group_name]"
    echo "  Available : ${found[*]:-none}"
    echo "  Optional  : ${missing[*]:-none}"
}

check_group "code-analysis" git rg ast-grep semgrep pyright gopls rust-analyzer clangd
check_group "testing" pytest vitest jest go cargo mvn gradle k6 hyperfine
check_group "browser-automation" playwright cypress lighthouse eslint stylelint
check_group "database" psql sqlite3 mysql redis-cli duckdb prisma alembic
check_group "security" gitleaks trivy osv-scanner bandit opa conftest
check_group "reverse-engineering" rea rizin radare2 jadx apktool frida tshark binwalk gdb lldb strace javap
check_group "minecraft" java javac gradle mvn
