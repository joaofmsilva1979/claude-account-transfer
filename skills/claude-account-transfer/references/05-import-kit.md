# Step 5: make the backup self-describing

After the old account closes, you are gone. The new account's Claude knows nothing, and may not have this skill. The backup folder must explain itself: what it contains, and how to import it.

## Create in OUT

### 1. `OUT/START-HERE.md` (for the person)
One page, three ways to hand the backup to the new account's Claude. First: sign in to the **new** account.
- **Claude Code**: open a terminal in this folder, run `claude`, type `Import my backup.`
- **Claude Desktop with file access**: choose this folder, type `Read CLAUDE.md in this folder and import my backup.`
- **claude.ai only**: create a project "Claude import", upload `CLAUDE.md`, `WORKING-PROFILE.md`, `01-memory/MEMORY.md` and the files of `02-instructions/`, then type `Import my backup.` in that project.
Recommend the first available option, from what you saw in step 1. Add: do this before deleting anything from the drive.

### 2. `OUT/CLAUDE.md` (for the new account's Claude)
First line exactly: `# Claude backup (<YYYY-MM-DD>): import instructions`. This header is how a Claude recognizes a backup folder.

Write it **from what you observed**, not from a generic template:
- First paragraph: "You are on the NEW account. Your job is to import this backup. Do not run a new backup." If the user says this is still the old account, stop and say so.
- Who the person is, 5 lines from `WORKING-PROFILE.md`: how to talk to them, what they expect.
- What OUT contains: the real list of folders and files, with counts.
- How to work depending on how you were given the backup: with file access, read and copy files yourself; in a claude.ai project, you only see the uploaded files, so guide the user to copy local config files themselves and to paste or upload what you need.
- Restore steps adapted from `references/restore-template.md`: remove what does not apply (no Claude Code section if they never used it, no projects if none were kept), add what is specific (names of their projects, skills). Copy the connector rows of `CONNECTORS.md` with their decision, and section 4 of `references/connectors.md` in full.
- Rules: `.bak` before overwriting, consent before each action, re-enter `<RE-ENTER>` values with them, invent nothing.
- The tone test and the restore checks.
- Final instruction: after the checks, keep `WORKING-PROFILE.md` in preferences and important projects, offer to delete the "Claude import" project if one was used, and offer to update the profile in a month.

### 3. `OUT/CHECKS.md`
Copy of the restore part of `references/06-checks.md`, with real expected numbers (e.g. "skills uploaded: 4").

## Verify
Read `OUT/CLAUDE.md` as a Claude that knows nothing and does not have this skill:
- every file it mentions exists in OUT (list missing ones: expected 0);
- no step relies on information that only exists in your current conversation or in this skill;
- no credentials, no third-party names.

Show `START-HERE.md` to the user. Update `PROGRESS.md`.
