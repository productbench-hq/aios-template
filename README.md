# Productbench AIOS — Starter Kit

A free, MIT-licensed starter kit that turns Claude Code or Codex into your personal **AI Operating System (AIOS)**. Built by [Productbench](https://www.productbench.co/) for product managers, senior PMs, and heads of product — handed out at our workshops.

The kit personalizes itself to you via an `/onboard` interview, then grows in two ways: **skills** for the recurring work in your role, and **expansions** (extensions and folders from `EXPANSIONS.md`) when your knowledge base or structure outgrows the basics.

---

## What ships

| Piece | What it is |
|---|---|
| `/onboard` | Setup wizard. 7-question interview, generates your Day-1 file set, fills `CLAUDE.md`. |
| `/evaluating-skills` | Reviews a skill you just built and returns the 1-2 fixes that matter most. |
| `/weekly-review` | 15 minutes once a week: turns what broke and what repeated into file changes. |
| `knowledge/` | The knowledge base: log, sources, cited pages, and its rules in `RULES.md`. |
| `context/personalities/` | 8 voice overlays you can switch per task. |
| `EXPANSIONS.md` | One catalog of everything to add later, and when. |

That's it out of the box. You build more skills as real, recurring needs show up. Start with `references/what-a-good-skill-looks-like.md`, and see `EXPANSIONS.md` for what to add and when.

Want ready-made skills and the commands we use daily? See our [PM AI Toolkit](https://github.com/productbench-hq/pm-ai-toolkit).

---

## Quick start

1. **Get the kit onto your machine.** Clone this repo, or click **Code → Download ZIP** and unzip it. Your answers and content stay local; nothing gets sent back to Productbench. Want a backup? Push it to a new **private** repo of your own. Don't fork: a fork of this public repo is public too.
2. **Open it in Claude Code or Codex** and run `/onboard`. Answer the 7 questions honestly — voice samples get pasted, not described. About 15 minutes.
3. **Connect one tool.** Pick one from `context/connections.md` (your calendar, Slack, your tracker) and wire it up via a connector/MCP or a small API script. Save what you learn in `references/{tool}-api.md`.
4. **Use it for a week.** Bring real questions, make real decisions — Claude logs them to `knowledge/log/` as you go. Hand over real material (interview transcripts, docs) and watch it turn into cited synthesis in `knowledge/pages/`. Note: raw material in `knowledge/sources/` is kept out of git on purpose (see `.gitignore`), so back it up separately if you need to.
5. **Grow it.** A manual task repeats 3+ times → build a skill: follow `references/what-a-good-skill-looks-like.md`, then run `/evaluating-skills` on it. The knowledge base starts to need lifecycle management → add an expansion (`EXPANSIONS.md` tells you which, when).
6. **Run `/weekly-review` once a week.** Fix the system, not the output.

---

## Repo layout

```
├── README.md
├── CLAUDE.md                ← Operating manual (filled by /onboard)
├── AGENTS.md                ← Points Codex to CLAUDE.md and the skills
├── EXPANSIONS.md            ← Everything to add later, and when
├── LICENSE
├── context/                 ← About you and your world: personalities, connections.md, intake.md (/onboard source)
│                                + about-me, about-business, priorities, voice (created by /onboard)
├── knowledge/               ← The knowledge base — read its RULES.md first
│   ├── log/                 ← Ground truth: what happened, daily files, append-only
│   ├── sources/             ← Ground truth: raw material, immutable
│   ├── pages/               ← Compiled synthesis, cited back to sources/log
│   └── index.md             ← One line per page and source — a cache
├── references/              ← Read on demand: API guides, SOPs, skill guides
│   └── what-a-good-skill-looks-like.md  ← How to build a skill: principles, skeleton, checklist
├── archive/                 ← Old material. Don't delete — move here.
└── .claude/skills/          ← /onboard, /evaluating-skills, /weekly-review + yours
```

The design premise, in one line: **you keep the synthesis, not the pile of transcripts** — every claim in `pages/` cites its evidence in `log/` or `sources/`. Full rules in `knowledge/RULES.md`.

---

## License

MIT License. See `LICENSE`. Fork it, rebrand it, make it yours.
