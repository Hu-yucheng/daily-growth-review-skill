# Daily Growth Review v2 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Publish a background-neutral daily review Skill that creates a private adaptive user profile, an evidence-based tomorrow board, comparable growth scores, delayed recall, and a connector-safe capture contract.

**Architecture:** Keep the public method in `daily-growth-review/` and mirror its behavior into Claude and DeepSeek distributions. Store detailed schemas in focused reference files, keep real profiles and journals outside Git, and treat Notion, Scheduled Tasks, WeChat, and Douyin access as optional adapters that must be capability-checked.

**Tech Stack:** Markdown Skill packages, YAML metadata, PowerShell validation, Git, Codex CLI fresh-context evaluations when executable.

## Global Constraints

- Public files must not contain a default profession, research workflow, fixed mentor, personal goal, Notion ID, webhook, or private journal entry.
- Preserve all existing user changes and stage only exact v2 files at each commit.
- Ask the four essential profile questions progressively; sensitive context remains optional and purpose-bound.
- Use one primary outcome, 3–5 weighted subtasks totaling 100, and at most two support tasks.
- Score 0–4 from behavioral evidence, compare `-2..+2` against the last similar situation, and report a bounded seven-day trend.
- Do not count generated Feynman text as recall, speaking, teaching, or transfer evidence.
- Do not claim a connector write, reminder, or content extraction unless the tool completed and the result was verified.
- Do not publish `second-brain/`, real profiles, Notion identifiers, tokens, webhooks, or local connector configuration.

---

## File Map

### Public Codex package

- `daily-growth-review/SKILL.md`: routing and required daily workflow.
- `daily-growth-review/agents/openai.yaml`: UI label and neutral default prompt.
- `daily-growth-review/references/user-profile.md`: stable/current profile schema and progressive interview.
- `daily-growth-review/references/daily-template.md`: human-readable review plus machine-readable fields.
- `daily-growth-review/references/next-action-board.md`: weighted tomorrow plan contract.
- `daily-growth-review/references/scoring-and-growth.md`: evidence anchors, comparison, and trend rules.
- `daily-growth-review/references/learning-recall.md`: delayed recall queue and upgrade card.
- `daily-growth-review/references/capture-inbox.md`: phone/link/audio capture contract and adapter boundaries.
- `daily-growth-review/references/reflection-action-loop.md`: commitment audit and recurrence gate.
- `daily-growth-review/references/interview-prompts.md`: progressive, non-invasive questions.
- `daily-growth-review/references/mentor-frameworks.md`: generic reflection lenses and optional user-chosen mentors.
- `daily-growth-review/references/weekly-template.md`: weekly aggregation of closure, trend, and recall.
- `daily-growth-review/references/yearly-template.md`: annual synthesis without fixed life domains.

### Mirrors and documentation

- `claude/daily-growth-review/**`: behaviorally equivalent Claude package.
- `deepseek/system-prompt.md`: readable DeepSeek v2 prompt.
- `deepseek/system-prompt.txt`: plain-text DeepSeek v2 prompt.
- `deepseek/user-prompts.md`: background-neutral examples.
- `deepseek/api-example.md`: API example referencing the v2 prompt without personal defaults.
- `shared/core-method.md`: platform-neutral contract.
- `README.md`: public v2 usage, privacy model, limitations, and migration notes.
- `.gitignore`: exclude private review/profile/connector artifacts while preserving existing ignore rules.

### Evaluation

- `tests/scenarios.md`: nine baseline and forward-test prompts with acceptance criteria.
- `tests/run-v2-validation.ps1`: deterministic structure, parity, weight, and privacy checks.
- `tests/baseline-results.md`: observed failures from the pre-v2 package.
- `tests/forward-results.md`: post-v2 fresh-context outputs and pass/fail decisions.
- `tests/acceptance-checklist.md`: release gate summary.

---

### Task 1: Establish failing v2 evaluations

**Files:**
- Create: `tests/scenarios.md`
- Create: `tests/run-v2-validation.ps1`
- Create: `tests/baseline-results.md`

