---
description: Generate commit message (Stash & Branch Strategy)
subtask: true
---

## Workflow Steps

To maintain a clean `main` branch, do not commit directly to it. If changes exist in `main`, follow this protocol:

1.  *Stash Changes:* Run `git stash --include-untracked` to safely store all modifications, including new files.
2.  *Create Branch:* Create a new branch using Git conventions under 20 characters. (e.g., `chore/fix-api-timeout` or `feat/user-auth`).
3.  *Apply Work:* Run `git stash pop` to bring the changes into the new branch.
4.  *Commit & Push:* Execute the commit using the standards below and push to the remote.

---

## Commit Message Guidelines

All commits must include a prefix: `docs:`, `feat:`, `chore:`, `ci:`, `test:`, `refactor:`, or `fix:`.
Everything in .github/workflows is ci:

### The "Why" over "What"
Focus on explaining the **value to the end user** rather than technical implementation details. Keep it concise.

* *Bad:* `fix: update timeout val to 5000ms` (States what changed)
* *Good:* `fix: prevent UI freezing during API timeouts on slow networks` (States user impact)
* *Good:* `feat: remember last filters to save user setup time`

*Constraints:*
* Avoid generic phrases like "improved agent experience." Be specific about user-facing changes.
* *Conflicts:* If conflicts occur, **DO NOT ATTEMPT TO FIX THEM.** Notify the user immediately.

---

## Git Context

### GIT Current Branch
!`git git rev-parse --abbrev-ref HEAD`

### GIT DIFF
!`git diff`

### GIT DIFF --cached
!`git diff --cached`

### GIT STATUS --short
!`git status --short`

