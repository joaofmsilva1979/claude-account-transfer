# Copy Claude Desktop + Claude Code config to OUT, without credentials.
# Usage: powershell -ExecutionPolicy Bypass -File copy-config.ps1 -Out E:\CLAUDE-BACKUP-YYYY-MM-DD [-WithHistory]
param([Parameter(Mandatory=$true)][string]$Out, [switch]$WithHistory,
      [string]$DesktopDir = "05-claude-desktop", [string]$CodeDir = "06-claude-code")

$ErrorActionPreference = "Stop"
$report = Join-Path $Out "COPY-REPORT.txt"
$src = Join-Path $env:USERPROFILE ".claude"
$dst = Join-Path $Out "$CodeDir\.claude"
New-Item -ItemType Directory -Force -Path (Join-Path $Out $DesktopDir), $dst | Out-Null
"Copy on $(Get-Date -Format 'yyyy-MM-dd HH:mm')" | Set-Content $report

$dcfg = Join-Path $env:APPDATA "Claude\claude_desktop_config.json"
if (Test-Path $dcfg) {
    Copy-Item $dcfg (Join-Path $Out $DesktopDir)
    "OK  claude_desktop_config.json (check 'env' blocks for secrets)" | Add-Content $report
} else { "--  no claude_desktop_config.json" | Add-Content $report }

# Allowlist, not denylist: .claude also holds caches, venvs, pasted text and local secrets.
$items = "CLAUDE.md", "settings.json", "skills", "agents", "commands", "output-styles",
         "plugins\installed_plugins.json", "plugins\known_marketplaces.json"
foreach ($i in $items) {
    $p = Join-Path $src $i
    if (Test-Path $p) {
        $target = Join-Path $dst $i
        New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
        Copy-Item $p $target -Recurse -Force
        "OK  $i" | Add-Content $report
    }
}
$proj = Join-Path $src "projects"
if (Test-Path $proj) {
    if ($WithHistory) {
        Copy-Item $proj (Join-Path $dst "projects") -Recurse -Force
        "OK  projects (full history)" | Add-Content $report
    } else {
        # Per-project memory only, no conversation transcripts.
        Get-ChildItem $proj -Directory | ForEach-Object {
            $m = Join-Path $_.FullName "memory"
            if (Test-Path $m) {
                $t = Join-Path $dst "projects\$($_.Name)"
                New-Item -ItemType Directory -Force -Path $t | Out-Null
                Copy-Item $m $t -Recurse -Force
            }
        }
        "OK  projects\*\memory only" | Add-Content $report
    }
}
$n = (Get-ChildItem $dst -Recurse -File | Measure-Object).Count
"    $n files in .claude copy" | Add-Content $report

# .claude.json holds tokens: keep MCP server names only.
$cj = Join-Path $env:USERPROFILE ".claude.json"
if (Test-Path $cj) {
    $mcp = (Get-Content $cj -Raw | ConvertFrom-Json).mcpServers
    if ($mcp) {
        $mcp.PSObject.Properties.Name | Set-Content (Join-Path $Out "$CodeDir\MCP-TO-REINSTALL.txt")
        "OK  MCP server names listed" | Add-Content $report
    }
}

Get-Content $report
