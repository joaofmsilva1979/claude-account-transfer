# Step 4: working profile

The most valuable file of the transfer. It lets the new account's Claude work with the person at the same level from day one. Output: `OUT/WORKING-PROFILE.md`.

## Sources, most reliable first
1. **What the user tells you** in the interview (C).
2. **Their own texts**: `MEMORY.md`, `preferences.md`, project instructions, `CLAUDE.md`, skills they wrote.
3. **Their Claude Code history** (`.claude/projects/*.jsonl`), if they agree: read their messages (role `user`), not the assistant's. Look at how they phrase, what they correct, what they refuse.
4. **The old account's view** (B): it may have known them longer than you.

## A. What you look for
- **Critique**: what they question first, how they spot a weakness, what makes them say no.
- **Constructiveness**: how they turn a critique into a proposal.
- **Argumentation**: facts, numbers, examples or principles? In what order? What convinces them?
- **Tone and style**: register, sentence length, recurring phrasings, words they use and words they never use, formality by audience.
- **Standards**: what they always send back, what "done" means to them.
- **Decision habits**: who decides, who does, who is accountable.
- **Blind spots**: where a good assistant should push back.

## B. Prompt for the old account
The user pastes it into a new chat on the old account, then pastes the answer back:

```
I am changing Claude account. You know me through our conversations and your memory. Describe how I work, so a new Claude can work with me at the same level.
For each point, give a real example from our exchanges, paraphrased, with no third-party name and no internal data. If you lack material, write "not enough material". No flattery; include my blind spots.
Points: 1. how I critique 2. how I am constructive 3. how I argue 4. my tone and writing style 5. my quality standards 6. my decision habits 7. my areas of expertise 8. my blind spots 9. three examples: a text you proposed and the version I kept.
```

## C. Interview (after A and B)
Ask 8 questions, **one at a time**, where A and B are thin or contradict each other. Examples:
- "When someone pitches you a project, what is your first question?"
- "What in a text tells you immediately it is bad?"
- "How do you say no to someone senior?"
- "Show me a text you are proud of. What makes it good?"

## D. Write `WORKING-PROFILE.md`
```
# Working profile: <first name>  (date)
## In one sentence
## Critique
## Constructiveness
## Argumentation
## Tone and style (5 typical phrasings, 5 banned words)
## Standards: what "done" means
## Decision habits
## Expertise
## Blind spots: where to push back
## Instructions for Claude (10 to 15 imperative rules, to paste into the new account's preferences)
## Before / after examples (3)
```
Every statement must trace to a source (A, B, C or a file). Otherwise write "to confirm".

Have the user **read the whole document** and correct it with them. A profile they did not validate is a guess. Update `PROGRESS.md`.
