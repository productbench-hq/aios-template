# EXPANSIONS — what to add as you grow

The kit ships lean on purpose. As you use it, you'll outgrow the base — this guide tells you what to add, when, and why.

Your AIOS structure should look like a small, well-run practice. Not a hoarder's basement.

---

## What ships in the kit (don't remove)

| Folder / file | Purpose |
|---|---|
| `CLAUDE.md` | Root operating manual. Filled by `/onboard`. Edit when your role/voice changes. |
| `context/` | About you, your product, your priorities. Filled by `/onboard`. |
| `context/intake.md` | Source-of-truth for `/onboard`. Edit and re-run any time. |
| `context/connections.md` | Registry of every system your AIOS can reach. |
| `context/personalities/` | Task-scoped voice overlays — 8 of them, from concise to hype. |
| `knowledge/` | Log, sources, compiled pages, and index — the knowledge layer. Rules in `knowledge/RULES.md`. |
| `references/` | Read on demand: skill guide, frameworks, API guides, SOPs as you build them. |
| `archive/` | Old files. Don't delete — move here. |
| `.claude/skills/` | `/onboard`, `/evaluating-skills`, `/weekly-review`, plus whatever you author as needs come up. |
| `EXPANSIONS.md` | This file. |

---

## What to add as you grow

### Folders and files

| Folder / file | Add when | Why |
|---|---|---|
| `projects/` | You start running 2+ ongoing workstreams that have their own context | Active projects need scoped context separate from the evergreen `context/` files |
| `templates/` | You catch yourself copy-pasting the same prompts or doc scaffolds (PRD template, spec template) | Reusable, parameterized starting points; reduces drift |
| `brand-assets/` | You generate visual content (slides, one-pagers, decks) | Centralizes logos, palettes, fonts — the AIOS reaches in instead of guessing |
| `references/sops/` | A recurring process gets re-run by someone new | Standard operating procedures the AIOS reads to run things consistently |
| `references/{tool}-api.md` | You connect a new API or MCP and figure out how it works | Researched once, saved forever — future skills don't re-research |
| `scripts/` | You write Python or Bash to hit APIs not covered by MCPs | Most people's second connection is a script, not an MCP |
| `.claude/agents/` | You need a sub-assistant for repeatable, multi-step research/writing | Agents run in their own context — keeps your main session lean |
| Sub-OS folders (e.g. `roadmap-os/`) | You have a vertical with its own data, sheets, transcripts, scripts | Isolation pattern — vertical workflows get their own scoped `CLAUDE.md` + skills |

### Knowledge base extensions

Install: read the extension's section at the bottom of this file, then add its name to the **Installed** list in `knowledge/RULES.md`. Remove: delete the name.

| Extension | Add when | Why |
|---|---|---|
| `inbox` | You park material for the system between sessions | A drop zone that gets ingested first thing each session |
| `workbench` | Tasks produce working files | Draws the line: cited material becomes ground truth, the rest dies with the task |
| `streams` | An engagement or initiative is ongoing enough that stalling would matter | Tracks the next step and flags when it's overdue |
| `freshness` | Pages hold claims old enough to mislead | Flags stale claims at the moment you read them |
| `audit-archive` | `knowledge/pages/` has enough in it that drift, broken citations, or clutter are a real risk | Weekly check (runs inside `/weekly-review`) catches drift before it compounds; unread material ages out without being deleted |

Sensible order: `workbench` early if your work produces files. `freshness` before `audit-archive`. `streams` when the first real engagement starts. Day 1 with empty pages: none.

---

## Suggested cadences

When each surface gets routinely touched:

- `knowledge/log/` — every working session, unprompted, per `knowledge/RULES.md`'s Loop
- `/weekly-review` — once a week, 15 minutes; turns what broke and what repeated into file changes
- `archive/` — quarterly cleanup; move stale projects, deprecated skills, old intake versions
- `references/sops/` — when a process gets re-run by someone new, write the SOP
- `context/connections.md` — every time a new tool gets wired in, add a row
- `references/{tool}-api.md` — same time as the `connections.md` update; capture the API once
- `CLAUDE.md` — quarterly review; rewrite the persona/priorities section as things change

