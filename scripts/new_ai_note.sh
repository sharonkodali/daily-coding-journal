#!/usr/bin/env bash
# Scaffold today's AI/tech note.
# Usage: ./scripts/new_ai_note.sh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DATE="$(date +%Y-%m-%d)"
NOTE_PATH="$ROOT_DIR/ai-notes/${DATE}.md"

if [ -f "$NOTE_PATH" ]; then
  echo "Note already exists: $NOTE_PATH"
  exit 1
fi

cat > "$NOTE_PATH" <<EOF
# ${DATE}

<!-- What's a recent AI/tech development worth knowing about? A couple sentences is enough. -->

EOF

echo "Created $NOTE_PATH — write it up, then commit."
