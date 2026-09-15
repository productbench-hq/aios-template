---
name: weekly-review
description: Runs a 15-minute weekly review of the AIOS. Checks last week's follow-ups, flags where the log contradicts current priorities, asks what broke and what was repeated, then proposes fixes to the files that caused them (context, skills, knowledge) instead of patching outputs. Use once a week, or when asked to "review my week", "weekly review", or run /weekly-review.
disable-model-invocation: true
---

# weekly-review

**What it does:** Turns this week's friction into file changes, so next week the OS is better. Fix the system, not the output.
**Not in scope:** building new skills (it only names candidates), quarterly maintenance (re-running `/onboard`, archiving skills, checking connections), reading connected tools.

## Steps

1. **Look back.** The window is the last 7 calendar days including today.
   a. **Last week's follow-ups.** Grep the daily files in `knowledge/log/` for the most recent earlier `— weekly-review` block. Note its `decision: skill candidate` and `note: try this week`. Check `.claude/skills/` for whether the candidate now exists.
   b. **This week.** Read the daily files in `knowledge/log/` for the window. If this folder is a git repo, run `git log --since="<first day of the window> 00:00" --no-merges --author="$(git config user.name)" --oneline` so only the user's own commits in the same window count. Count sources added (`sys: ingested:`), pages created or regenerated, decisions logged, and commits.
   c. **Mismatches.** Read `context/priorities.md`. Compare it with every `note:` and `decision:` in the window. Flag any entry that contradicts or outranks a stated priority (a new deadline, a renewal, a customer or stakeholder saying something matters more). Also flag `(inferred)` notes about quality (tone, format, accuracy), and a `knowledge/index.md` that's empty while `knowledge/pages/` or `knowledge/sources/` has files.
   d. **Repeats.** Note any kind of task that appears 3+ times in `done:` entries in the window, marked `(inferred)`.
   e. **Installed extensions.** Check the **Installed** list in `knowledge/RULES.md`. If `audit-archive` is there, run its weekly audit now (see `EXPANSIONS.md`) instead of as a separate ritual; its Patterns check is covered by d. If `streams` is there, run the pulse and collect stalled or drifting streams.
   Show it in this order, max 10 lines:
   - Last week: skill candidate built or not, "try this" prompt (or "first review, nothing to follow up")
   - This week: counts from b
   - Worth a look: each mismatch or quality note from c, one line each, quoting the log entry and the file it clashes with
   - Possible skill: repeats from d
   - Extensions: audit findings and stalled or drifting streams from e (leave out if none installed)
   Done when: the summary is shown, or it says "quiet week, nothing logged."

2. **Ask three questions, in one message.** Attach every step-1 flag to the question it belongs to, so none gets lost:
   - What went wrong this week, or needed fixing by hand? *(attach quality notes, the empty-index flag, and audit findings: "Your log notes X. Worth fixing?")*
   - What did you do 3+ times? *(attach detected repeats: "I see Y three times. Anything else?")*
   - Did any priority change? *(attach mismatches and stalled streams: "Your log says X, but `priorities.md` says Y. Still right?" / "‹stream› expected ‹next› by ‹date›. Happened?")*
   Done when: each question and each attached flag has an answer, even if the answer is "nothing" or "ignore."

