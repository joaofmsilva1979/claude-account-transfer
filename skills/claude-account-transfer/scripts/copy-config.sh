#!/usr/bin/env bash
# Copy Claude Desktop + Claude Code config to OUT, without credentials.
# Usage: bash copy-config.sh /path/to/CLAUDE-BACKUP-YYYY-MM-DD [--with-history]
set -euo pipefail
OUT="${1:?usage: copy-config.sh OUT [--with-history]}"
HIST="${2:-}"
REPORT="$OUT/COPY-REPORT.txt"
SRC="$HOME/.claude"
DST="$OUT/06-claude-code/.claude"
mkdir -p "$OUT/05-claude-desktop" "$DST"
echo "Copy on $(date '+%Y-%m-%d %H:%M')" > "$REPORT"

case "$(uname)" in
  Darwin) DCFG="$HOME/Library/Application Support/Claude/claude_desktop_config.json" ;;
  *)      DCFG="$HOME/.config/Claude/claude_desktop_config.json" ;;
esac
if [ -f "$DCFG" ]; then
  cp "$DCFG" "$OUT/05-claude-desktop/"
  echo "OK  claude_desktop_config.json (check 'env' blocks for secrets)" >> "$REPORT"
else
  echo "--  no claude_desktop_config.json" >> "$REPORT"
fi

# Allowlist, not denylist: ~/.claude also holds caches, venvs, pasted text and local secrets.
for item in CLAUDE.md settings.json skills agents commands output-styles plugins/installed_plugins.json plugins/known_marketplaces.json; do
  if [ -e "$SRC/$item" ]; then
    mkdir -p "$DST/$(dirname "$item")"
    cp -R "$SRC/$item" "$DST/$item"
    echo "OK  $item" >> "$REPORT"
  fi
done
if [ -d "$SRC/projects" ]; then
  if [ "$HIST" = "--with-history" ]; then
    rsync -a "$SRC/projects/" "$DST/projects/"
    echo "OK  projects/ (full history)" >> "$REPORT"
  else
    # Per-project memory only, no conversation transcripts.
    (cd "$SRC/projects" && find . -type d -name memory -prune -exec rsync -aR {} "$DST/projects/" \;)
    echo "OK  projects/*/memory only" >> "$REPORT"
  fi
fi
echo "    $(find "$DST" -type f | wc -l | tr -d ' ') files in .claude copy" >> "$REPORT"

# .claude.json holds tokens: keep MCP server names only.
if [ -f "$HOME/.claude.json" ]; then
  if command -v python3 >/dev/null; then
    python3 -c 'import json,sys; print("\n".join(json.load(open(sys.argv[1])).get("mcpServers",{})))' "$HOME/.claude.json" > "$OUT/06-claude-code/MCP-TO-REINSTALL.txt"
    echo "OK  MCP server names listed" >> "$REPORT"
  else
    echo "--  python3 missing: list MCP servers with 'claude mcp list'" >> "$REPORT"
  fi
fi

cat "$REPORT"
