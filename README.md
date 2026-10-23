# Daily Coding Journal

A running log of coding problems I solve, written up and solved in both **Python** and **JavaScript**. Started as a daily habit to stay sharp on data structures & algorithms while applying for internships.

## How this works

- Every problem lives in `problems/NNNN-problem-slug/` with:
  - `README.md` — problem link, my approach, and time/space complexity
  - `solution.py` — Python solution
  - `solution.js` — JavaScript solution
- New entries are scaffolded with `scripts/new_problem.sh` so adding today's problem is a one-liner (see below).
- The table below is updated with every new entry — newest first.

## Adding today's problem

```bash
./scripts/new_problem.sh <number> <slug> <difficulty>
# example:
./scripts/new_problem.sh 0003 longest-substring-without-repeating-characters Medium
```

This creates the folder with templated files and adds a row to the table below. Fill in the solution, write a couple sentences on your approach, commit.

## Problems solved

| # | Problem | Difficulty | Python | JS |
|---|---------|------------|--------|-----|
| 0002 | [Valid Parentheses](problems/0002-valid-parentheses) | Easy | ✅ | ✅ |
| 0001 | [Two Sum](problems/0001-two-sum) | Easy | ✅ | ✅ |

## Stats

- **Problems solved:** 2
- **Current streak:** check commit history 👀
