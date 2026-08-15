# Bilingual Release Assets Implementation Plan

> **For Codex:** Execute this plan in the current isolated worktree. Preserve unrelated user work and do not rewrite Git history.

**Goal:** Add paired Chinese/English v2 campaign images and bilingual GitHub documentation while preserving v1 as a stable tag.

**Architecture:** Treat promotional images as versioned documentation assets, keep runtime Skill files unchanged, and use annotated Git tags as immutable historical release pointers. A PowerShell release validator provides deterministic checks for asset integrity and Markdown link resolution.

**Tech Stack:** Markdown, PNG, PowerShell, Git, GitHub.

---

### Task 1: Establish the release contract

**Files:**
- Create: `tests/run-release-validation.ps1`
- Create: `docs/superpowers/specs/2026-08-15-bilingual-release-assets-design.md`

1. Add checks for ten paired assets, 1672 x 941 PNG dimensions, bilingual README mapping, local Markdown links, and version-history links.
2. Run the validator and confirm it fails because the new release artifacts do not exist.

### Task 2: Add paired promotional assets

**Files:**
- Create: `assets/v2/zh/*.png`
- Create: `assets/v2/en/*.png`

1. Copy the five approved Chinese originals without recompression.
2. Localize one English counterpart per image while preserving layout, colors, icons, numbers, and information hierarchy.
3. Inspect all ten images and reject unreadable or mismatched outputs.

### Task 3: Publish bilingual documentation

**Files:**
- Modify: `README.md`
- Create: `README.zh-CN.md`
- Create: `docs/version-history.md`

1. Add language navigation and the English visual narrative to `README.md`.
2. Add a content-equivalent Chinese README using the Chinese assets.
3. Explain the v1/v2 tag model and historical access instructions.

### Task 4: Verify and publish

**Files:**
- Update: `tests/forward-results.md`

1. Run release validation and existing v2 validation.
2. Run the official Skill validator and inspect repository diff/status.
3. Commit the release assets and docs.
4. Create `v1.0.0` at `ffb70e7` and `v2.0.0` at the release commit.
5. Push the branch to `main` and push both tags without force.
6. Read back remote refs and public GitHub files.
