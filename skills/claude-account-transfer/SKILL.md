---
name: claude-account-transfer
description: Move someone's Claude usage (claude.ai memory, preferences, styles, projects, skills, connectors, Claude Desktop config, Claude Code setup) from one Anthropic Claude account to another, through a folder on an external drive, and build a working profile so the new account's Claude knows how they work. Use when a person changes account: leaving a job and losing a work account, switching personal to work or Team to personal, consolidating accounts.
---

# Claude account transfer

There is no built-in transfer between two Claude accounts. Conversations cannot be re-imported as conversations. What can move: memory (through the memory importer), preferences, styles, project instructions and files, skills, connector list, Claude Desktop and Claude Code configuration. This skill moves them, and adds what the old account knows and the new one does not: **how this person works**.

Talk to the user in their language. Assume they are not a developer. One question at a time.

## Two phases, two Claudes

- **Phase A, on the OLD account** (before it is closed): inventory, sort, export, profile, then build an import kit.
- **Phase B, on the NEW account**: a Claude that knows nothing runs the import kit written in phase A.

If you cannot tell which phase you are in, ask.

## Phase A

1. Ask for the destination drive and create `TRANSFER/` on it (called **OUT** below). Create `OUT/PROGRESS.md`: one line per step, status, date. Update it after each step; if the session stops, resume from it.
2. Run each step in order. Read the reference file **when you start the step**, not before.

| # | Step | Reference |
|---|---|---|
| 1 | Inventory of what the user really has and uses | `references/01-inventory.md` |
| 2 | Sort: what leaves, what stays | `references/02-sort.md` |
| 3 | Export to OUT | `references/03-export.md` |
| 4 | Working profile | `references/04-profile.md` |
| 5 | Build the import kit for phase B | `references/05-import-kit.md` |
| 6 | Checks (export part) | `references/06-checks.md` |

Tell the user upfront: about one hour, can be split across sessions, everything must be finished **before** the old account is closed.

## Phase B

If OUT contains a `CLAUDE.md` written in phase A, follow it. Otherwise use `references/restore-template.md` with what you find in OUT, then the restore part of `references/06-checks.md`.

## Non-negotiable rules

1. **Never delete or modify anything on the source machine.** Copy, never move.
2. **Explicit consent before each copy or overwrite.** Show the list, wait for yes. Back up any file you overwrite as `.bak`.
3. **No credentials in OUT.** No `.credentials.json`, tokens, API keys, passwords. In copied configs, replace secret values with `<RE-ENTER>`.
4. **If the old account belongs to an organization, its data stays there.** Content about members, clients, employees, beneficiaries, finances, HR, anyone's health or social situation does not leave. The person takes their method, not the data. When unsure, ask, and suggest checking with whoever is responsible in the organization.
5. **Never invent anything about the person.** What you have not observed, you ask or mark "to confirm".
6. **No "done" without proof.** Each step ends with something measured: a count, a size, a file opened and read back. Re-reading your own output and judging it fine is not proof.
