#!/usr/bin/env bash
# Fetches LeetCode's public "Daily Coding Challenge" question and logs it to
# daily-challenge-log.md, so the automated commit has real, non-fake content
# to commit every day (today's actual challenge), even on days nothing else
# in the repo changed. Idempotent: skips if today's date is already logged.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG_FILE="$REPO_DIR/daily-challenge-log.md"

RESPONSE="$(curl -s --max-time 15 'https://leetcode.com/graphql' \
  -X POST -H 'Content-Type: application/json' \
  --data '{"query":"query questionOfToday { activeDailyCodingChallengeQuestion { date link question { questionFrontendId title titleSlug difficulty } } }"}')"

if [ -z "$RESPONSE" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — fetch failed (empty response), skipping."
  exit 0
fi

DATE=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin); print(d['data']['activeDailyCodingChallengeQuestion']['date'])" 2>/dev/null) || true
if [ -z "${DATE:-}" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — could not parse response, skipping."
  exit 0
fi

if [ -f "$LOG_FILE" ] && grep -q "^| $DATE " "$LOG_FILE"; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — $DATE already logged, skipping."
  exit 0
fi

TITLE=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin)['data']['activeDailyCodingChallengeQuestion']; print(d['question']['title'])")
DIFFICULTY=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin)['data']['activeDailyCodingChallengeQuestion']; print(d['question']['difficulty'])")
LINK=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin)['data']['activeDailyCodingChallengeQuestion']; print(d['link'])")
FRONTEND_ID=$(echo "$RESPONSE" | python3 -c "import json,sys; d=json.load(sys.stdin)['data']['activeDailyCodingChallengeQuestion']; print(d['question']['questionFrontendId'])")

if [ ! -f "$LOG_FILE" ]; then
  cat > "$LOG_FILE" <<'EOF'
# Daily Challenge Log

Auto-logged each day from LeetCode's public "Daily Coding Challenge" —
not necessarily solved, just tracked. See `problems/` for ones I've
actually written solutions for.

| Date | # | Problem | Difficulty |
|------|---|---------|------------|
EOF
fi

echo "| $DATE | $FRONTEND_ID | [$TITLE](https://leetcode.com$LINK) | $DIFFICULTY |" >> "$LOG_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') — logged $DATE: $TITLE ($DIFFICULTY)."
