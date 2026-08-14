---
name: daily-growth-review
description: Use when daily or weekly reflection feels generic, repetitive, disconnected from tomorrow, weakly evidenced, difficult to compare over time, or fragmented across notes, tasks, voice logs, links, and learning inputs.
---

# Daily Growth Review

## Overview

Turn reflection into adaptive, evidence-checked behavior. A complete review understands the user's current context, audits prior action, compares only comparable situations, builds one auditable next outcome, and preserves important learning for delayed recall.

Public instructions remain background-neutral. Real profile values, journals, connector credentials, and private knowledge belong outside the public Skill repository.

## Route the Request

| Request | Load |
|---|---|
| First use, changed life context, personalization | `references/user-profile.md` and `references/interview-prompts.md` |
| Daily review | `references/daily-template.md` and `references/reflection-action-loop.md` |
| Tomorrow plan or todo breakdown | `references/next-action-board.md` |
| Score, progress, improvement, comparison | `references/scoring-and-growth.md` |
| Learning, Feynman, reminder, spaced review | `references/learning-recall.md` |
| Phone fragments, audio, links, short videos, second brain | `references/capture-inbox.md` |
| Weekly review | `references/weekly-template.md` |
| Annual or stage review | `references/yearly-template.md` |
| Reflection lens or user-chosen mentor | `references/mentor-frameworks.md` |

Load only the references required for the request. For a full daily review, load the profile, daily template, action loop, next-action board, scoring, and learning recall references.

## First-Use Profile

If no private profile exists, build it progressively:

1. Reuse context already supplied.
2. Ask the single missing question with the highest decision value.
3. Cover four essentials over time: current roles, one to three current goals, constraints and resources, and feedback preference with analysis boundaries.
4. Ask age, family, health, finances, institution, culture, or relationships only when the answer can materially change advice; explain why and allow the user to skip.
5. Produce a useful review even when the profile is incomplete. Mark uncertainty instead of running a long intake.

Never write real profile values into the public Skill folder.

## Daily Workflow

1. **Load context.** Read the relevant private profile and recent reviews when available.
2. **Audit before interpretation.** Validate the previous primary outcome using only `completed / partial / missed / unknown / blocked`; never infer completion without evidence.
3. **Build the mainline.** Treat the user's direct summary as authoritative. Use transcripts, messages, links, and activity logs as confidence-ranked patches.
4. **Find the event heart.** Select the event, obstacle, decision, or repeated loop with the greatest growth relevance.
5. **Name emotion carefully.** Tie emotional and behavioral interpretations to evidence and label them as reflective hypotheses, not diagnoses.
6. **Apply adaptive lenses.** Use action alignment, system improvement, sustainable energy, and learning transfer. Use a named mentor only when the profile or current request selects one.
7. **Check recurrence.** First occurrence gets one experiment; second compares the experiment; third requires structural change instead of more explanation.
8. **Compare fairly.** Use the last similar situation. If none exists, record `baseline_missing` and establish today's first baseline.
9. **Score evidence.** Activate only four to six profile-relevant dimensions. Use the 0–4 evidence anchors and `-2..+2` comparison delta; use `insufficient_data` when a seven-day trend is not defensible.
10. **Plan tomorrow.** Create one primary outcome, 3–5 weighted subtasks totaling 100, and at most two support tasks. Progress is verified weight, not effort or confidence.
11. **Queue learning.** Ask recall before showing the old answer. Generated text is not mastery evidence.
12. **Emit stable fields.** End with the machine-readable schema from the daily template.

## Action Integrity Rules

- Do not let a new insight replace an unverified prior commitment.
- Do not reward busyness, effort, or emotional intensity as completed output.
- Do not compare unrelated days to manufacture progress.
- Do not add many goals when the primary outcome is unclear; reduce scope.
- Do not treat an external dependency as personal failure; use `blocked` with evidence.
- Do not claim an external write, reminder, message receipt, or link extraction unless the connector ran successfully and the destination or content was verified.
- Do not infer inaccessible video content from a URL or title.

## Mainline Plus Patch Protocol

Use this when the user supplies both a self-summary and noisy fragments:

1. Extract the mainline: key work, event heart, felt problem, body or energy state, and stated next priority.
2. Label each patch `high / medium / low / unknown` confidence.
3. Use patches only for missing evidence, forgotten details, repeated wording, or contradictions.
4. If a patch conflicts with the direct summary, preserve both and mark uncertainty unless evidence clearly resolves it.
5. Never turn an all-day transcript into the primary diary by default.

## Connector Boundary

A Skill is a method, not a message server. Personal WeChat monitoring, enterprise messaging, Notion writes, scheduled reminders, email ingestion, and short-video extraction require real connectors, permissions, and successful tool calls. When unavailable, return copyable Markdown or YAML and state that no external action occurred.

## Safety

- Treat emotional analysis as a reflective hypothesis, not therapy, diagnosis, or medical judgment.
- Direct or strict mode may challenge behavior and cost, never identity or human worth.
- Ask the minimum sensitive context needed and respect skip/delete requests.
- If the user expresses self-harm intent or immediate danger, stop ordinary review and prioritize real-world emergency or crisis support.

## Compact Example

User: `I had classes, missed a planned practice session, helped at home, and want a realistic plan for tomorrow.`

Response pattern:

1. Use supplied role and constraint context; ask at most one high-value missing profile question.
2. Audit the missed practice without shame.
3. Separate today's evidence from interpretation.
4. Compare with a similar prior situation or record `baseline_missing`.
5. Build one weighted primary outcome and at most two support tasks.
6. Queue one delayed recall item only if meaningful learning occurred.

## Common Mistakes

- Running a population survey before helping with today's review.
- Reintroducing a profession, life goal, score dimension, or mentor the user never selected.
- Giving a percentage without weighted acceptance evidence.
- Calling a first event “improvement” without a comparison basis.
- Showing the prior explanation before testing recall.
- Dumping every captured fragment into the daily review.
- Saying “saved,” “scheduled,” or “sent” when only text was prepared.
