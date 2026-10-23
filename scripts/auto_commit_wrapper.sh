#!/usr/bin/env bash
# Sleeps a random amount (0-45 min) then runs auto_commit.sh, so the three
# launchd trigger times (late morning / afternoon / evening) don't produce
# commits at the exact same minute every day.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
JITTER_SECONDS=$((RANDOM % 2700))
sleep "$JITTER_SECONDS"
"$SCRIPT_DIR/auto_commit.sh" >> "$HOME/Library/Logs/daily-coding-journal-autocommit.log" 2>&1
