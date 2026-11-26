# Step 5: build the import kit

After the old account closes, you are gone. The new account's Claude knows nothing. Leave in OUT a self-contained kit it can run without asking you anything.

## Create in OUT

### 1. `OUT/START-HERE.md` (for the person)
One page:
- install Claude Desktop and/or Claude Code, sign in to the **new** account;
- open a terminal in OUT, run `claude`, type **`Run my import.`**;
- without Claude Code: use a Claude Desktop mode with file access on this folder, or follow `CLAUDE.md` by hand.

### 2. `OUT/CLAUDE.md` (for the new account's Claude)
Write it **from what you observed**, not from a generic template:
- Who the person is, 5 lines from `WORKING-PROFILE.md`: how to talk to them, what they expect.
- What OUT contains: the real list of folders and files, with counts.
- Restore steps adapted from `references/restore-template.md`: remove what does not apply (no Claude Code section if they never used it, no projects if none were kept), add what is specific (names of their projects, skills, connectors).
- Rules: `.bak` before overwriting, consent before each action, re-enter `<RE-ENTER>` values with them, invent nothing.
- The tone test and the restore checks.
- Final instruction: after restore, add `WORKING-PROFILE.md` to the new account (preferences + projects) and offer to update it in a month.

### 3. `OUT/CHECKS.md`
Copy of the restore part of `references/06-checks.md`, with real expected numbers (e.g. "skills uploaded: 4").

## Verify
Read `OUT/CLAUDE.md` as a Claude that knows nothing:
- every file it mentions exists in OUT (list missing ones: expected 0);
- no step relies on information that only exists in your current conversation;
- no credentials, no third-party names.

Show `START-HERE.md` to the user. Update `PROGRESS.md`.
