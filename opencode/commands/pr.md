---
description: Create a GitHub Pull Request with User-Centric AI Summary
subtask: true
---

## 🚀 Pull Request Protocol

Current branch: !`git branch --show-current`
Current diff: !`git diff main...HEAD`

Please create a GitHub Pull Request from the current branch to **main** by following these steps:
All commits must include a prefix: `docs:`, `feat:`, `chore:`, `ci:`, `test:`, `refactor:`, or `fix:`.

### 1. Analysis
Analyze the `Current diff` above. Identify not just the code changes, but the **Value/Impact** for the end user.

### 2. PR Generation
Generate a professional PR following these constraints:
- **Title:** Under 60 characters. Use conventional prefixes (e.g., `feat:`, `fix:`, `chore:`). 
  - *Example:* `fix: prevent UI freezing during API timeouts`
- **Body:** - **Summary:** A 1-2 sentence explanation of **WHY** these changes were made from a user perspective.
  - **Technical Updates:** A bulleted list of key technical changes (the **WHAT**).

### 3. Execution
Use the `bash` tool to execute:
`gh pr create --base main --title "<generated_title>" --body "<generated_description>"`

> [!IMPORTANT]
> If the branch has not been pushed to remote or the `gh` CLI is not authenticated, **alert me** before proceeding. Do not attempt to fix conflicts; notify me if they exist.
