---
name: decision-review
description: Reviews a decision before the user commits to it. Finds the assumptions they haven't said out loud, checks them against the evidence with an agent that never sees their reasoning, proposes the cheapest test for each, and records their verdict and a date to check back. Use when asked for a decision review or a gut check, to stress-test a decision or plan, or to check what a decision rests on; or run /decision-review.
disable-model-invocation: true
---

# decision-review

**The job:** the user is about to commit on a story that feels true. Find where it's weakest, and the cheapest way to check, before they commit. For one proposed choice (an offer, a price, what to build, where time goes). Skip it if the choice is cheap to undo or already running.

**Rules:**
- **AI proposes, the user decides:** the decision, which risks matter, the pass marks and the verdict. Caps bind your proposals, never the user: if they add a card, keep it.
- **Show only what changes the user's next move.** Keep grades and working internal. Don't repeat what they already said.

## Stops

Three stops, each in this shape, short enough for a phone:

```
You just got: <one line> → [section](link)

I need from you:
1. <question> Proposed: <your answer>

Next: <what comes next>
```

Every question except the verdict carries your proposal; a skipped question means it's accepted. Apply answers straight into the doc.

## The doc

`decision-review-<slug>-<YYYY-MM-DD>.md`, saved where [setup.md](setup.md) says, else the current folder. Under **600 words**.

```
# Decision review: <title>
<date> · decider: <name(s)>

## Summary
- Decision: <one sentence>
- Verdict (<name>'s): <their words>
- Check first: <check and pass mark>
- Check back on: <date>

## 1. What are we deciding?
## 2. Weak spots
## 3. The call
```

## Steps

### 1. What are we deciding?

Read what the user gave you, the evidence sources in `setup.md`, and any files they name. Draft: "We will <choice>, expecting <outcome>, because <reason>." No evidence files? Say so above the stop: "I'll work from what you tell me. Point me at docs or data if you have them."

**Stop 1:**
1. Is this the decision?
2. What do you know that isn't written down? (Numbers, history, what's been tried.)
3. Who else decides?
4. Is there a cheaper way to the same outcome? Propose one.

### 2. Weak spots

**a. Evidence, blind.** With evidence files, dispatch one subagent with the paths, the decision sentence and the user's stop-1 facts, never their reasoning:

> Grade each source strong, medium or weak (behaviour beats opinion, a test beats a correlation, recent beats old, a plan is not evidence). List what bears on this decision, each with a quote of 15 words at most and its file. Then the top 3 things no source can tell us. Return text; write no files.

Without files, weigh the user's account yourself, do the arithmetic their numbers allow, and search the web only for outside facts the decision needs, marked "unverified".

**b. Hidden assumptions, meanwhile.** Beliefs that make the decision wrong if false. Ask: do the people it's for want it, can we pull it off, does the payoff beat the cost, what else does it change? Hunt the implied ones: a causal reading of a number, where freed time or money really goes, what the choice gives up. Drop ones the user already said, unless the evidence contradicts them.

**c. Cards.** Check each file quote against its file. Keep the **3 riskiest** (high cost if wrong, and the evidence contradicts, splits on or misses them), plus **1 card** for the cheaper alternative. Give each the cheapest check that could prove it false:

> **Assumption:** free users don't lead to company deals
> **What we know:** 4 of the last 10 enterprise deals started on a free account (CRM export)
> **Check:** pull the signup source of every paid team from last year · **passes if** under 20% started free · **if not:** keep the free plan · ~2 hours

Then **What nobody knows**: up to 3 gaps no card covers, or nothing.

**Stop 2:**
1. Right assumptions? Add, cut or reword.
2. Keep or change each pass mark? They're commitments.
3. Which check runs first? Propose the cheapest test of the riskiest assumption.

A card the user adds gets its check and pass mark shown in one line for a yes. Done when every pass mark has been seen and the first check is picked.

### 3. The call

**Case for** and **case against**, three bullets each: reasons the decision is right or wrong, not costs of checking. If someone else decides too, add up to three **questions for <name>**. No verdict of your own.

**Stop 3:** ask for the verdict (`go`, `go with conditions` or `not yet`) and one line why. Then propose a check-back date: when the first result lands, plus a week (ask if you can't tell). Fill the Summary.

### 4. Wrap up

Reply with the doc link, verdict and check-back date. If `setup.md` names a decision log or reminder tool, draft the entry and reminder; write them on a yes. If not, ask once: "Want a decision log and check-back reminders?" On a yes, fill `setup.md`, create the log if missing, and log this decision. Then stop: running the checks is the user's call.

## Check-back

When the user brings a result, or a reminder fires: compare it with the card's pass mark (passed, failed, no result yet). Append `## Check-back <date>` with the result, which outcome applies, and whether the verdict holds; propose, the user decides. With a log, draft a `Check-back: <title>` entry and add it on a yes; never edit past entries. No result yet: propose a new date.
