# AIOS Intake

This is the source-of-truth file for your AIOS. Fill it in by typing, voice-pasting, or running `/onboard` for a guided conversation. Whichever mode, this file is what `/onboard` reads to scaffold your Day-1 setup.

**Hard cap: 7 questions.** Each answerable in under 60 seconds. Don't overthink — you can edit and re-run `/onboard` any time.

---

## Q1 — Who are you, what product/team do you own, and who are your stakeholders and users?

Role, product, company. Who you answer to, who you serve. One paragraph is fine.

```
[Your answer here]
```

---

## Q2 — Paste 1-2 things you've written recently. Don't edit them.

A PRD excerpt, a Slack update, a stakeholder email, a doc — anything that sounds like you when you're not trying. **Paste verbatim.** Do not type these mid-conversation with Claude — chat-shaped samples are worse than no samples (voice contamination).

```
[Paste sample 1 here]
```

```
[Paste sample 2 here]
```

---

## Q3 — What are your 2-3 biggest priorities for the next 90 days?

Quarterly priorities. Not yearly aspirations. Things that, if not done by the end of the quarter, would make you say "I wasted this cycle."

```
[Your answer here]
```

---

## Q4 — Where does your product's key metric live, and where is it tracked?

North-star metric, or whatever number you're actually held to. Amplitude? Mixpanel? Looker? A spreadsheet someone exports weekly?

```
[Your answer here]
```

---

## Q5 — Where do you talk to stakeholders, your team, and your users day-to-day?

Email (Gmail/Outlook)? Slack/Teams? User interviews, support tickets, DMs?

```
[Your answer here]
```

---

## Q6 — Where do meeting recordings, notes, and important docs live?

Granola? Otter? Fireflies? Notion? Confluence? Google Drive? A folder you keep meaning to organize?

```
[Your answer here]
```

---

## Q7 — What's the one task that eats your week, and where do you currently track work?

The single biggest time-suck or recurring drudgery. Plus where tickets/backlog/roadmap live (Jira / Linear / Asana / Notion).

```
[Your answer here]
```

---

When this file is filled, run `/onboard` (or re-run it) and the wizard will scaffold your Day-1 file set: `context/`, `context/voice.md`, populated `context/connections.md`, and a filled `CLAUDE.md`. It'll also offer to show you the knowledge layer live — if you've got a real interview transcript or doc handy, hand it over and watch it turn into a cited synthesis.
