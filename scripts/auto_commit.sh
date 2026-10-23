#!/usr/bin/env bash
# Commits and pushes only if there's a real, uncommitted change in the repo.
# Run via launchd 2-3x/day at staggered times — never creates empty/padding commits.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_DIR"

if [ -z "$(git status --porcelain)" ]; then
  echo "$(date '+%Y-%m-%d %H:%M:%S') — no changes, skipping."
  exit 0
fi

git add -A
git commit -m "Update $(date '+%Y-%m-%d %H:%M')"
git push
echo "$(date '+%Y-%m-%d %H:%M:%S') — committed and pushed."