**Interfaces:**
- Consumes: current pre-v2 public files.
- Produces: `Invoke-V2Validation -RepositoryRoot <path>` behavior via the script exit code; exit `0` means all checks pass, exit `1` means one or more v2 requirements fail.

- [ ] **Step 1: Write nine behavioral scenarios**

Use exact scenario IDs:

```markdown
S01-neutral-student
S02-caregiver-privacy
S03-large-goal-breakdown
S04-busy-without-output
S05-no-comparable-baseline
S06-unreadable-douyin-link
S07-missing-connectors
S08-delayed-recall
S09-publication-privacy
```

Each scenario records the prompt, the pre-v2 failure expected from current files, and v2 acceptance criteria.

- [ ] **Step 2: Write the deterministic validator**

The script must:

```powershell
param([string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = 'Stop'
$failures = [System.Collections.Generic.List[string]]::new()

function Require-Text([string]$Path, [string[]]$Patterns) {
    $content = Get-Content -Raw -Encoding UTF8 $Path
    foreach ($pattern in $Patterns) {
        if ($content -notmatch $pattern) { $failures.Add("missing:$Path:$pattern") }
    }
}

function Forbid-Text([string]$Path, [string[]]$Patterns) {
    $content = Get-Content -Raw -Encoding UTF8 $Path
    foreach ($pattern in $Patterns) {
        if ($content -match $pattern) { $failures.Add("forbidden:$Path:$pattern") }
    }
}
```

Check required reference files, required workflow terms, Codex/Claude reference parity, Markdown fences, YAML frontmatter, private path exclusions, legacy role-specific goals, fixed named mentor labels, and real Notion collection IDs in distributable files.

