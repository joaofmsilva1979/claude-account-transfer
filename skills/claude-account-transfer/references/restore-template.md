# Restore on the new account (template, adapted in step 5)

Run while signed in to the **new** account. Confirm you are on the new account, then read `PROGRESS.md` and `INVENTORY.md`. Restore only what exists in OUT.

## Order
1. **Memory**: claude.ai > Settings > Capabilities > Memory > import memory from another provider. The user pastes `01-memory/MEMORY.md`, then tells you what was kept.
2. **Preferences**: Settings > Profile. Paste `preferences.md`, then the "Instructions for Claude" section of `WORKING-PROFILE.md`. If there is a length limit, condense with the user, keeping the instructions.
3. **Styles**: recreate from `styles.md`.
4. **Projects**: create each project, paste its instructions, upload files from `03-project-files/<project>/`, add `WORKING-PROFILE.md` as a knowledge file.
5. **Skills (claude.ai / Desktop)**: zip each folder of `04-skills/` (the zip contains the folder, with `SKILL.md` inside), then Settings > Capabilities > Skills > Upload.
6. **Connectors**: follow `CONNECTORS.md` and section 4 of `references/connectors.md`: reconnect, replace or drop each one, test each with a read-only request, update the projects and skills that depended on them.
7. **Claude Desktop config**: copy `05-claude-desktop/claude_desktop_config.json` to the OS location (see `01-inventory.md`) **after** showing it, checking paths and re-entering `<RE-ENTER>` values. Back up any existing file as `.bak`.
8. **Claude Code**: `claude`, sign in to the new account. Copy from `06-claude-code/.claude/`: `CLAUDE.md`, `skills/`, `agents/`, `commands/`, `settings.json` (back up existing as `.bak`). Reinstall MCP servers from `MCP-TO-REINSTALL.txt` one by one, with the user.
9. **Exported conversations** (if any): do not load them all. Offer an "ARCHIVE" project with the ones the user names as useful.

## Tone test
In a new chat, the user asks: *"Write me a short email declining an invitation."* They judge whether it sounds like them. If not, adjust the preferences, not the answer.

Then run the restore checks.
