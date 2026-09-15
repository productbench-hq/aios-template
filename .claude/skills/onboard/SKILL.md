---
name: onboard
description: Use on Day 1 of an AIOS install, when someone says "set me up", "onboard me", "let's get started", "fill in my AIOS", or has just cloned the kit. Combined wizard — runs the 7-question intake AND scaffolds the Day-1 file set at the end. Idempotent — re-run any time after editing context/intake.md.
---

## What this skill does

Single combined wizard. Reads or writes `context/intake.md` (the canonical intake), conducts the 7-question interview if the file isn't filled, then scaffolds the Day-1 file set inline at the end of the run. No separate `/scaffold-from-intake` skill — this is one flow.

Written for a product person — a PM, senior PM, or head of product — setting this up for their own role. Questions are framed around the product they own and the stakeholders/users they answer to, not around running a business.

**Two wow moments, not one.** At the end, suggest the closing prompt *"Try this — ask me: what should I focus on this week?"* The user runs it once — no `/today` skill to save, the prompt itself plants the habit of asking "to what extent could AI be leveraged here?" for them to internalize. If they also take the Step 5 offer and hand over a real transcript or doc, that one lands harder: watching raw material turn into a cited synthesis in real time is the more visceral demo of the two. Offer both; don't force either.

## When NOT to run this

- If the user has already onboarded and wants to refresh: still run, but skip questions already answered (idempotent).
- If the user wants to add a new connection: that's not onboarding — point them at `context/connections.md` to edit directly.

## Execution

### Step 1: Read the intake

Read `context/intake.md`. Check which Q1-Q7 sections have content vs. `[Your answer here]` placeholders.

- **All filled** → skip Step 2, jump to Step 3 (scaffold).
- **Some filled** → ask the user: "I see Q1, Q3, Q4 are answered. Want to fill the rest now, or scaffold from what's there?" Their call.
- **None filled (fresh clone)** → run Step 2 conversationally.

### Step 2: The interview (7 questions, hard cap)

Ask one at a time. Write each answer into `context/intake.md` as you go (so the user can resume if interrupted).

**Q1 — Who are you, what product/team do you own, and who are your stakeholders and users?**
Role, product, company. One paragraph is fine.

**Q2 — Paste 1-2 things you've written recently. Don't edit them.**
*This is the only question with a hard rule.* Voice samples MUST be pasted, not typed mid-conversation. If the user starts typing fresh prose, refuse:

> *"Stop — paste it raw. If you type it here while we're talking, the sample is already shaped by our conversation. Open your last PRD, Slack update, or stakeholder email in another tab and paste the unedited text. This is the one rule I can't bend."*

Ask for two samples. A PRD excerpt, a Slack update, an email — anything that sounds like them.

**Q3 — What are your 2-3 biggest priorities for the next 90 days?**
Quarterly priorities. Push back if they say "improve the product" — make them name a number, a deadline, or a deliverable.

**Q4 — Where does your product's key metric live, and where is it tracked?**
North-star metric, or whatever number they're actually held to. Map to Tier-1 Domain 1 (Product Metrics).

**Q5 — Where do you talk to stakeholders, your team, and your users day-to-day?**
Email (Gmail/Outlook), Slack/Teams, user interviews, support tickets, DMs. Map to Domains 2 + 4.

**Q6 — Where do meeting recordings, notes, and important docs live?**
Map to Domains 6 + 7.

**Q7 — What's the one task that eats your week, and where do you currently track work?**
Capture top_pain + Domain 5 (backlog/roadmap tracking).

Domain 3 (Calendar) is auto-inferred from Q5: Gmail → Google Cal; Outlook → Outlook Cal. Confirm in Step 3.

### Step 3: Scaffold the Day-1 file set

Once the intake is complete, generate these files (or update if re-running). Back up originals to `archive/intake-{YYYY-MM-DD-HHMM}/` if any exist.

