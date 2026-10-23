#!/usr/bin/env bash
# Scaffold a new daily problem entry.
# Usage: ./scripts/new_problem.sh <number> <slug> <difficulty> ["Problem Title"]
set -euo pipefail

if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <number> <slug> <difficulty> [\"Problem Title\"]"
  echo "Example: $0 0003 longest-substring-without-repeating-characters Medium \"Longest Substring Without Repeating Characters\""
  exit 1
fi

NUMBER="$1"
SLUG="$2"
DIFFICULTY="$3"
TITLE="${4:-$(echo "$SLUG" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2); print}')}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROBLEM_DIR="$ROOT_DIR/problems/${NUMBER}-${SLUG}"

if [ -d "$PROBLEM_DIR" ]; then
  echo "Problem directory already exists: $PROBLEM_DIR"
  exit 1
fi

mkdir -p "$PROBLEM_DIR"

cat > "$PROBLEM_DIR/README.md" <<EOF
# ${NUMBER} - ${TITLE}

**Difficulty:** ${DIFFICULTY}
**Link:** https://leetcode.com/problems/${SLUG}/

## Problem

<!-- short description -->

## Approach

<!-- how you solved it, and why -->

## Complexity

- Time: O(?)
- Space: O(?)
EOF

cat > "$PROBLEM_DIR/solution.py" <<'EOF'
def solve():
    pass


if __name__ == "__main__":
    pass
EOF

cat > "$PROBLEM_DIR/solution.js" <<'EOF'
function solve() {}

module.exports = { solve };
EOF

# Insert a new row right after the table header separator in README.md
README="$ROOT_DIR/README.md"
NEW_ROW="| ${NUMBER} | [${TITLE}](problems/${NUMBER}-${SLUG}) | ${DIFFICULTY} | ⬜ | ⬜ |"

awk -v row="$NEW_ROW" '
  { print }
  /^\|---\|/ && !inserted { print row; inserted=1 }
' "$README" > "$README.tmp" && mv "$README.tmp" "$README"

# Bump the "Problems solved" count
CURRENT_COUNT=$(grep -c '^| [0-9]' "$README" || true)
sed -i '' "s/\*\*Problems solved:\*\* [0-9]*/**Problems solved:** ${CURRENT_COUNT}/" "$README"

echo "Created $PROBLEM_DIR"
echo "Updated README.md — fill in the solution, mark the checkmarks, and commit."
