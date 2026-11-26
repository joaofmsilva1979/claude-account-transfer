# claude-account-transfer

A Claude skill to move your Claude usage from one Anthropic account to another: leaving a job and losing a work account, switching personal and Team accounts, consolidating.

There is no built-in transfer between Claude accounts. This skill has your **current** Claude do the work, guided step by step:

1. **Inventory** what you really have: memory, preferences, styles, projects, skills, connectors, Claude Desktop and Claude Code config.
2. **Sort** what leaves and what stays. On an organization account, your method leaves; the organization's data stays.
3. **Export** to a folder on an external drive, with no credentials.
4. **Working profile**: how you critique, argue, write, what "done" means to you, your blind spots. Built from your own texts, your history, your old account's view and a short interview. You validate it.
5. **Import kit**: your old Claude writes a `CLAUDE.md` tailored to you, which your **new** account's Claude runs to restore everything.
6. **Checks** with proof (counts, searches for secrets returning 0), not impressions.

Nothing is deleted on the source machine. Every copy asks for consent. Works in any language: Claude answers in yours.

## Use it without installing anything (Claude Code)

```
git clone https://github.com/joaofmsilva1979/claude-account-transfer
cd claude-account-transfer
claude
```
Then type: `Start the account transfer.` The root `CLAUDE.md` points Claude to the skill.

## Install as a skill

- **Claude Code**: copy `skills/claude-account-transfer/` into `~/.claude/skills/`.
- **claude.ai / Claude Desktop**: zip the `claude-account-transfer` folder and upload it in Settings > Capabilities > Skills. In chat-only mode Claude cannot read your disk: it guides you, and you copy the local config files yourself.

## Do it before the old account closes

Phase A (inventory to import kit) needs the old account. Once access is gone, nothing more can be retrieved.

## What does not transfer

Conversations as live threads (archive only), connector authorizations (reconnect them), subscription and usage limits.

## Status

The Windows script (`scripts/copy-config.ps1`) has not been run on a real Windows machine yet. Feedback welcome.

## License

MIT