1. **`context/about-me.md`** — from Q1 (identity, role) + Q7 (top_pain). One short paragraph each.
2. **`context/about-business.md`** — from Q1 (product owned, stakeholders/users) + Q4 (key metric). One paragraph. (Filename stays generic even though the content here is about a product, not a company, to keep the file layout consistent across forks of this kit.)
3. **`context/priorities.md`** — from Q3. Numbered list, one line per priority.
4. **`context/voice.md`** — from Q2. Paste samples verbatim with a short header explaining their use ("Match this register when drafting; don't fake voice on external content without showing me first").
5. **`context/connections.md`** — populate the 7-row table from Q4-Q7 answers. Each row gets `mechanism: not yet connected`, `auth: —`, `last checked: —`. The user wires connections on Day 2.
6. **`CLAUDE.md`** — fill all `{{...}}` placeholders. Substitute the user's name, role and product, stated priorities, voice register summary, and a brief connections summary.

### Step 4: The closing screen

Print one screen. Four lines max:

```
✓ Day 1 done. Your AIOS knows who you are, what you own, what matters this quarter, and how you sound.

Today: ask me — "what should I focus on this week?"
Also today: got a customer interview, a doc, or a set of notes handy? Drop it in and I'll show you the knowledge layer.
Tomorrow: pick one tool from context/connections.md and wire it up (manual MCP install or write a small API script + save references/{tool}-api.md).
```

When the user runs the closing prompt ("what should I focus on this week?"), respond using only the new context files. Hit:
- 3-bullet priority list, in their voice register from Q2
- Each bullet ties back to a stated 90-day priority from Q3
- Final line: *"If I had to pick one thing for Monday, it'd be [X], because [reason from priorities]. Want me to draft the first message? And — to what extent could AI be leveraged on this task?"*

### Step 5: The knowledge layer demo (if they take you up on it)

If the user pastes or points at a real piece of material (an interview transcript, a doc, meeting notes — anything with actual content), walk them through the mechanism live, per `knowledge/RULES.md`:

1. File it into `knowledge/sources/` with proper frontmatter (`kind`, `date`, `tags`, `description`).
2. Compile one small `knowledge/pages/` entry from it, with a real `[1]` citation back to the source.
3. Log the moment in today's `knowledge/log/YYYY-MM-DD.md`: `sys: ingested:` for the source, `sys: created:` for the page.
4. Say what just happened in one line: *"That's the mechanism — drop things in, I keep the synthesis in `knowledge/pages/`, cited back to `knowledge/sources/`. Next time you ask about this topic, I read the page, not the whole transcript."*

**This is a deliberate one-time exception to `knowledge/RULES.md`'s normal page-creation bar** (which requires recurrence — more than one day or source before a page gets created). One good example on Day 1 is worth bending that rule for; say so explicitly if asked, don't silently normalize creating a page from a single source going forward.

If they don't have anything handy, skip this step — don't manufacture a fake example. The knowledge layer works the same whether they see it Day 1 or Day 20.

## Critical implementation rules

1. **The 7-question cap is non-negotiable.** Don't add Q8 in conversation.
2. **Voice paste cannot be skipped.** If the user types samples mid-chat, refuse and tell them to paste from real writing.
3. **One-shot scaffold.** After Step 2 ends, write Step 3 files in a single batch. No multi-turn confirmation. The user iterates by editing `context/intake.md` and re-running.
4. **Idempotent.** Re-running with an edited intake refreshes context files; backs up originals to `archive/intake-{ts}/`. Skips questions already answered unless the user wants to revise.
5. **Closing screen is four lines.** Not a menu.
6. **No extra skills generated.** Don't scaffold `/today`, `/draft`, `/connect`, etc.
7. **No `.env` writes.** Don't ask for API keys on Day 1. Connections come Day 2.

## Verification (for the implementer)

- Cold-test: clone a fresh kit, run `/onboard`, fill 7 answers, scaffold runs, ask the wow prompt, response cites Q1 + Q3 + Q7 specifically. Generic = fail.
- Idempotency: re-run `/onboard` with one Q3 priority changed. Expected: only `context/priorities.md` and `CLAUDE.md`'s priority section update; backup created in `archive/intake-{ts}/`.
- Voice rejection: type a sample mid-chat. Expected: skill refuses, asks for paste.
- Knowledge demo: after Step 4, paste a real short document. Expected: a new file appears in `knowledge/sources/` with correct frontmatter, a new file appears in `knowledge/pages/` with a `[1]` citation pointing back to it, today's file in `knowledge/log/` gets an `ingested:`/`created:` block, and the skill names this as a one-time exception to the normal recurrence bar. Declining the offer entirely (no material handy) = correct behavior, not a failure — the step should skip cleanly, no fake example manufactured.
