# claude-account-transfer

A Claude skill to duplicate your Claude usage from one Anthropic account to another: leaving a job and losing a work account, switching personal and Team accounts, consolidating.

There is no built-in transfer between Claude accounts. This skill works in two phases, on two accounts:

```
 OLD account                              NEW account
 ┌──────────────────────┐   backup     ┌──────────────────────┐
 │ 1. BACKUP            │   folder     │ 2. IMPORT            │
 │ run the skill here   │ ───────────▶ │ hand the folder to   │
 │ before it is closed  │ (drive/sync) │ Claude: it knows how │
 └──────────────────────┘              └──────────────────────┘
```

## 1. Backup: on the account you want to duplicate

Run the skill **on the old account**. Your current Claude, guided step by step:

1. **Inventories** what you really have: memory, preferences, styles, projects, skills, connectors, Claude Desktop and Claude Code config.
2. **Sorts** what leaves and what stays. On an organization account, your method leaves; the organization's data stays.
3. **Exports** to a folder `CLAUDE-BACKUP-<date>/` on an external drive or synced folder, with no credentials.
4. Writes your **working profile**: how you critique, argue, write, what "done" means to you, your blind spots. Built from your own texts, your history, your old account's view and a short interview. You validate it.
5. Makes the backup **self-describing**: it writes inside the folder a `CLAUDE.md` tailored to you, telling the new account's Claude exactly how to import it, and a `START-HERE.md` for you.
6. **Checks** with proof (counts, searches for secrets returning 0), not impressions.

Do it before the old account closes: once access is gone, nothing more can be retrieved.

## 2. Import: on the new account

Sign in to the new account, then hand it the backup folder. The new account does **not** need this skill: the backup carries its own instructions.

| You have | Do this |
|---|---|
| Claude Code | open a terminal in the backup folder, run `claude`, type `Import my backup.` |
| Claude Desktop with file access | choose the backup folder, type `Read CLAUDE.md in this folder and import my backup.` |
| claude.ai only | create a project "Claude import", upload `CLAUDE.md`, `WORKING-PROFILE.md`, `01-memory/MEMORY.md` and `02-instructions/*`, type `Import my backup.` |

Claude restores memory (through the memory importer), preferences, styles, projects, skills, connectors (reconnected and tested one by one), Desktop and Claude Code config, then runs the checks and a tone test.

## Get the skill (for the backup phase)

Without installing anything, with Claude Code:
```
git clone https://github.com/joaofmsilva1979/claude-account-transfer
cd claude-account-transfer
claude
```
Then type: `Back up this Claude account.`

Or install it:
- **Claude Code**: copy `skills/claude-account-transfer/` into `~/.claude/skills/`.
- **claude.ai / Claude Desktop**: zip the `claude-account-transfer` folder and upload it in Settings > Capabilities > Skills. In chat-only mode Claude cannot read your disk: it guides you, and you copy the local config files yourself.

Nothing is deleted on the source machine. Every copy asks for consent. Works in any language: Claude answers in yours.

## What does not transfer

Conversations as live threads (archive only), connector authorizations (reconnected on the new account), subscription and usage limits.

## Status

The Windows script (`scripts/copy-config.ps1`) has not been run on a real Windows machine yet. Feedback welcome.

## License

MIT
