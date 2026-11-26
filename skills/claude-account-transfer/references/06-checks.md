# Step 6: checks (proof, not impressions)

Each line is ticked with evidence: a number, a file opened, a search that returns nothing. "Looks fine" does not count. Write results into `PROGRESS.md`.

## After export (before the old account closes)
- [ ] Every "goes" item of `SORT.md` exists in OUT: list missing items (expected 0).
- [ ] Search OUT for real secret values (`sk-ant-`, `ghp_`, `AKIA`, `Bearer ` followed by a value, `"password": "`...) and open every hit of `token`, `apiKey`, `secret`: the word alone in documentation is fine, an actual value is not. Real values found: expected 0, apart from `<RE-ENTER>`.
- [ ] Search OUT for the names of people mentioned during the sort: number of hits (expected 0).
- [ ] `MEMORY.md`, `WORKING-PROFILE.md`, `preferences.md`: non-empty, opened and read back.
- [ ] `WORKING-PROFILE.md` validated by the user (their answer noted in `PROGRESS.md`).
- [ ] Every file named in `OUT/CLAUDE.md` exists (expected 0 missing).
- [ ] Total size and file count of OUT noted.
- [ ] `CONNECTORS.md`: one row per connector found, each with connected account and decision filled (rows missing a decision: expected 0).
- [ ] The user confirms everything was retrieved before access to the old account ends.

## After restore (new account)
- [ ] Memory: the user has read what the importer kept.
- [ ] Preferences pasted: checked on screen.
- [ ] Skills uploaded = folders in `04-skills`; one skill tested for real.
- [ ] Projects recreated = folders in `03-project-files`.
- [ ] Claude Code: `claude` starts on the new account and `CLAUDE.md` is loaded (ask it to summarize it).
- [ ] Tone test passed (see restore template).
- [ ] Connectors: section 5 of `references/connectors.md` (connected and tested = planned; 0 mentions of dropped connectors).

When all are ticked: one sentence to close, and a reminder that the drive holds copies of their setup and should be stored safely.
