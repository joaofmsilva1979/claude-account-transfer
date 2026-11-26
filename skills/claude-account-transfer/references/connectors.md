# Connectors and MCP servers

Used in steps 1 (inventory), 3 (export), restore and checks. Connectors never transfer: authorizations are tied to the old account. What transfers is the **map**: what was connected, to which account, what depends on it, and what to do on the new account.

## 1. Find them (four places)

| Where | How to see it |
|---|---|
| claude.ai connectors (also used by Desktop) | user opens Settings > Connectors and reads the list to you: built-in ones (Google Drive, Gmail, Calendar, Microsoft 365, Notion, Slack...) and **custom** ones (note their URL) |
| Claude Desktop extensions | user opens Settings > Extensions and reads the list |
| Claude Desktop local MCP servers | `mcpServers` in `claude_desktop_config.json` |
| Claude Code MCP servers | `claude mcp list` (all scopes), `mcpServers` in `~/.claude.json`, and any `.mcp.json` in project folders |

On Team or Enterprise plans, some connectors may have been enabled by an admin for the whole organization: ask the user which ones they added themselves.

## 2. Map them: `OUT/02-instructions/CONNECTORS.md`

One row per connector:

| Name | Where | Type | Connected account | Used by | On the new account |
|---|---|---|---|---|---|
| e.g. Google Drive | claude.ai | built-in | organization workspace | project "Reports", skill "weekly-brief" | replace with personal Drive / drop |

- **Type**: built-in, custom (URL), Desktop extension, local command.
- **Connected account**: ask, never guess. Personal or organization.
- **Used by**: projects, skills, instructions, scheduled tasks that mention it. Search the exported instructions and skills for its name.
- **On the new account**: `reconnect` (same service, personal login), `replace with ...`, or `drop`.

**Organization accounts do not follow.** A connector to the organization's mail, drive, calendar or CRM cannot be reconnected from a personal account, and must not be. Mark it `replace` or `drop`, and list every project or skill that relied on it: their instructions must be updated during restore, otherwise they will call a connector that no longer exists.

## 3. Export details for local and custom servers

For each local MCP server (Desktop or Code) and each custom connector, record in `CONNECTORS.md`: command and arguments, or URL. Replace every value in `env`, `headers`, and any argument carrying a key, token or password with `<RE-ENTER>`. Note where the user can get a new key (service settings page), not the key.

## 4. Restore (new account)

Order: built-in connectors, custom connectors, Desktop extensions, local MCP servers.
For each row marked `reconnect` or `replace`:
1. Connect it with the user's **new** login.
2. Test with one read-only request (e.g. "list my 3 most recent files"). Note the result.
3. Update every project or skill listed under "Used by" if the name or service changed.

Rows marked `drop`: remove or rewrite the mentions in restored instructions and skills.

## 5. Check
- Connected and tested = rows marked `reconnect` + `replace` (expected equal).
- Search restored instructions and skills for names of `drop` connectors: expected 0 hits.
