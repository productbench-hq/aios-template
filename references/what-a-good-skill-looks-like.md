# What a good skill looks like

*Keep this open while you build. One page, five principles, one checklist.*

**A skill is a work procedure for your AI teammate.** Think of an onboarding doc for a new hire who follows it to the letter, every single time. Good doc, good work. Vague doc, vague work.

---

## The 5 principles

### 1. One real job
Pick a task you've done **3+ times** and will do again. One skill, one job.
- Good: "Turn meeting notes into Linear tickets."
- Bad: "Help me with product management."
- **Test:** can you say what it does in one sentence, with a verb?

### 2. Scope it like an MVP
Write down what it does, and what it doesn't do. Park the rest as v2.
- `syncing-specs` handles one doc type and one source (Slack). Other doc types and email are named as v2, not built.
- **Test:** is there a "Not in scope" line?

### 3. You pull the trigger
Two ways a skill can start: **you** call it (`/name`), or **the AI** decides when to call it based on its description.
- **Default today: you call it.** Nothing to debug when it doesn't fire.
- Either way, the description says **what it does + when to use it**, with the words you'd actually type.
- **Test:** would a colleague know when to reach for it from the description alone?

### 4. Steps with finish lines
Numbered steps in order. Every step ends on **done when**: a condition you could check.
- Bad: "Review the backlog."
- Good: "Every open issue is tagged keep, drop or later."
- Templates, definitions and lookup tables go in a separate **reference** section, not mixed into the steps.
- **Before anything leaves the chat** (sends, creates, edits a shared doc), one step shows you the draft and waits for your **yes**. `granola-to-linear`: map → propose → confirm → create.
- **Test:** could the AI tell "done" from "not done" at every step? Can it change anything outside the chat before you approve?

### 5. Build, test, iterate
Your first draft is a v0. The skill gets good by running it on real work and fixing what breaks.
- Do the task once by hand with Claude, turn it into a skill, run it on a **new** real input, fix, run again.
- When a run goes right, keep that input and output as an **example** in the skill.
- When you fix, also cut: delete any line that didn't change what the AI did.
- **Test:** has it run on at least two real inputs, and did you change something after the first?

---

## Skeleton to copy

File: `.claude/skills/<your-skill-name>/SKILL.md`

```markdown
---
name: turning-notes-into-tickets
description: Turns meeting notes into draft Linear tickets with owner and project. Use when meeting notes get pasted or asked to "ticket this".
disable-model-invocation: true
---

# turning-notes-into-tickets

**What it does:** <one sentence>
**Not in scope:** <what it won't do>

## Steps
1. <step>. Done when: <checkable condition>.
2. <step>. Done when: <checkable condition>.
3. Show the draft. Wait for a clear yes.
4. <act>. Report back one line per item.

## Reference
<template, definitions, IDs, lookup table>

## Examples
**Input:** <real input>
**Output:** <real output>
```

---

## How to build it live (30 min)

| Step | What you do | Time |
|---|---|---|
| 1 | Do the task **once** with Claude in chat, on real work. | 10 min |
| 2 | Ask Claude: "Turn what we just did into a skill using the skeleton in this doc." | 3 min |
| 3 | Read it. Cut anything you wouldn't say to a new hire. | 5 min |
| 4 | Run it on a **different** real input. Fix what broke. Run again. | 10 min |
| 5 | Run `/evaluating-skills` on it. Fix the top 1–2 flags only. | 2 min |

---

## Pre-flight checklist

- [ ] Does one job I've done 3+ times
- [ ] "Not in scope" line exists
- [ ] I start it with `/name`. Description = what + when, in words I'd type
- [ ] Numbered steps, each with a "done when"
- [ ] Waits for my yes before touching anything outside the chat
- [ ] Ran it on 2+ real inputs and fixed something after the first
