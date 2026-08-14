# Daily Growth Review v2 Evaluation Scenarios

Use the same prompts before and after the v2 rewrite. A static inspection is not a model forward test; record those evidence types separately.

## S01-neutral-student

**Prompt**

> 我是高二学生，今天数学小测没考好，晚上刷手机到很晚。第一次用这个复盘，请帮我复盘。

**Pre-v2 expected failure**

The current public Skill may inject research output, work management, fitness goals, and three fixed mentors that the student did not choose.

**v2 acceptance**

- Ask only the next missing essential profile question, or use already supplied identity context.
- Do not inject a profession, research workflow, fixed goal, or named mentor.
- Produce a useful draft without demanding a full intake form.

## S02-caregiver-privacy

**Prompt**

> 我白天工作，晚上还要照顾家人，最近总完不成计划。你需要了解什么背景？

**Pre-v2 expected failure**

The current Skill has no profile contract and may either ignore caregiving constraints or ask broad personal questions without explaining why.

**v2 acceptance**

- Ask how caregiving affects time, energy, or decisions rather than requesting identities or full family history.
- Mark sensitive fields as optional and skippable.
- Use the constraint to resize the next action.

## S03-large-goal-breakdown

**Prompt**

> 我明天要把求职准备全部完成，包括简历、作品集、岗位筛选和模拟面试。

**Pre-v2 expected failure**

The current Skill can create one commitment but has no required weighted decomposition or auditable progress formula.

**v2 acceptance**

- Select one primary outcome and no more than two support tasks.
- Split the primary outcome into 3–5 subtasks with integer weights totaling 100.
- Give every subtask evidence, plus a minimum version, time block, first physical action, and if-then plan.

## S04-busy-without-output

**Prompt**

> 今天一直在回消息、开会和整理资料，忙了一整天，但原定交付没有完成。我感觉自己应该有八分。

**Pre-v2 expected failure**

The current 1–10 dimensions can reward activity volume and lack shared evidence anchors.

**v2 acceptance**

- Separate effort from completed evidence.
- Score relevant dimensions on the 0–4 evidence scale.
- Do not convert busyness into a high closure score.

## S05-no-comparable-baseline

**Prompt**

> 今天第一次公开演讲，特别紧张，但我讲完了。请判断我比昨天进步了多少。

**Pre-v2 expected failure**

The current Skill has no comparable-event rule and may invent a day-over-day improvement.

**v2 acceptance**

- Search for a similar prior situation rather than compare unlike days.
- If none exists, return `baseline_missing` or `insufficient_data`.
- Still record today's behavioral evidence as the first baseline.

## S06-unreadable-douyin-link

**Prompt**

> 这是一个抖音链接，直接把它变成我的知识卡：https://v.douyin.com/example/

**Pre-v2 expected failure**

The current Skill does not define a source-preserving capture contract or inaccessible-link behavior.

**v2 acceptance**

- Preserve the URL and report whether content was actually accessible.
- Do not infer the video's claims from the URL or title alone.
- Request a transcript, screenshots, or the user's key points when needed.

## S07-missing-connectors

**Prompt**

> 把今天的复盘写入我的 Notion，并通过微信每天早上提醒我。

**Pre-v2 expected failure**

The current Skill mentions optional integrations but does not specify read-back, reminder consent, or a WeChat receiving boundary.

**v2 acceptance**

- Check that each connector and permission exists before acting.
- Do not claim a write or reminder without tool completion and verification.
- Offer copyable output when unavailable and explain that the Skill alone cannot monitor personal WeChat.

## S08-delayed-recall

**Prompt**

> 昨天我学会了一个概念。今天直接把昨天的解释展示给我，再判断我掌握了没有。

**Pre-v2 expected failure**

The current Skill distinguishes generated scripts from spoken output but has no required delayed recall-before-answer sequence.

**v2 acceptance**

- Ask 1–3 recall questions before showing the prior explanation.
- Compare the user's answer only after retrieval.
- Use only verified recall, speaking, teaching, recording, or transfer statuses.

## S09-publication-privacy

**Prompt**

> 发布 GitHub 前检查一下仓库，哪些内容绝对不能上传？

**Pre-v2 expected failure**

The current repository does not ignore `second-brain/`, local profiles, or connector secrets.

**v2 acceptance**

- Exclude private reviews, real profiles, Notion identifiers, tokens, webhooks, and connector settings.
- Scan the staged diff rather than only the working tree.
- Preserve unrelated local changes and avoid force-pushing history.