3. **Map every answer to a file.** Use the table in Reference. One answer can need more than one file; list each. For each repeated task, write a skill candidate: one sentence with a verb, plus one "not in scope" line. Drop flags the user said to ignore.
   If a fix needs input from the user (a voice sample, whether to carry over last week's unbuilt skill candidate instead of adding a new one), ask for it now, in one message, before step 4.
   Done when: every answer and flag has a proposed file change, a skill candidate, or "no change needed," and any input the fixes need is in hand.

4. **Show the plan. Wait for a clear yes.** Number every item. Show file edits as before → after; for an addition, show the text being added. The user can approve all, some, or none.
   Done when: the user has said yes or no to each numbered item.

5. **Apply approved edits.** Change only the approved files. Never edit `knowledge/sources/` or past log entries (see `knowledge/RULES.md`). Use the current local time. Then append one log block to today's `knowledge/log/YYYY-MM-DD.md`:
   ```
   ## HH:MM — weekly-review
   - done: <one line per applied change>
   - decision: <one line per priority or scope change the user approved> — <user's name>
   - note: declined: <one line per rejected item, so it isn't proposed again>
   - decision: skill candidate for next week: <name>
   - note: try this week: <the prompt from step 7>
   - sys: audit: <one line per audit finding acted on> (only if `audit-archive` is installed)
   ```
   Leave out any line type with nothing to report.
   Done when: every approved edit is applied and the log block is written.

6. **Offer to save.** Skip this step if the folder isn't a git repo.
   a. Stage only the files changed in step 5 (by name, never `git add -A`). Run `git status --short` and mention any other uncommitted changes as "left out".
   b. Check `git remote` and the current branch.
   c. Show the commit message and say where it goes: "commit and push to `<remote>/<branch>`", or "commit locally (no remote)". Ask.
   d. On yes: commit, and push only if a remote exists.
   Done when: committed (and pushed, if there's a remote), or the user declined.

7. **Close in 3 lines max.**
   - Fixed: <what changed>
   - Next skill to build: <candidate>
   - Try this week: <one concrete prompt, tied to the top priority>

## Reference

**Where to fix it**

| What went wrong | Fix this file |
|---|---|
| Answer got my priorities wrong or out of date | `context/priorities.md` |
| Answer got my role or responsibilities wrong | `context/about-me.md` |
| Answer got the product, customers or metric wrong | `context/about-business.md` |
| Output didn't sound like me | `context/voice.md`: ask for a real sample of the wanted tone, and add it |
| A skill skipped a step, did too much, or acted without asking | That skill's `SKILL.md`: add a "done when," a scope line, or an approval step |
| A skill got it right | That skill's `SKILL.md`: add the input and output as an example |
| The OS didn't know something customers or stakeholders said | Hand the material over for ingest into `knowledge/sources/` |
| I had to copy-paste from a tool | `context/connections.md`: note the tool as a connection candidate |
| Needed a new folder, or the knowledge base is getting messy | `EXPANSIONS.md`: run "How to tell it's time", then add the folder or install the extension |
| Same task done 3+ times | Skill candidate (build it separately, following `references/what-a-good-skill-looks-like.md`) |

**Rule:** if a fix only changes an output in the chat, it isn't a fix. Every fix is a file change.

## Example

**Step 1 output:**
> - Last week: skill candidate `drafting-friday-update` not built yet. Try-this prompt was "Draft the Q4 notifications PRD."
> - This week: 3 sources added, 1 page created, 0 decisions, 2 commits.
> - Worth a look: log 09-09 says "export/reporting decides the Nordhafen renewal in November," but `priorities.md` has export at #3, discovery only.
> - Worth a look: log 09-11 (inferred) "PRD tone too formal." `context/voice.md` has no docs sample.
> - Possible skill: "drafted stakeholder update" 3 times (inferred).

**Step 2:**
> 1. What went wrong this week, or needed fixing by hand? Your log notes the PRD tone was too formal. Worth fixing?
> 2. What did you do 3+ times? I see "drafted stakeholder update" three times. Anything else?
> 3. Did any priority change? Your log says export decides the Nordhafen renewal, but `priorities.md` has it at #3. Still right?

**User answers:**
> 1. Yes, Jonas sent it back. 2. Just the Friday update. 3. Yes, export is #1 now and has to ship before November.

**Step 3 (input needed):**
> Two things before the plan: can you paste a paragraph from a doc Jonas liked? And `drafting-friday-update` is still unbuilt from last week. Carry it over?

**Step 4 plan:**
> 1. `context/priorities.md`: move "Ship export & reporting before Nordhafen renewal (Nov)" to #1, notifications to #2. Why: the PRD used old priorities.
> 2. `context/voice.md`: add "## Docs" with the Jonas sample: "Export ships in two cuts. Cut 1: CSV of open and overdue tasks per team, by 2026-10-15…"
> 3. Skill candidate: carry over `drafting-friday-update`.
> Approve 1, 2, 3?

**Step 5 log block:**
> (in `knowledge/log/2026-09-14.md`)
> ## 10:19 — weekly-review
> - done: priorities.md: export/reporting #1, notifications #2
> - done: voice.md: docs section with Jonas-approved sample
> - decision: export/reporting ships before the November Nordhafen renewal — Lena
> - decision: skill candidate for next week: drafting-friday-update
> - note: try this week: Draft a one-page PRD for export/reporting, scoped to Nordhafen's needs

**Step 6:**
> Committing 3 files: `context/priorities.md`, `context/voice.md`, `knowledge/log/2026-09-14.md`. Left out: `.claude/skills/triage/SKILL.md` (unrelated changes). Commit locally (no remote)?

**Step 7 close:**
> - Fixed: priorities lead with export & reporting; voice has a docs sample.
> - Next skill to build: drafting-friday-update.
> - Try this week: "Draft a one-page PRD for export/reporting, scoped to what Nordhafen needs by November."