---

## What NOT to add

- **No raw email/Slack dumps in `references/`.** Interpreted facts only — raw material is what `sources/` and ingest are for.
- **No folder-of-folders.** Flat with good naming beats deep nesting. Can't find something → consolidate, don't add a folder.
- **No `notes/`, `misc/`, `tmp/`.** Graveyards. Old → `archive/`. New → a real file in the right place.
- **No pre-created empty folders.** The AIOS will tell you when it's time.
- **No hand-edits to the log, sources, or index.** And no page edits outside a compile — see `knowledge/RULES.md`, Never.
- **No parallel `decisions.md`.** The log is the one ground truth for decisions.
- **One `CLAUDE.md` at the root.** Sub-OS folders may have scoped ones; the root is canonical.

---

## How to tell it's time

1. Is it conceptually new, or does it fit somewhere existing?
2. Will I touch it 3+ times in the next month?

Both yes = add. Otherwise = wait.

---

> *Your AIOS structure should look like a small, well-run practice — not a hoarder's basement. When you can't find something, that's a signal to consolidate, not to add another folder.*

---

## Knowledge base extensions (reference)

The full rules for each extension in the table above. Skip on Day 1 — come back when a row matches your situation.

### inbox — a drop zone for material

Park files for the system between sessions; ingest runs before anything else.

**Requires:** nothing.
**Extends:** layout · Loop (Ingest step).

#### Layout

```
inbox/            top level — emptied by ingest
```

#### Loop

Step 1 sharpens to: session start — `inbox/` has files → ingest them first, before anything else. The drop was the decision; no confirmation. Everything else about ingest is the core rule.

### workbench — the task layer and promotion

Where work happens, and the rule for what crosses into the knowledge base.

**Requires:** nothing.
**Extends:** layout · Loop (Close) · Sources (kinds, one way in) · Log (`sys:`) · Never · Axiom 4.

#### Layout

```
workbench/<task>/         one folder per task, named as the human likes
workbench/YYYY-MM-DD/     for taskless days
```

The knowledge base sees the workbench only at two boundaries: task names become log block headers, and working material enters `sources/` via promotion or ingest. What is never promoted never concerns the knowledge base.

#### Promotion

Material from a task becomes a source when:

- a page cites it, or
- the human's own deliverable was ratified — file it as `kind: agreement`.

Log `sys: promoted: <from> → <to> (<reason>)`. `agreement` joins the source kinds; `promoted:` joins the `sys:` subtypes.

#### Close

The routing gains one line: ratified deliverable → source (`agreement`). Everything unpromoted dies with the task — that is the point.

#### Axiom 4

Gains its second half: working material outside the knowledge base is the task layer's affair — deletable, movable, none of the knowledge base's business.

#### Never

Promote what nothing cites.

### streams — ongoing work and the pulse

Work whose stalling would matter — an engagement, an initiative — declared, tracked, and checked for drift.

**Requires:** nothing. If the `audit-archive` extension is installed, the pulse findings are bundled into the audit.
**Extends:** Loop (Pulse step) · Pages (type, frontmatter) · Log (`done:`, task names) · Never.

#### Declaring

A stream exists by decision, in the log:

```
- decision: open stream acme — serves C2
- decision: close stream acme — recommendation delivered
```

Open = declared and not yet closed there. Opening and closing are the human's decisions; you propose at most.

#### The stream page

The ordinary cache of that decision and everything since — **about the work, not the domain**: trajectory, current phase, what's blocking. Domain claims live on domain pages (`clients/acme`, problem pages), linked, never duplicated. `stream` joins the page types, with three extra fields:

```
type: stream
serves: <commitment or goal by name — may be empty, visibly>
status: open | closed
next: <expected next step>
next_by: YYYY-MM-DD
```

#### Membership and next

