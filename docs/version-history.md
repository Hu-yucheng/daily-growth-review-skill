# Version History / 版本历史

[English README](../README.md) | [中文说明](../README.zh-CN.md)

This repository uses immutable Git tags to preserve major versions. Updating `main` never deletes or rewrites an earlier tagged release.

本仓库使用不可变的 Git 标签保留主要版本。更新 `main` 不会删除或改写已经打标签的历史版本。

| Version | Status | Git reference | Summary |
|---|---|---|---|
| [`v1.0.0`](https://github.com/Hu-yucheng/daily-growth-review-skill/tree/v1.0.0) | Historical / 历史版本 | `ffb70e7` | Original personalized review workflow, including Codex, Claude, and DeepSeek distributions. / 原始个性化复盘流程，包含 Codex、Claude 与 DeepSeek 版本。 |
| [`v2.0.0`](https://github.com/Hu-yucheng/daily-growth-review-skill/tree/v2.0.0) | Current stable / 当前稳定版 | release tag / 发布标签 | Background-neutral profiles, evidence scoring, weighted next actions, delayed recall, Capture Inbox, privacy boundaries, and bilingual campaign assets. / 背景自适应、证据评分、加权行动、延迟回忆、碎片收件箱、隐私边界与双语宣传图。 |
| [`main`](https://github.com/Hu-yucheng/daily-growth-review-skill) | Latest / 最新 | moving branch / 持续更新分支 | The latest reviewed repository state. / 最新审核通过的仓库状态。 |

## Browse or restore v1 / 查看或恢复 V1

Browse online:

```text
https://github.com/Hu-yucheng/daily-growth-review-skill/tree/v1.0.0
```

Check out locally without changing repository history:

```powershell
git fetch --tags
git switch --detach v1.0.0
```

Return to the current line:

```powershell
git switch main
```

Tags are release pointers, not duplicate folders. This keeps the current tree clean while preserving every V1 file exactly as it was.

标签是稳定的发布指针，不是在当前目录里复制一整套旧文件。这样既保持主分支清晰，也能完整保留 V1 当时的每一个文件。
