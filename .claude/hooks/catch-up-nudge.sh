#!/bin/bash
# SessionStart hook: tells Claude to run the catching-up skill when the last
# catch-up is missing or more than 4 hours old. Fetches nothing itself.
# Stdout from a SessionStart hook is added to Claude's context.

ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
STATE="$ROOT/.claude/state/last-catch-up"
MAX_AGE=$((4 * 60 * 60))

# Not onboarded yet (CLAUDE.md still has placeholders): stay quiet.
grep -q "{{name}}" "$ROOT/CLAUDE.md" 2>/dev/null && exit 0

if [ -f "$STATE" ]; then
  last=$(stat -f %m "$STATE" 2>/dev/null || stat -c %Y "$STATE" 2>/dev/null)
  age=$(( $(date +%s) - last ))
  [ "$age" -lt "$MAX_AGE" ] && exit 0
  echo "Last catch-up: $(cat "$STATE"). Run the catching-up skill first, then handle the user's request."
else
  echo "Last catch-up: never. Run the catching-up skill first, then handle the user's request."
fi
