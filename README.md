# Productbench AIOS: Starter Kit

A free, MIT-licensed starter kit that turns your AI agent into your personal **AI Operating System (AIOS)**. Built by [Productbench](https://www.productbench.co/) for product managers, senior PMs and heads of product. We hand it out at our workshops.

The kit sets itself up through a short `/onboard` conversation. Then it grows in two ways: **skills** for the recurring work in your role, and **expansions** (from `EXPANSIONS.md`) when your knowledge base outgrows the basics.

---

## What's inside

| Piece | What it is |
|---|---|
| Skills | Seven ready-made skills, listed below. Build your own as needs show up. |
| Working rules | `CLAUDE.md` holds 8 concrete rules for how the AI works with you: answer first, say it once, plain English, push back early, and more. When you correct it, it offers to save the correction as a new rule, so it gets better the more you use it. |
| `knowledge/` | The knowledge base: a daily log, raw sources, and cited pages. Rules in `knowledge/RULES.md`. |
| Session-start nudge | In Claude Code, offers a catch-up when the last one is over 4 hours old, or to resume `/onboard` if you stopped halfway. |
| `EXPANSIONS.md` | One catalog of everything to add later, and when. |

---

## Skills

| Skill | What it does | Use it when | Setup |
|---|---|---|---|
| [`/understand`](.claude/skills/understand/SKILL.md) | Walks through a document one thought at a time. Lets you question the evidence, add context, and carry changes into a revised conclusion | You need to understand a document before deciding or taking ownership | None |
| [`/onboard`](.claude/skills/onboard/SKILL.md) | Sets up your AIOS: your name, writing style, company and role, how you work together, optional goals. Skip anything. | You just got the kit, or your role changed | None |
| [`/catching-up`](.claude/skills/catching-up/SKILL.md) | Reads what changed in your connected tools since you last looked: what needs you, what's out of date, with fixes for a yes | You start a work session and want to know what you missed | One connected tool |
| [`/meetings-to-issues`](.claude/skills/meetings-to-issues/SKILL.md) | Turns meeting notes into tracker issues, logged decisions and parked ideas. Checks for duplicates and creates nothing until you say yes | A meeting just ended and its next steps need to land in Linear, Jira or Asana | A connected tracker. Walks you through the rest on first run |
| [`/decision-review`](.claude/skills/decision-review/SKILL.md) | Reviews a decision before you commit: the assumptions you haven't said out loud, checked against your evidence, with the cheapest test for each. Logs your verdict and a date to check back | You're about to commit to a decision that feels obvious, and being wrong would cost you | None |
| [`/go-deeper`](.claude/skills/go-deeper/SKILL.md) | Rewrites a task into the version a top professional would do: their raw material, their methods, and an outside check that the result is right | Your AI gives you the obvious answer and you want the expert one | None |
| [`/writing-with-intent`](.claude/skills/writing-with-intent/SKILL.md) | Interviews you about who you write for, what they get, what you believe, and what you'd never publish or write. Saves it as your writing intent, so AI drafts are written for someone, not just about something | Your AI drafts are fluent but could be anyone's, and you write under your own name | None |

You start a skill by typing its name, e.g. `/decision-review`.

**Want just one skill?** Copy its folder into `.claude/skills/` in your own project, or into `~/.claude/skills/` to use it everywhere.

New skills land here. **[Get them by email →](https://buttondown.com/productbench)**

---

## Quick start

1. **Let your AI set it up.** Open Claude Code (in the Claude desktop app: the **Code** tab) or Codex, in any folder, and paste:

   > Set up my AIOS from github.com/productbench-hq/aios-template in my Documents folder. Follow the agent setup steps in its README.

   It puts the kit in `Documents/my-aios` and tells you how to start. Prefer to do it yourself? **Use this template → Create a new repository** (set it to **Private**), `git clone`, or **Code → Download ZIP**. Don't fork: a fork of this public repo is public, and so would be everything you add to it.
2. **Open it and run `/onboard`.** Start a **new** session in the `my-aios` folder: the kit's skills and rules only load in a session opened on that folder.
   - *Claude desktop app:* **Code** tab → new session → choose the folder. Type `/onboard` and press Enter.
   - *Claude Code in a terminal:* open the folder and type `/onboard`.
   - *Codex:* open the folder and say "run onboard".

   It asks one short thing at a time, and you can skip anything. For your writing style, paste a few things you wrote or connect a tool you write in. About 15 minutes. Claude asks before it writes files or runs a command: approve those prompts, that's the kit setting itself up.
3. **Connect one tool for catch-ups.** Ask Claude, e.g. "help me connect my calendar". It uses a built-in connector where one exists and adds a row to `context/connections.md`. If you connected a tool during onboarding only for your writing style, ask Claude to widen its scope. Then say **"catch me up"**.
4. **Use it for a week.** Bring real questions and real decisions; Claude logs them to `knowledge/log/` as you go. Hand over real material (interview transcripts, docs) and it turns into cited pages in `knowledge/pages/`. When an answer is off, say so: Claude fixes it and offers to save a rule. Raw material in `knowledge/sources/` is kept out of git on purpose (see `.gitignore`), so back it up separately if you need it.
5. **Grow it.** A task repeats 3+ times → build a skill with `references/what-a-good-skill-looks-like.md`. Your knowledge base needs more structure → add an expansion from `EXPANSIONS.md`.

**On a Mac?** Finder hides folders that start with a dot, like `.claude`. Press **Cmd+Shift+.** to see them.

---

## Repo layout

```
├── README.md
├── CLAUDE.md                ← Operating manual and working rules (filled by /onboard)
├── AGENTS.md                ← Points Codex to CLAUDE.md and the skills
├── EXPANSIONS.md            ← Everything to add later, and when
├── LICENSE
├── context/                 ← About you and your world: connections.md, intake.md (/onboard progress log)
│                                + about-me, about-business, priorities, voice (created by /onboard)
├── knowledge/               ← The knowledge base: read its RULES.md first
│   ├── log/                 ← Ground truth: what happened, daily files, append-only
│   ├── sources/             ← Ground truth: raw material, never edited
│   ├── pages/               ← Compiled synthesis, cited back to sources/log
│   └── index.md             ← One line per page and source
├── references/              ← Read on demand: API guides, SOPs, skill guides
│   └── what-a-good-skill-looks-like.md  ← How to build a skill: principles, skeleton, checklist
├── archive/                 ← Old material and /onboard backups. Don't delete, move here.
├── .claude/hooks/           ← Session-start nudge (catch-up, or resume /onboard)
└── .claude/skills/          ← /onboard, /catching-up, /meetings-to-issues, /decision-review, /go-deeper, /understand + yours
```

The design premise in one line: **you keep the synthesis, not the pile of transcripts.** Every claim in `pages/` cites its evidence in `log/` or `sources/`. Full rules in `knowledge/RULES.md`.

---

## Agent setup steps

For an AI agent asked to set up this kit. Do the work; keep the user out of the terminal.

1. **Folder:** `~/Documents/my-aios`, unless the user named another place (then use that path in the commands below). Never a temporary folder. If it exists and isn't empty, ask first.
2. **Download.** Check git without triggering an install prompt: on macOS, git is usable only if `xcode-select -p` succeeds; elsewhere, `command -v git`.
   - Git usable: clone, then unlink the copy so the user's setup is never offered back to this repo:
     ```bash
     git clone https://github.com/productbench-hq/aios-template.git ~/Documents/my-aios
     git -C ~/Documents/my-aios remote rename origin upstream
     git -C ~/Documents/my-aios remote set-url --push upstream DISABLED
     git -C ~/Documents/my-aios branch --unset-upstream 2>/dev/null || true
     ```
   - Otherwise don't call git (on macOS it opens an install dialog). Download the archive:
     ```bash
     mkdir -p ~/Documents/my-aios
     curl -fsSL https://codeload.github.com/productbench-hq/aios-template/tar.gz/main | tar -xz -C ~/Documents/my-aios --strip-components=1
     ```
3. **Don't** run `/onboard` in this session, create a GitHub repo, or fork. Onboarding needs a session opened on the new folder.
4. **Tell the user, in plain words:** where the folder is, then how to start: start a new session in that folder (Claude desktop app: **Code** tab → new session → choose `my-aios`; Codex: open the folder), and type `/onboard` (Codex: say "run onboard"). About 15 minutes; they can skip anything. Mention that on a Mac, Finder hides `.claude` (Cmd+Shift+. shows it).

---

## License

MIT License. See `LICENSE`. Fork it, rebrand it, make it yours.
