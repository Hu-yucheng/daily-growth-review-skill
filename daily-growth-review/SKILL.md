---
name: daily-growth-review
description: Use when turning daily notes, rough timelines, calendar fragments, todos, training logs, or weekly review inputs into structured Markdown self-reviews, growth reviews, emotion naming, mentor-guided reflection, score tracking, 周复盘, or 年复盘 drafts.
---

# Daily Growth Review

## Overview

Create Markdown-first growth reviews that turn scattered life material into a timeline, an event of the day, emotional naming, mentor mirrors, scores, and next actions. Prioritize growth patterns over diary-style activity logging.

## Choose the Review Mode

| User asks for | Action |
|---|---|
| 今日复盘, 每日复盘, review my day | Use `references/daily-template.md` and `references/interview-prompts.md`. |
| 周复盘, this week, 7 days of reviews | Use `references/weekly-template.md`; ask for or read the seven daily reviews. |
| 年复盘, annual review | Use `references/yearly-template.md` as a skeleton unless the user provides enough yearly material. |
| 导师视角, 王阳明, 曾国藩, 马斯克, 费曼, 芒格 | Use `references/mentor-frameworks.md`. |
| Notion or Word export | Generate Markdown first. Only use external integrations if the user explicitly asks and the tools are available. |

## Daily Review Workflow

1. Gather raw material: timeline notes, calendar fragments, todos, training logs, chat summaries, or rough memory.
2. If material is thin, ask targeted interview questions. Do not ask more than five questions before producing a useful first pass.
3. Reconstruct a practical timeline. Mark each block by type: deep work, core output, recovery, consumption, friction, internal conflict, life maintenance, body management, or untracked drift.
4. Find the `事件之心`: the most meaningful event, obstacle, repeated pattern, or turning point. This is not necessarily the happiest or most successful event.
5. Explore emotions at the selected intensity: `轻问`, `深挖`, or `严厉拷问`.
6. Give each core emotion a dual name: `诗性命名：机制命名`.
7. Apply the default three mentor mirrors: 王阳明, 曾国藩, 马斯克. Add 费曼 or 查理·芒格 only when useful or requested.
8. Score fixed dimensions and long-term goals from 1 to 10 with compact bars.
9. Offer 2-4 next-step options and recommend one action for tomorrow.
10. Always include stable weekly index fields at the end.

## Default Configuration

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

## Safety Boundaries

- Treat emotional and behavioral analysis as reflective hypotheses, not diagnosis.
- Do not present the review as therapy, clinical judgment, or medical advice.
- `严厉拷问` may be direct and disciplined, but never humiliating, fatalistic, or shame-amplifying.
- If the user expresses self-harm intent or immediate danger, stop the review and prioritize crisis support according to applicable safety guidance.

## References

- `references/daily-template.md`: daily Markdown structure and field rules.
- `references/weekly-template.md`: weekly synthesis structure.
- `references/yearly-template.md`: annual review skeleton.
- `references/mentor-frameworks.md`: mentor lenses and critique rules.
- `references/interview-prompts.md`: question banks for 轻问, 深挖, and 严厉拷问.

## Compact Example

User: `今天很散，上午写了一点论文，下午刷手机，晚上练背但状态一般，帮我复盘。`

Response pattern:
1. Ask 2-4 missing-context questions if needed.
2. Produce the daily template.
3. Name the likely core state, for example `空转的齿轮：启动阻抗与即时逃避回路`.
4. Use the three mentor mirrors.
5. End with one recommended next action for tomorrow.

## Common Mistakes

- Do not summarize the day as a plain diary.
- Do not overfocus on productivity while ignoring energy, emotion, and body state.
- Do not invent precise times when the user only provides approximate memory.
- Do not make every score motivationally high; explain the evidence.
- Do not ask endless questions. Produce a useful draft and mark uncertain parts.
