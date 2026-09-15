# RULES.md — the knowledge base

Concept and operating instructions in one. The LLM operates the system exactly as written here; the human amends this file, never the system's behavior directly.

## Axioms

1. Two ground truths: **log** (what I did and decided) and **sources** (what the world said).
2. Everything else — pages, index, folders — is a cache. Caches are regenerated, never trusted.
3. Ground truth is never edited. Fixes are appended.
4. Nothing in `sources/` or the log is ever deleted.
5. Writing is a byproduct of finishing work, never a ritual.

## Layout

```
knowledge/
  log/YYYY-MM-DD.md             ground truth 1
  sources/<folder>/<name>.md    ground truth 2
  pages/<folder>/<name>.md      compiled knowledge
  index.md                      cache: one line per page and source
```

Four parts: two ground truths (`log/`, `sources/`), one derived layer (`pages/`), one navigation cache (`index.md`). The human touches this folder in two ways only: reads `pages/`, and hands material over for ingest. `log/`, `sources/`, and `index.md` are yours alone — no human hands.

Folders in `pages/` and `sources/` are a browsing view you own — named for a human (`clients/`, `competitors/`, `decisions/`), one level, reorganized freely. Nothing points at a path: links and citations use names.

**First run:** if the layout doesn't exist, create it with an empty `index.md`; log `sys: [core] knowledge base initialized`. No folders inside `pages/` or `sources/` until something needs one.

## The Loop

Every working session, in this order:

1. **Ingest** — new material arrived → file it first.
2. **Name** — the task gets its name; it heads every block.
3. **Load** — index, then only the pages the task needs.
4. Work.
5. **Close** — write the block; route the residue: happened → log · citable raw → source · known fact → its page · new fact → log, page only per the bar · the rest dies with the task. Log `sys: read:` for pages opened.

Each step's rules live in its section below.

## Log

Record what happened and when. Everything else is compiled from this.

- `log/YYYY-MM-DD.md`, one file per day. Append-only. Grep it; never load it whole.
- One block per write event — task end, meeting, interrupt. Never reopened.

```
## HH:MM — <task>
- <type>: <one line>
```

- The header is the citation address: `[log:YYYY-MM-DD HH:MM]` — the date comes from the filename.
- The task name is assigned once at task start — kebab-case — then used verbatim in every block. No task → the occasion: `meeting-…`, `audit`.


| Type          | Meaning                                                                                                                        |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| `decision:`   | something was decided — what, by whom                                                                                          |
| `done:`       | work completed, where the deliverable lives                                                                                    |
| `note:`       | anything learned or noticed — `— <who/what>` if someone said it, `(inferred)` if you concluded it, bare if you just noticed it |
| `correction:` | a recorded entry was wrong — `replacing [log:…]`                                                                               |
| `sys:`        | bookkeeping: `read:` `ingested:` `created:` `regenerated:` `[core]`                                                            |


- The header is the citation address: [log:YYYY-MM-DD HH:MM]
- Every closed task ends with a `done:`.
- `grep -v sys:` is the pure journal.



## Sources

The world's words, immutable, readable text. Binaries are attachments; extracted text is the source.

```
kind: interview | correspondence | document | research | snapshot
who: only when someone said it
date: YYYY-MM-DD
tags: [acme, pricing]
description: one line
original: attachment filename — only with an attachment
```

Dropped in, extracted, filed, cited — never edited after. A correction is a new log entry, not an edit to the source.

## Pages

Compiled current knowledge, readable by human and LLM. Content shape is your choice within these constraints:

- Every factual claim carries a numbered citation `[n]` or the marker `inferred`. Nothing else.
- `## Sources` footer: `[n] log:YYYY-MM-DD HH:MM` or `[n] source:<name>`. Numbers stable, never reused, gaps allowed. (Pre-decided: if the first two audits find number drift, switch to inline `[log:…]`/`[source:…]` tags.)
- One current value per fact. New value → edit the claim, cite the newer evidence. Genuine conflict → `unresolved`, surfaced.
- `[[links]]` for navigation, never as evidence.

```
type: entity | concept | problem | decision | pattern | hypothesis
tags: [acme, pricing]
description: one line — what this answers, when to open it
updated_at: YYYY-MM-DD HH:MM
```

**Created only when a task needs it and the log or sources can already fill it** — something spanning more than one day or source, that someone will ask again. Otherwise, answer straight from the log; the page appears the second time the topic comes up, not the first.

**Wrong claims are fixed through the log, never by hand.** Told "wrong" → follow the citation. The evidence backs the claim → the evidence was wrong, write a `correction:` and recompile. It doesn't → the compile was wrong, regenerate the page.


## Index

`index.md`: one line per page and source — name, description, type/kind, tags, date. Regenerated after every write, never edited by hand.

## Never

Edit a source after it's filed · edit a page outside a compile · create a page speculatively · cite by path instead of name · leave a claim without a citation or `inferred` · load a page "just in case."

## Extensions

Optional capabilities live in `EXPANSIONS.md`, one section each. An extension extends this file — layout, Loop steps, frontmatter fields, log types, Never entries, axiom wording — exactly as declared in its **Extends** block; it never contradicts it. Where an extension names a change, its rule applies as if written here.

Install: read its section in `EXPANSIONS.md`, add its name below. Remove: delete the name; what it wrote into ground truth stays readable.

**Installed:** (none)

## Not solved by design

Deciding what is durable at write time. Mitigation: low bar for the log, high bar for pages.


## Worked example

Three customer interviews come in. A page gets created on the third one — that's the recurrence bar being met.

`knowledge/log/YYYY-MM-DD.md`:
```
## 2026-09-08 14:20 — customer-interviews
- sys: ingested: customers/int-01-maria.md
- note: pricing came up unprompted — Maria, interview
- sys: ingested: customers/int-02-devon.md
- note: (inferred) enterprise buyers care more about SSO than price
- sys: ingested: customers/int-03-priya.md
- note: pricing came up again — Priya, interview
- sys: created: customers/pricing-sensitivity.md
- done: 3 interviews logged, one page compiled
```

`knowledge/sources/customers/int-01-maria.md`:
```
kind: interview
who: Maria
date: 2026-09-08
tags: [customers, pricing]
description: Discovery call, mid-market segment
---
[transcript text]
```

`knowledge/pages/customers/pricing-sensitivity.md`:
```
type: pattern
tags: [customers, pricing]
description: Pricing sensitivity by segment — when it's raised, by whom, how
updated_at: 2026-09-08 14:20
---
Pricing comes up unprompted in most mid-market interviews [1] [3]. Enterprise buyers raise SSO and access control before price — pricing sensitivity there is inferred, not stated directly [2].

## Sources
[1] source:customers/int-01-maria
[2] source:customers/int-02-devon (inferred)
[3] source:customers/int-03-priya
```

Two more interviews later mention pricing — the page gets edited, not recreated: the claim updates, a new citation gets added, `updated_at` moves forward.

---