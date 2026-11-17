# Connections

Registry of every system your AIOS can reach. Filled by `/onboard` and expanded every time you set up a new connection: add a row, never a second list elsewhere.

| # | Domain | Tool | Mechanism | Account | Scope | Auth | Last checked |
|---|---|---|---|---|---|---|---|
| 1 | Product metrics | — | not yet connected | — | — | — | — |
| 2 | Stakeholder & user interactions | — | not yet connected | — | — | — | — |
| 3 | Calendar | — | not yet connected | — | — | — | — |
| 4 | Communication | — | not yet connected | — | — | — | — |
| 5 | Backlog / roadmap tracking | — | not yet connected | — | — | — | — |
| 6 | Meeting intelligence | — | not yet connected | — | — | — | — |
| 7 | Knowledge / files | — | not yet connected | — | — | — | — |

**Scope** is what the AI may read there, and for what: e.g. `5 sent emails, writing style only` or `catch-ups: all project channels`. `/catching-up` scans every connected tool unless its Scope limits it to another purpose.

**Mechanism options:** `connector` (built-in, a few clicks in your AI app's settings — try this first), `mcp` (MCP server), `script` (Python/Bash hitting an API, in `scripts/`), `export` (CSV/JSON dump pipeline), `key+ref` (`.env` key + `references/{tool}-api.md` guide), `not yet connected`.

When you wire a new tool, also save `references/{tool}-api.md` capturing endpoints, auth flow, and common queries — researched-once-saved-forever.
