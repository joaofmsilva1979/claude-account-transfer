# Step 2: sort

Goal: decide with the user what leaves. Output: `OUT/SORT.md`.

If the old account is **personal**, this step is short: confirm with the user that everything listed can go, note it, move on.

If it belongs to an **organization**, the account and its content belong to the organization. The person takes their **way of working**: instructions, skills, prompts, empty templates, profile. They leave **the data**.

Test for each item: *"Does this name a real person, or expose internal information of the organization?"* Yes: it stays. No: it can go.

## Procedure

For each item in `INVENTORY.md`, propose one of three columns and get it validated:

| Goes | Goes after cleaning | Stays |
|---|---|---|
| generic skills, instructions without names, preferences, styles | project instructions mentioning people (anonymize), document templates (empty the real examples) | knowledge files with client / member / staff / financial data, conversation history about individual cases |

"After cleaning" is done in step 3, **on the copy only**: replace names with roles ("a board member", "a client").

Review project knowledge files one by one **with the user**. Never decide alone.

## Full conversation export

A claude.ai export contains **every** conversation. For an organization account, recommend **not** copying it as is. Options:
- skip it: memory and profile carry the essentials;
- export, then keep only conversations sorted as "goes", after approval from the organization.

On Team and Enterprise plans the Export button may be reserved to the organization's owner: the user has to ask them.

Write `SORT.md`, have it read back, update `PROGRESS.md`.
