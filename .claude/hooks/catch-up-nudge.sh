#!/bin/bash
# SessionStart hook: tells Claude to run the catching-up skill when the last
# catch-up is missing or more than 4 hours old. Fetches nothing itself.
# Stdout from a SessionStart hook is added to Claude's context.

ROOT="${CLAUDE_PROJECT_DIR:-$(pwd)}"
STATE="$ROOT/.claude/state/last-catch-up"
MAX_AGE=$((4 * 60 * 60))

# Onboarding not finished (CLAUDE.md still has placeholders): offer to resume it instead.
if grep -q "{{" "$ROOT/CLAUDE.md" 2>/dev/null; then
  if [ -f "$ROOT/context/about-me.md" ] || [ -f "$ROOT/context/voice.md" ]; then
    echo "Onboarding isn't finished (CLAUDE.md still has {{placeholders}}). Before the user's request, offer once to resume /onboard where it left off."
  fi
  exit 0
fi

if [ -f "$STATE" ]; then
  last=$(stat -f %m "$STATE" 2>/dev/null || stat -c %Y "$STATE" 2>/dev/null)
  age=$(( $(date +%s) - last ))
  [ "$age" -lt "$MAX_AGE" ] && exit 0
  echo "Last catch-up: $(cat "$STATE"). Run the catching-up skill first, then handle the user's request."
else
  echo "Last catch-up: never. Run the catching-up skill first, then handle the user's request."
fi
