# Daily Coding Journal

A running devlog: coding problems, class schedule, running to-dos, and short notes on AI/tech developments I want to keep up with. One place, updated most days, while I'm applying for internships.

## Structure

- **`problems/`** — coding problems I solve (LeetCode-style and otherwise), in Python and JavaScript. Scaffold a new one with:
  ```bash
  ./scripts/new_problem.sh <number> <slug> <difficulty>
  ```
- **`ai-notes/`** — short, self-written notes on a recent AI/tech development worth knowing about. Not every day — just when something's worth noting. Scaffold today's with:
  ```bash
  ./scripts/new_ai_note.sh
  ```
- **`schedule/classes.md`** — current quarter's classes.
- **`todos.md`** — running to-do list, kept intentionally generic. Personal, financial, and job-application admin (account IDs, visa/sponsorship status, fee holds, etc.) live elsewhere — not committed here, since this repo is public.

## Commit automation

A local script (`scripts/auto_commit.sh`) runs via `launchd` 2–3 times a day at staggered times. It checks for real changes in the working tree and commits + pushes only if something actually changed — no empty or padding commits. All commits are authored under my own name, not generated/attributed to any AI tool.

## Problems solved

| # | Problem | Difficulty | Python | JS |
|---|---------|------------|--------|-----|
| 0002 | [Valid Parentheses](problems/0002-valid-parentheses) | Easy | ✅ | ✅ |
| 0001 | [Two Sum](problems/0001-two-sum) | Easy | ✅ | ✅ |

## Stats

- **Problems solved:** 2
- **Current streak:** check commit history 👀
