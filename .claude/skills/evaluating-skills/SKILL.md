---
name: evaluating-skills
description: Reviews a SKILL.md file against Anthropic's published skill-authoring best practices, plus three Productbench workshop checks, and returns a plain-language punch list of what to fix. Use when asked to review, evaluate, or check a skill someone just built, or run /evaluating-skills.
---

# evaluating-skills

## What this skill does

Checks a SKILL.md file against two sources, always labelled so it's clear which is which:
- **Anthropic's** [skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) (Step 2). Every check cites the doc section it comes from.
- **Productbench workshop checks** (Step 2b). Our own principles from [what-a-good-skill-looks-like.md](../../../references/what-a-good-skill-looks-like.md), not Anthropic's.

Returns pass/flag per check, plus the 1-2 most important fixes, not a score.

**Scope:** checks the file itself, not whether the skill functions correctly in real use — that's testing, a separate step. Doesn't auto-fix anything; flags only.

## Step 1 — Get the target

Ask for the SKILL.md path if not given. Read the full file — frontmatter and body.

## Step 2 — Run the automatically-checkable items

Go through each row below in order. For each: state pass or flag, and if flagged, the specific one-line fix.

| # | Check | Source |
|---|---|---|
| 1 | `name`: ≤64 chars, lowercase/numbers/hyphens only, no XML tags, not "anthropic" or "claude" | YAML frontmatter requirements |
| 2 | `description`: non-empty, ≤1024 chars, no XML tags | YAML frontmatter requirements |
| 3 | Description is specific and includes key terms (not vague like "helps with documents") | Checklist: Core quality |
| 4 | Description states both what it does AND when to use it | Checklist: Core quality |
| 5 | Description is written in third person — not "I can help..." or "You can use this to..." | Writing effective descriptions |
| 6 | Name says what the skill is for — not vague ("helper", "utils", "tools") | Naming conventions |
| 7 | SKILL.md body is under 500 lines | Token budgets |
| 8 | No time-sensitive info hardcoded (dates that will go stale) — if present, isolated in an "old patterns" section | Avoid time-sensitive information |
| 9 | Consistent terminology — same term for the same concept, every time (not "field"/"box"/"element" for one thing) | Use consistent terminology |
| 10 | Examples given are concrete (real input/output text), not abstract descriptions of what an example would show | Checklist: Core quality |
| 11 | Any file references are one level deep from SKILL.md — no chains (A points to B points to C) | Avoid deeply nested references |
| 12 | Multi-step workflows have clear, numbered steps | Checklist: Core quality |
| 13 | Any MCP tool mentioned is referenced as `ServerName:tool_name`, fully qualified — not bare `tool_name` | MCP tool references |
| 14 | Any file paths use forward slashes, not Windows-style backslashes | Anti-patterns: Avoid Windows-style paths |
| 15 | Doesn't offer more options than necessary ("use X, or Y, or Z, or...") without a clear default | Anti-patterns: Avoid offering too many options |
| 16 | If the skill bundles scripts: errors handled explicitly (not deferred to Claude), no unexplained "magic number" constants, required packages listed | Checklist: Code and scripts |

**Note:** the doc doesn't specify a minimum example count — check #10 is "concrete, not abstract," not a number. Don't flag a skill just for having one example if that example is genuinely concrete.

## Step 2b — Run the Productbench workshop checks

Same format as Step 2: pass or flag, plus a one-line fix. Judge by meaning, not exact wording — "Non-goals" counts as a scope line, "Only proceed when validation passes" counts as a finish line.

| # | Check | Source |
|---|---|---|
| W1 | States what the skill does NOT do. Any clear non-goal counts, even if it's not under its own heading; pass, and suggest a dedicated "Not in scope" line only if non-goals are scattered | Workshop principle 2: Scope it like an MVP |
| W2 | Every step ends on a condition Claude could check. Implied finish lines pass ("5 items in, 5 out"); explicit "Done when" wording is optional. Flag only steps where done vs. not-done is genuinely unclear ("review the backlog") | Workshop principle 4: Steps with finish lines |
| W3 | If the skill writes anything outside the chat (creates, sends, edits a shared doc or tool), a step shows every item it will write and waits for an explicit yes before acting. Reads (list, search, fetch) aren't writes. No outside writes → ✅ N/A | Workshop principle 4: Steps with finish lines |

A W3 flag always goes into **Fix these first** — it's the one check where a miss has real-world side effects.

## Step 3 — Ask the items that can't be checked from the file alone

These are real items from the doc's Testing checklist, but they're about *how the skill was built*, not what's written in it — reading the file can't answer them, so ask the person directly rather than skipping them silently:

1. Were at least 3 evaluations (test scenarios with expected behavior) created for this skill?
2. Was it tested with more than one model tier (e.g. Haiku and a stronger model)?
3. Was it tested on a real task, not just a made-up one?
4. Has anyone besides the author tried using it?

## Step 4 — Report

Format (this presentation choice is ours, not from the source doc):

- **Anthropic checks:** one line per check from Step 2: ✅ or ⚠️ + fix, if any
- **Productbench workshop checks:** one line per check from Step 2b, same format
- One line per question from Step 3: answered or "not yet — worth doing before this ships"
- Close with: **Fix these first** — the 1-2 flags that matter most, not an exhaustive rewrite list. Workshop/review time is limited; more than 2 priorities at once gets nothing fixed.

Never rewrite the skill yourself in this step — report only. Fixing is a separate, deliberate action the author takes.

## Examples

**Example 1 — real run against an early version of `syncing-specs`** (before it was fixed):
- Check 10 (concrete examples): ⚠️ — only one example given, showing a contradiction case. Not wrong, just thin; add 1-2 more covering different classifications (e.g. noise, clean single-section routing).
- Check 13 (MCP tool refs): ⚠️ — `slack_read_channel` referenced bare. Fix: qualify as `Slack:slack_read_channel`.
- Everything else: ✅
- Fix these first: #13 (correctness risk — bare tool names can fail to resolve), then #10.

**Example 2 — a skill with a vague description:**
- Input description: `"Helps with documents"`
- Check 3: ⚠️ — too vague, no key terms. Fix: state the actual operations (e.g. "extracts text and tables from PDF/DOCX files") and a trigger condition.
- Check 4: ⚠️ — no "when to use" stated at all. Fix: add a trigger clause, e.g. "Use when the user mentions a PDF, DOCX, or document extraction."

**Example 3 — a skill that creates tickets straight away:**
- Input steps: `1. Read the meeting notes. 2. Create a Linear:save_issue for each action item. 3. Report the links.`
- W1: ⚠️ — no scope line. Fix: add "Not in scope: decisions and ideas, action items only."
- W2: ⚠️ — step 1 has no finish line. Fix: "Done when: every action item has a title and owner, or is flagged as missing one."
- W3: ⚠️ — creates issues with no approval step. Fix: insert "Show the draft list. Wait for a clear yes." before step 2.
- Fix these first: W3, then W2.

## What NOT to do

- Don't invent checks beyond what's listed in Step 2 and Step 2b — every check traces to either the Anthropic doc or the workshop guide, and the report keeps the two labelled separately
- Don't produce an aggregate score — it invites gaming the checklist instead of fixing real gaps
- Don't skip Step 3's questions just because they can't be verified from the file — ask, don't drop
- Don't edit the target SKILL.md — this skill reports, it doesn't fix
