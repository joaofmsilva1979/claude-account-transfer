# Step 1: inventory

Goal: know what exists before copying anything. Output: `OUT/INVENTORY.md`.

## A. What you can check yourself (read only)

Check each location for the user's OS. Note: exists or not, count, size, dates.

| What | Windows | macOS | Linux |
|---|---|---|---|
| Claude Desktop config (MCP servers) | `%APPDATA%\Claude\claude_desktop_config.json` | `~/Library/Application Support/Claude/claude_desktop_config.json` | `~/.config/Claude/claude_desktop_config.json` |
| Claude Code folder | `%USERPROFILE%\.claude\` | `~/.claude/` | `~/.claude/` |
| Claude Code MCP list | `%USERPROFILE%\.claude.json` | `~/.claude.json` | `~/.claude.json` |

Inside the Claude Code folder: `CLAUDE.md` (global instructions), `skills/`, `agents/`, `commands/`, `settings.json`, `plugins/`, `projects/` (session history `.jsonl` and per-project `memory/`).

`.claude.json` holds tokens: read only the **names** under `mcpServers`.

Also search for project-level `CLAUDE.md` files in Documents, Desktop and synced folders (max depth 4).

Do not read `.jsonl` contents now: count them, note first and last dates.

If you are running without file access (chat only), skip A and say so.

## B. What lives online: ask the user

claude.ai data (also what Claude Desktop shows) is stored on the account, not on disk. Ask, one at a time:

1. Which **projects** do you actually use? (names)
2. Settings > Capabilities > **Memory**: on or off?
3. Settings > Capabilities > **Skills**: any skills you added yourself? (names)
4. Settings > Profile: personal **preferences** filled in? Custom **styles**?
5. Which **connectors** and extensions are connected? Follow `references/connectors.md` sections 1 and 2 to map them.
6. Settings > Privacy: do you see **Export data**?
7. What do you mostly use Claude for? Your 5 most frequent uses.
8. Is the old account a personal one or provided by an organization?

## C. Write `OUT/INVENTORY.md`

```
# Inventory (date)
Account type: personal / organization
## claude.ai / Desktop
- projects: ...
- memory: on/off
- own skills: ...
- preferences / styles: ...
- connectors: N (see 02-instructions/CONNECTORS.md)
- export button: yes/no
## Claude Code
- global CLAUDE.md: yes/no (N lines)
- skills: N (names)
- MCP servers: names
- history: N sessions, from ... to ...
## Main uses
1. ...
```

Show the summary, update `PROGRESS.md`.
