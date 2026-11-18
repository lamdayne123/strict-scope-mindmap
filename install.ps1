param(
    [string]$TargetRoot = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "[strict-scope-mindmap] Installing skill and filtered plugins into: $TargetRoot"

$AgentDirs = @(
    ".agents/skills/strict-scope-mindmap",
    ".claude/skills/strict-scope-mindmap",
    ".codex/skills/strict-scope-mindmap",
    ".cursor/skills/strict-scope-mindmap",
    ".agent/skills/strict-scope-mindmap"
)

foreach ($RelDir in $AgentDirs) {
    $Dest = Join-Path $TargetRoot $RelDir
    New-Item -ItemType Directory -Force -Path $Dest | Out-Null
    Copy-Item -Path (Join-Path $ScriptDir "skill/strict-scope-mindmap/*") -Destination $Dest -Recurse -Force
    New-Item -ItemType Directory -Force -Path (Join-Path $Dest "plugins") | Out-Null
    New-Item -ItemType Directory -Force -Path (Join-Path $Dest "configs") | Out-Null
    Copy-Item -Path (Join-Path $ScriptDir "plugins/*") -Destination (Join-Path $Dest "plugins") -Recurse -Force
    Copy-Item -Path (Join-Path $ScriptDir "configs/*") -Destination (Join-Path $Dest "configs") -Recurse -Force
    Copy-Item -Path (Join-Path $ScriptDir "manifest.json") -Destination (Join-Path $Dest "manifest.json") -Force
    Write-Host "  -> Installed to $Dest"
}

Write-Host "[strict-scope-mindmap] Installation complete."