- **Membership by prefix:** every task serving a stream carries its name — `## 14:40 — acme/interview-7`. Membership needs no field; it's the header.
- **`next` is a byproduct:** the task-end entry carries it (`done: … · next: interview #7 by 09-04`); the compile moves it to the page. A stream task without a next may mean the stream is finishing — ask. Between pulses `next` may be stale; the pulse is how it gets repaired.

#### The Pulse

Joins the Loop between **Name** and **Load**: check open streams, silently unless flagged.

- Open + `next_by` past + `next` unchanged since it was set → stalled: "‹stream› expected ‹next› by ‹date› — happened?"
- Open + no `next_by` → drifting: "what's ‹stream› waiting for?"
- Else silent. (A new next on the page = the old one resolved; prefixed activity alone proves nothing.)

#### Boundaries

- Not streams: recurring maintenance (never stalls), parked ideas (no next step). Test: `next` and `next_by` are meaningful and their breach would matter.
- If the `audit-archive` extension is installed: open streams stay out of the archive; closed ones age out normally.
- Pre-decided: if one `next` forces artificial choices in the first two weeks, it becomes a short list and the pulse checks the earliest date.

#### Never

Open or close a stream yourself — that is a human decision.

### freshness — claims age

Knowledge decays; the system says so at the moment it matters — when a claim is read.

**Requires:** nothing. `audit-archive` uses the horizon for its freshness checks.
**Extends:** Pages (frontmatter, read behavior).

#### Horizon

Pages gain one field:

```
horizon: 30d          default 30d; decisions have none; set per page as the content warrants
```

#### Read-time challenge

A claim's age is the age of its newest citation (freshness is derived — core rule). Past `horizon`, flag it at read time — use it, don't hide it: "‹claim› is past its horizon (‹date›) — still current?"

A confirmation is a log entry; the compile adds the citation and the claim is fresh again. Never silently re-date a claim.

### audit-archive — the weekly audit and the archive

Drift gets caught weekly; what ages out gets archived, never deleted.

**Requires:** `freshness` (for the freshness checks). Reads `streams` if installed.
**Extends:** layout · Sources (frontmatter) · Log (`sys:`) · Axiom 4 · a weekly ritual.

#### Archive

```
archive/          top level — human- and system-writable
```

Three rules: the system moves things in only by the lifecycle below; the human may move anything in; nobody deletes.

Archived pages and sources leave the index and default scans; citations and `[[links]]` still resolve by name; restorable. When a task needs a page the index lacks, check the archive before creating.

Sources gain one field:

```
archive_when: never | <event> | <date>
```

**Lifecycle:** pages unread 90 days → archive (open streams exempt, if `streams` is installed). Sources whose `archive_when` fired → archive. Log `sys: archived:`.

With this extension, Axiom 4 reads: **the knowledge base deletes nothing — it archives.**

#### Audit

Weekly, inside `/weekly-review` (step 1) — not a separate ritual. You run all checks, write one report, propose; the human disposes in one pass; logged `sys: audit:`. Budget: more than ~10 questions a week across the review, audit, horizons, and pulse means the calibration is wrong, not the human — lengthen horizons or raise thresholds.

- **Integrity:** missing frontmatter · file newer than `updated_at` · index ≠ disk · broken links · citations without a footer line · footer lines without a file · claims without citation or marker
- **Freshness:** claims past horizon (one question per page) · claims on archived sources only · open `unresolved` · same fact, different value on two pages
- **Lifecycle:** pages unread 90 days → archive · `archive_when` fired → archive
- **Streams** (if installed): stalled and drifting streams (pulse findings, bundled) · unprefixed block clusters → propose a stream
- **Attention** (if `streams` installed): blocks per stream, this fortnight vs last · streams with zero blocks · counted from block headers, no judgment
- **Patterns:** bare `note:` recurring → promoted claim · `done:` → skill candidate · `correction:` → shorter horizon

`archived:` and `audit:` join the `sys:` subtypes.
