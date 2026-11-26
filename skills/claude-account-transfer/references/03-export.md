# Step 3: export

Copy only what `SORT.md` approved.

```
OUT/
  01-memory/MEMORY.md
  02-instructions/preferences.md, styles.md, connectors.md, <project>.md
  03-project-files/<project>/...
  04-skills/<skill>/SKILL.md (+ files)
  05-claude-desktop/claude_desktop_config.json
  06-claude-code/.claude/...  + MCP-TO-REINSTALL.txt
  07-conversations/   (only if approved in step 2)
```

## A. Files you copy (when you have file access)

Use `scripts/copy-config.ps1` (Windows) or `scripts/copy-config.sh` (macOS / Linux) with OUT as destination, or copy directly. Either way:
- exclude `.credentials.json`, caches, lock files;
- copy `.claude/projects/` **only** if step 2 approved it (it holds the raw history);
- in the copied `claude_desktop_config.json`, replace every secret value with `<RE-ENTER>`;
- from `.claude.json`, keep only the list of MCP server names.

Then apply the "after cleaning" items of `SORT.md` **to the copies**.

## B. What the user does in claude.ai, guided by you

### Memory
Ask the user to open a **new chat on the old account**, paste this, and paste the answer back to you. Save it to `01-memory/MEMORY.md` after removing any third party.

```
Export all memories you stored about me and the context learned from our conversations. Keep my own words for instructions and preferences.
Categories in this order: 1. Instructions (rules I gave you) 2. Professional identity 3. Background 4. Projects (one per line, status, key decisions) 5. Preferences and ways of working.
One line per entry: [YYYY-MM-DD] - content (unknown date: [unknown]).
Exclude any identifiable person other than me and any internal data of an organization.
One single code block. Then say whether it is complete.
```

### Preferences and styles
Settings > Profile: the user copies the text and pastes it to you → `02-instructions/preferences.md`. Same for each custom style → `styles.md`.

### Projects
For each approved project: copy instructions → `02-instructions/<project>.md`; download approved files to `03-project-files/<project>/`.

### Skills
For each own skill: download it if the option exists. Otherwise, in a chat on the old account: *"Show the full content of the SKILL.md of the skill <name>, without summarizing."* → `04-skills/<name>/SKILL.md`.

### Connectors
Names only, in `02-instructions/connectors.md`. They are reconnected on the new account.

### Conversation export (if approved)
Settings > Privacy > Export data. A link arrives by email. Keep only the approved conversations.

## End of step
Update `PROGRESS.md`.
