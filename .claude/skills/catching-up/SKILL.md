---
name: catching-up
description: Scans every connected tool in context/connections.md for what changed since the last catch-up, reports what needs you and what's out of date, and proposes record updates for a yes. Use when the session-start hook says a catch-up is due, or when asked "what did I miss" / "catch me up".
---

# catching-up

## What this skill does

Notices what changed in your work before you have to point it out: the stakeholder email that moved a deadline, the meeting that got cancelled, the ticket someone closed. It reads your connected tools, tells you what matters, and offers to fix any record that's now wrong.

**Core rule: scan → report → confirm → write.** Every update to a file or a tool waits for your yes, by letter. Sending messages, and editing events or tickets you don't own, are always yours.

**Not in scope:** choosing what to work on (ask "what should I focus on?" after the report), replying to anything, connecting new tools.

## State

`.claude/state/last-catch-up` holds the time of the last scan, ISO UTC (gitignored, so it stays on your machine). The SessionStart hook `.claude/hooks/catch-up-nudge.sh` reads its age and asks for a catch-up when it's over 4 hours old or missing.

## Steps

### 1. Window

Start = the timestamp in `.claude/state/last-catch-up`; 3 days ago if the file is missing. End = now. Done when you have both.

### 2. Gather

Read `context/connections.md`. Every row whose mechanism isn't `not yet connected` is a source. If a `references/{tool}-api.md` exists for it, follow that guide.

One read-only pass per source:

| Domain | What to keep |
|---|---|
| Communication (email, Slack, Teams) | Messages from people in the window: stakeholders, your team, users, threads you're cc'd on. Keep notices that ask for a decision. Drop newsletters, promotions and tool notifications. |
| Calendar | Events from now to +14 days whose created or updated time falls in the window: new bookings, cancellations, declines, moved times. |
| Backlog / roadmap tracking | Issues changed in the window that are assigned to you, created by others for you, or changed status. |
| Knowledge / files | Docs modified in the window by someone other than you. |
| Meeting intelligence | New meeting notes or transcripts in the window. |
| Product metrics, stakeholder & user interactions | Only if a guide in `references/` says what "changed" means for that tool. Otherwise skip, and say so once. |

Done when every connected source has been read, or a failing one is named in the report. No sources connected → say "Nothing connected yet. Pick one tool in `context/connections.md` and wire it up first.", run step 6 (stamp) so the hook doesn't ask again for 4 hours, and stop.

### 3. Match

Tie every kept signal to a record:
- **Priority:** a line in `context/priorities.md`.
- **Knowledge:** a page in `knowledge/pages/` whose question it bears on (see `knowledge/index.md`).
- **Work in flight:** an issue in your tracker.

A signal that matters but has no match is **new**. Done when every kept signal has a record or is marked new.

### 4. Classify

Each matched signal is one of three, or it's dropped:
- **Needs you:** a reply, decision or review is waiting on you.
- **Changed:** a date moved, a meeting was booked or cancelled, someone created, moved or closed something.
- **Out of date:** a record now disagrees with its source, e.g. the email says the launch slipped and `priorities.md` still has the old date.

### 5. Report

Plain chat, most important first. Each line links to its source (message, event, issue or file).

```
Catch-up since <day hh:mm>

Needs you
1. ...

Changed
- ...

Proposed updates
A. <record>: <exact change>
```

Proposed updates:
- A priority or deadline moved → edit `context/priorities.md`.
- A decision was made in a thread or meeting → a `decision:` line in today's `knowledge/log/` file, per `knowledge/RULES.md`.
- New material worth keeping (a transcript, a doc you'll rely on) → ingest it into `knowledge/sources/`, per `knowledge/RULES.md`.
- A new commitment → an issue in your tracker. Check first that it doesn't already exist.

Propose an update only when the record would otherwise be wrong or steer later work: a priority, a date, a decision, a new commitment. Logistics you already know (a no-show, a room booking) stay in the report and go no further.

Nothing kept → one line: `Nothing new since <day hh:mm>.`

### 6. Stamp

Run `mkdir -p .claude/state && date -u +%Y-%m-%dT%H:%M:%SZ > .claude/state/last-catch-up` right after the report. The scan happened, whatever you approve.

### 7. Confirm and apply

You answer by letter ("apply A, C"). Apply exactly those, then report one line per change. If you opened the session with a request, carry on with it.

## Quality bar

- [ ] Every connected source read, or the failing one named.
- [ ] Every report line links to its source.
- [ ] Every write traced to a letter you approved.
- [ ] The report is short enough to read in 30 seconds when nothing major happened.
