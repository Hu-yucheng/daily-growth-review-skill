---
name: daily-growth-review
description: Use when the user wants a Chinese daily growth review, rough day notes turned into Markdown, timeline reconstruction, emotion naming, mentor-guided reflection, weekly review, annual review skeleton, or self-review that avoids shallow diary logging.
when_to_use: Trigger on requests such as 今日复盘, 每日复盘, 周复盘, 年复盘, 帮我复盘今天, 深挖内耗, 情绪命名, 王阳明/曾国藩/马斯克视角, or review my day/week.
---

# Daily Growth Review for Claude

## Purpose

Turn scattered daily material into a Markdown-first growth archive. Focus on patterns, emotion mechanisms, mentor mirrors, scores, and next actions instead of plain diary logging.

## Mode Selection

| Request | Use |
|---|---|
| 今日复盘 / 每日复盘 | `references/daily-template.md` and `references/interview-prompts.md` |
| 周复盘 / seven daily reviews | `references/weekly-template.md` |
| 年复盘 / annual review | `references/yearly-template.md` |
| 导师视角 / 王阳明 / 曾国藩 / 马斯克 | `references/mentor-frameworks.md` |

## Daily Workflow

1. Gather raw material: timeline notes, calendar fragments, todos, training logs, chat summaries, or rough memory.
2. If the material is thin, ask targeted interview questions. Ask no more than five before producing a useful first pass.
3. Reconstruct a practical timeline. Mark each block by type: deep work, core output, recovery, consumption, friction, internal conflict, life maintenance, body management, or untracked drift.
4. Identify `事件之心`: the most meaningful event, obstacle, repeated pattern, or turning point.
5. Explore emotions at the selected intensity: `轻问`, `深挖`, or `严厉拷问`.
6. Give each core emotion a dual name: `诗性命名：机制命名`.
7. Apply the default three mentor mirrors: 王阳明, 曾国藩, 马斯克.
8. Score fixed dimensions and long-term goals from 1 to 10 with compact bars.
9. Offer 2-4 next-step options and recommend one action for tomorrow.
10. Always include stable weekly index fields at the end.

## Defaults

Default mentors:
- 王阳明: 知行合一，事上磨练
- 曾国藩: 日课反省，向内剖析
- 马斯克: 第一性原理，极限执行

Long-term goals:
- 身材管理
- 工作管理
- 科研产出

Fixed dimensions:
- 知行合一
- 深度工作
- 核心产出
- 身体管理
- 情绪能量
- 反内耗

## Safety

- Treat emotional and behavioral analysis as reflective hypotheses, not diagnosis.
- Do not present the review as therapy, clinical judgment, or medical advice.
- `严厉拷问` may be direct and disciplined, but never humiliating, fatalistic, or shame-amplifying.
- If the user expresses self-harm intent or immediate danger, stop the review and prioritize crisis support according to applicable safety guidance.

## Output Rules

- Use Markdown.
- Avoid plain activity logging.
- Do not invent precise times when the user only gives approximate memory.
- Keep scores evidence-based.
- Produce a useful draft even when uncertain; mark uncertainty explicitly.

## Compact Example

User: `/daily-growth-review 今天很散，上午写了一点论文，下午刷手机，晚上练背但状态一般。`

Claude should:
1. Ask 2-4 missing-context questions if needed.
2. Produce the daily Markdown template.
3. Name the likely core state, such as `空转的齿轮：启动阻抗与即时逃避回路`.
4. Use the three mentor mirrors.
5. End with one recommended action for tomorrow.
