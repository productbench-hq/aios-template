---
name: meetings-to-issues
description: Turns meeting notes into tracker issues, logged decisions and parked ideas. Matches each next step to an owner and project, checks for duplicates, shows one proposal and creates only after a yes. Works with any notes (Granola, Fireflies, Zoom or Meet summaries, typed notes) and any tracker connected to Claude (Linear, Jira, Asana). Use when meeting notes get pasted and the ask is to "turn this into issues" or "ticket this", or run /meetings-to-issues.
disable-model-invocation: true
---

# meetings-to-issues

**What it does:** Turns a meeting's next steps into issues in your tracker, and files decisions and ideas where they belong. Map → propose → confirm → create.
**Not in scope:** summarizing the meeting, writing a recap, updating or closing existing issues, fetching meetings on its own (you paste the notes).

**Rule: never create, edit or log anything before the user says yes to the proposal.**

## Inputs

- Meeting notes (required). Any format: an AI summary, a transcript, typed bullets.
- Meeting name and date, if the notes don't say.

Your team, people, projects and destinations live in [setup.md](setup.md), next to this file. Step 1 fills it on first run.

## Steps

1. **Check setup.** Read `setup.md`. If no tracker is connected to Claude, stop and say so. If any field is empty:
   a. Look up what the tracker can tell you: team, users, projects, labels, states. Note the tool names used for each job.
   b. Ask the user, in one message, for what the tracker can't tell you: the names people use for each other in meetings, what each project is for, and where decisions and parked ideas should go. Suggest `knowledge/log.md` for both if that file exists.
   c. Show the filled `setup.md`. Write it on a yes.
   Done when: every field in `setup.md` is filled or marked "none".

2. **Sort the notes into three buckets** (see Reference).
   - **Notes have a next-steps section** (any heading: Next Steps, Action Items, To-dos): use it as given. Same number of items, same owners, same scope. Don't split, merge or reword what's being asked.
   - **No such section** (raw transcript or loose notes): extract the items yourself. The proposal in step 5 opens with: "No next-steps section found. I extracted these, check them closely."
   - Use only owners and deadlines the notes state. Leave the rest blank.
   Done when: every item is in exactly one bucket. Nothing is dropped without a line under "Left out".

3. **Match to setup.** For each action item, match the owner to a person and pick the best-fit project.
   Done when: every action item has an assignee and a project, or a flag ("no owner stated", "no project fits").

4. **Check for duplicates.** Search open issues in the matched project using the key words of each title.
   Done when: every action item was searched, and each likely match is marked "possible dup of <issue ID>" instead of proposed as new.

5. **Propose and wait.** Show one table, then three short lists:

   | # | Title | Assignee | Project | Label | State | Notes / possible dup |
   |---|---|---|---|---|---|---|

   - **Decisions** → <destination from setup>
   - **Ideas to park** → <destination from setup>
   - **Left out:** one line each, with the reason

   Ask: "Create as-is, or edit first?"
   Done when: the user says yes. If they give edits, apply them and show the proposal again.

6. **Create.**
   - **Issues:** action-shaped titles ("Draft export PRD", not "Export"). Description: the notes' context for the item, plus "From <meeting>, <date>."
   - **Decisions** and **ideas:** add to their destinations using the method in `setup.md`, dated and with the meeting name.
   - If a stored ID fails, look it up again, use the fresh value, and flag it so `setup.md` gets fixed.
   - If a create fails, stop. Don't retry silently.
   Done when: every approved item is created, or reported as failed.

7. **Report.** One line each: issues created (ID + link), decisions logged, ideas parked, anything left out or failed. No extra prose.

## Reference

**The three buckets**

| Bucket | What counts | Goes to |
|---|---|---|
| Action item | A specific thing to do, with a finish line | Issue, state from setup |
| Decision | The group concluded something | Decisions destination, not an issue |
| Idea or open question | Worth remembering, not committed | Idea issue if it needs tracking, otherwise the ideas destination |

**Before proposing, check**
- Every issue is a real commitment with a finish line, not a topic
- Every assignee is a real person from setup, or flagged
- Decisions are separated out, not turned into issues
- Every idea has a home

## Example

Hivelist product sync, 2026-09-10. Tracker: Linear. Decisions and ideas go to `knowledge/log.md`.

**Input (Granola summary):**
```
Next Steps
- Lena: draft the export PRD, scoped to what Nordhafen needs by November
- Jonas: confirm the November deadline with the Nordhafen account team
- Share export mockups with design by Friday

Decisions
- Export ships before notifications

Open questions
- Should export include archived tasks?
```

**Step 5 proposal:**

| # | Title | Assignee | Project | Label | State | Notes / possible dup |
|---|---|---|---|---|---|---|
| 1 | Draft export PRD for Nordhafen | Lena | Export & reporting | | Todo | Possible dup of HIV-42 "Export PRD" |
| 2 | Confirm November export deadline with Nordhafen | Jonas | Export & reporting | | Todo | |
| 3 | Share export mockups with design | — | Export & reporting | | Todo | No owner stated. Due Friday |

- **Decisions** → `knowledge/log.md`: export ships before notifications.
- **Ideas to park** → `knowledge/log.md`: should export include archived tasks?
- **Left out:** none.

Create as-is, or edit first?

**User:** "Skip 1, HIV-42 covers it. Assign 3 to Lena."

*(Updated proposal shown. User: "Yes.")*

**Step 7 report:**
> - Created HIV-57: Confirm November export deadline with Nordhafen (Jonas)
> - Created HIV-58: Share export mockups with design (Lena)
> - Skipped: #1, covered by HIV-42
> - Decision logged in `knowledge/log.md`: export ships before notifications
> - Idea parked in `knowledge/log.md`: should export include archived tasks?