- [ ] **Step 3: Run the validator and confirm RED**

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tests/run-v2-validation.ps1
```

Expected: exit `1` with failures for missing v2 reference files and forbidden personalized defaults.

- [ ] **Step 4: Record baseline evidence**

Record command, timestamp, exact failed check categories, and the current package behaviors that would violate S01, S03, S05, S07, and S08. Do not claim model outputs were observed when only static files were inspected.

- [ ] **Step 5: Commit the evaluation baseline**

```powershell
git add -- tests/scenarios.md tests/run-v2-validation.ps1 tests/baseline-results.md
git commit -m "test: add failing daily review v2 evaluations"
```

### Task 2: Add private profile and reusable v2 contracts

**Files:**
- Create: `daily-growth-review/references/user-profile.md`
- Create: `daily-growth-review/references/next-action-board.md`
- Create: `daily-growth-review/references/scoring-and-growth.md`
- Create: `daily-growth-review/references/learning-recall.md`
- Create: `daily-growth-review/references/capture-inbox.md`
- Modify: `daily-growth-review/references/reflection-action-loop.md`
- Modify: `daily-growth-review/references/interview-prompts.md`
- Modify: `daily-growth-review/references/mentor-frameworks.md`

**Interfaces:**
- Produces profile fields `stable`, `current_cycle`, `optional_context`, and `updated_at`.
- Produces tomorrow fields `primary_outcome`, `definition_of_done`, `subtasks`, `support_tasks`, and `progress_percent`.
- Produces growth fields `evidence_score`, `comparison_delta`, `comparison_basis`, and `seven_day_trend`.
- Produces recall fields `recall_id`, `due_dates`, `status`, and `upgrade_card`.
- Produces Inbox fields `capture_id`, `captured_at`, `source`, `type`, `raw_content`, `context`, `confidence`, and `processed`.

- [ ] **Step 1: Add the progressive profile contract**

Include the four essential questions, conditional sensitive fields, skip/delete rights, stable/current-cycle separation, and rule to ask one question at a time only when the answer is missing.

- [ ] **Step 2: Add the tomorrow board contract**

Define 3–5 subtasks, integer weights totaling 100, evidence for every subtask, one minimum version, one first physical action, one if-then plan, and at most two support tasks.

- [ ] **Step 3: Add scoring and comparison anchors**

Define the exact `0..4`, `-2..+2`, and `rising / stable / falling / insufficient_data` values from the design spec. Require `baseline_missing` when no similar event exists.

- [ ] **Step 4: Add delayed recall and Inbox contracts**

Require recall before answer display, default day-1 recall, optional day 3/7/30 spacing, and verified statuses only. For Inbox links, preserve sources and require user-provided transcript, notes, or screenshots when content is unavailable.

- [ ] **Step 5: Generalize action and reflection lenses**

Keep commitment evidence and third-recurrence structural action. Remove research-day scientific-question requirements and fixed mentors from the public defaults. Retain custom mentor support only when the user profile names one.

- [ ] **Step 6: Run RED again**

Run the validator. Expected: new contract-file checks pass, while core workflow, mirror parity, README, and privacy checks still fail.

- [ ] **Step 7: Commit the reusable contracts**

```powershell
git add -- daily-growth-review/references
git commit -m "feat: add adaptive review contracts"
```

### Task 3: Rewrite the Codex v2 workflow and templates

**Files:**
- Modify: `daily-growth-review/SKILL.md`
- Modify: `daily-growth-review/agents/openai.yaml`
- Modify: `daily-growth-review/references/daily-template.md`
- Modify: `daily-growth-review/references/weekly-template.md`
- Modify: `daily-growth-review/references/yearly-template.md`
- Modify: `shared/core-method.md`

**Interfaces:**
- Consumes: Task 2 reference contracts.
- Produces a background-neutral daily workflow and stable machine-readable review schema.

- [ ] **Step 1: Rewrite Skill routing and daily workflow**

Order the workflow as profile → prior audit → mainline/patch evidence → event heart → comparable baseline → generic lenses → scoring → tomorrow board → recall queue → machine fields. Keep `SKILL.md` below 500 lines and point to detailed references instead of duplicating them.

- [ ] **Step 2: Replace the daily template**

Required output sections:

```markdown
## 0. Context Check
## 1. Previous Commitment Audit
## 2. Today in Evidence
## 3. Event Heart and Emotional Mechanism
## 4. Comparable Growth
## 5. Adaptive Scores
## 6. Tomorrow Execution Board
## 7. Delayed Recall Queue
## 8. Weekly Index Fields
```

- [ ] **Step 3: Update weekly and yearly aggregation**

Weekly review reports commitment closure, primary-outcome progress, repeated pain points, dimension trends, comparison evidence, recall completion, and one next-week outcome. Yearly review derives domains from the profile instead of fixed fitness/work/research goals.

- [ ] **Step 4: Update neutral UI metadata and shared method**

Set a neutral default prompt that asks for adaptive profile handling and an evidence-based next action. Make `shared/core-method.md` the concise cross-platform source of truth.

- [ ] **Step 5: Run validation**

Expected: Codex workflow and schema checks pass; distribution parity, README, and final privacy checks remain failing.

- [ ] **Step 6: Commit the Codex v2 core**

```powershell
git add -- daily-growth-review/SKILL.md daily-growth-review/agents/openai.yaml daily-growth-review/references/daily-template.md daily-growth-review/references/weekly-template.md daily-growth-review/references/yearly-template.md shared/core-method.md
git commit -m "feat: make daily reviews background adaptive"
```

### Task 4: Synchronize Claude, DeepSeek, and public documentation

**Files:**
- Modify/Create: `claude/daily-growth-review/**`
- Modify: `deepseek/system-prompt.md`
- Modify: `deepseek/system-prompt.txt`
- Modify: `deepseek/user-prompts.md`
- Modify: `deepseek/api-example.md`
- Modify: `README.md`
- Modify: `.gitignore`

**Interfaces:**
- Consumes: Codex v2 contracts and shared core method.
- Produces equivalent public distributions and repository privacy boundaries.

- [ ] **Step 1: Mirror the Claude package**

Copy the v2 workflow and all reference contracts into the Claude package, omitting only Codex-specific `agents/openai.yaml`. Verify reference filenames and required fields match.

- [ ] **Step 2: Rewrite DeepSeek prompts and examples**

Remove fixed mentors, research defaults, fitness defaults, and personalized examples. Include the profile, tomorrow board, evidence score, comparison, recall, Inbox, and connector-capability boundaries.

- [ ] **Step 3: Rewrite README for v2**

Document first-use onboarding, public/private separation, a neutral example, tomorrow progress calculation, scoring boundaries, delayed recall, mobile capture contract, and honest WeChat/Douyin/Notion limitations.

- [ ] **Step 4: Protect private artifacts**

Append these patterns while preserving existing ignore rules:

```gitignore
second-brain/
profiles/*.local.md
private/
.env
.env.*
*connector-secrets*
```

- [ ] **Step 5: Run full deterministic validation**

Expected: all static checks pass with exit `0`.

- [ ] **Step 6: Commit distribution and privacy changes**

Review the full staged diff before committing because `README.md` and `.gitignore` already contain user changes. Stage only after confirming every existing hunk is intended for public v2.

```powershell
git add -- claude deepseek README.md .gitignore
git diff --cached --check
git commit -m "docs: publish portable daily review v2 guidance"
```

### Task 5: Run fresh-context forward tests and install the verified Skill

**Files:**
- Create: `tests/forward-results.md`
- Create: `tests/acceptance-checklist.md`
- Sync destination: `C:\Users\Admin\.codex\skills\daily-growth-review`

**Interfaces:**
- Consumes: S01–S09 and the completed v2 package.
- Produces documented pass/fail evidence and a byte-equivalent installed Skill.

- [ ] **Step 1: Run the official validator**

```powershell
python C:\Users\Admin\.codex\skills\.system\skill-creator\scripts\quick_validate.py daily-growth-review
```

If the system Python alias or PyYAML is unavailable, run the bundled workspace Python and separately document the official dependency failure; deterministic validation must still pass.

- [ ] **Step 2: Run fresh-context scenarios**

Use `codex exec` only if executable with current authorization. Run S01, S03, S05, S06, S07, and S08 in separate fresh calls, passing only the v2 Skill path and the scenario prompt. If executable access remains blocked, record that limitation and do not mislabel static review as a model forward test.

- [ ] **Step 3: Manually score every output**

Read every generated output and record acceptance decisions in `tests/forward-results.md`. Do not use string counts alone for behavioral compliance.

- [ ] **Step 4: Complete the release checklist**

Confirm structure, parity, behavior, privacy scan, Git diff scope, and absence of connector overclaims.

- [ ] **Step 5: Sync the installed Skill**

Copy only `daily-growth-review/` into `C:\Users\Admin\.codex\skills\daily-growth-review`, then compare recursive relative-path SHA256 hashes. Request filesystem approval if the destination is outside the writable workspace.

- [ ] **Step 6: Commit evaluation evidence**

```powershell
git add -- tests/forward-results.md tests/acceptance-checklist.md
git commit -m "test: verify daily growth review v2"
```

### Task 6: Final privacy audit and GitHub publication

**Files:**
- Inspect: every file in the commits since `675b313`.
- Do not add: `second-brain/`, `web/`, private assets, local profiles, connector secrets, or unrelated working-tree changes.

**Interfaces:**
- Consumes: all Task 1–5 commits.
- Produces: pushed `main` at `origin` with a clean v2 commit series while preserving unrelated local changes.

- [ ] **Step 1: Audit commit scope**

```powershell
git status --short
git diff --stat origin/main..HEAD
git diff --check origin/main..HEAD
git log --oneline origin/main..HEAD
```

- [ ] **Step 2: Scan publishable history for private markers**

Search the diff for names, exact workplaces, Notion collection IDs, webhook URLs, tokens, private journal paths, material-research defaults, fixed mentors, and personal goals. Generic documentation terms such as “Notion ID must not be committed” are allowed only when no real identifier appears.

- [ ] **Step 3: Verify the remote and branch**

Confirm `origin` is `https://github.com/Hu-yucheng/daily-growth-review-skill.git`, branch is `main`, and no force push is required. Do not rewrite historical commits.

- [ ] **Step 4: Push the reviewed commits**

```powershell
git push origin main
```

- [ ] **Step 5: Read back the remote state**

Fetch or inspect GitHub after push and verify the remote branch contains the v2 commits and that private/untracked directories remain absent.
