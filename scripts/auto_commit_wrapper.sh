#!/usr/bin/env bash
# Sleeps a random amount (0-45 min) then fetches today's real LeetCode daily
# challenge (so there's always genuine new content to commit, not padding)
# and runs auto_commit.sh. Jitter keeps the single daily launchd trigger
# from firing at the exact same minute every day.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JITTER_SECONDS=$((RANDOM % 2700))
sleep "$JITTER_SECONDS"
"$SCRIPT_DIR/fetch_daily_challenge.sh" >> "$HOME/Library/Logs/daily-coding-journal-autocommit.log" 2>&1
"$SCRIPT_DIR/auto_commit.sh" >> "$HOME/Library/Logs/daily-coding-journal-autocommit.log" 2>&1
