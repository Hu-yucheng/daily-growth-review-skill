# Delayed Recall and Upgrade Cards

Use this file when a review contains a concept, insight, decision rule, emotional lesson, or skill that should be retained and transferred.

## Core rule

Test recall before showing the prior answer. AI-generated explanations, saved prompts, and unspoken scripts are preparation, not mastery evidence.

## Recall queue

```yaml
recall_id: R-YYYYMMDD-01
source_date: YYYY-MM-DD
learning_target:
recall_questions: []
due_dates:
  - YYYY-MM-DD
status: not_started
gap_notes: []
transfer_cue:
```

Default to one day-1 check. Add day 3, 7, or 30 only when the item is important enough to justify repeated review.

## Review sequence

1. Ask 1–3 recall or transfer questions before the answer is displayed.
2. Wait for the user's reconstruction.
3. Compare it with the source, identifying accurate parts, gaps, and distortions.
4. Let the user restate the weak point in plain language.
5. Record only the highest verified status reached.

Valid statuses:

- `not_started`
- `recalled`
- `spoken`
- `recorded`
- `taught`
- `transferred`

Do not upgrade a status from intention alone.

## Upgrade card

```yaml
upgrade_card:
  prior_context:
  old_response:
  new_response:
  why_it_worked:
  evidence:
  next_transfer_cue:
```

An upgrade card requires a real comparison. If there is no old response or comparable prior context, record a first baseline instead of claiming improvement.

## Reminder boundary

Create a reminder only when a scheduling capability is available, the user explicitly agrees, and the time and recurrence are known. If local files are required, explain the device and app availability conditions. Otherwise return a copyable recall queue without claiming that a reminder was created.
