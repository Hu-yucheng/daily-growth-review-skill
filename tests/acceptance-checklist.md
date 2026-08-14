# Daily Growth Review v2 Release Checklist

Date: 2026-08-15

## Structure and contracts

- [x] Public Skill is background-neutral and contains no default profession, research workflow, personal goal, or fixed mentor.
- [x] First-use profile asks progressively, one question at a time, and allows sensitive context to be skipped or deleted.
- [x] Tomorrow board requires one primary outcome, 3–5 weighted subtasks totaling 100, evidence, minimum version, first action, and if-then plan.
- [x] Scoring separates 0–4 behavioral evidence, comparable-event change, missing baselines, and bounded seven-day trends.
- [x] Delayed recall requires retrieval before showing prior explanations and uses verified mastery statuses only.
- [x] Inbox preserves sources and handles unreadable links without inventing content.
- [x] Connector actions require capability checks, consent where needed, tool completion, and read-back or equivalent verification.

## Distribution parity

- [x] Codex and Claude `SKILL.md` files are byte-equivalent.
- [x] Codex and Claude reference files are byte-equivalent.
- [x] DeepSeek prompt and examples carry the same v2 contracts without personalized defaults.
- [x] README documents public/private separation and honest WeChat, Douyin, and Notion limitations.

## Evaluation

- [x] Pre-v2 deterministic validation was recorded as failing.
- [x] Post-v2 deterministic validator returns `V2_VALIDATION_OK`.
- [x] Six required scenarios were run in independent fresh contexts and manually reviewed.
- [x] All six forward-test responses passed their behavioral acceptance criteria.
- [x] Official validator dependency failure is documented without claiming a pass.

## Privacy and publication

- [x] Private paths, local profiles, `.env` files, and connector-secret names are ignored.
- [x] Distributable files are scanned for real Notion collection IDs, WeCom webhook keys, and credential-like values.
- [x] Legacy personalized images were removed from the v2 branch and remain recoverable from Git history.
- [x] Installed Skill is synchronized and recursive hashes match the verified source (13 files, SHA-256 compared).
- [x] Final staged/commit diff is scanned for private markers and unrelated files.
- [ ] Remote branch is pushed without force and read back after publication.
