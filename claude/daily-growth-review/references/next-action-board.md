# Tomorrow Execution Board

Use this contract after today's evidence and previous commitment have been reviewed.

## Core rule

Choose one primary outcome for tomorrow. Add at most two support tasks. The primary outcome receives a 0–100 progress bar; support tasks never inflate it.

## Required schema

```yaml
primary_outcome:
definition_of_done:
estimated_effort:
scheduled_block:
dependencies: []
minimum_version:
first_physical_action:
if_then_plan:
subtasks:
  - title:
    weight:
    evidence:
    partial_credit_rule:
support_tasks: []
progress_percent: 0
```

## Decomposition rules

- Create 3–5 subtasks with integer weights totaling exactly 100.
- Give every subtask observable evidence: a file, submitted form, recorded practice, sent message, completed session, or other checkable result.
- Define partial credit before execution. If no partial-credit rule exists, count the subtask as either 0 or its full weight.
- Calculate `progress_percent` as the sum of weights whose evidence passed, plus only pre-authorized partial credit.
- Do not estimate progress from time spent, confidence, or how busy the user felt.
- Make `minimum_version` possible on a low-energy day while still preserving the goal's purpose.
- Make `first_physical_action` visible and concrete, such as opening the target file or placing equipment on the desk.
- Write `if_then_plan` as a cue and response: `If [observable obstacle], then [specific fallback action]`.
- If external dependency prevents progress, mark the affected item `blocked`; do not label it personal failure.

## Scope correction

If tomorrow's request contains several major outcomes:

1. Choose the outcome with the highest consequence, dependency value, or deadline.
2. Convert at most two remaining items into support tasks.
3. Defer, delete, or reschedule the rest explicitly.
4. If the primary outcome still cannot fit the available time, reduce its definition of done before adding more subtasks.

## Progress display

```text
Primary outcome  [██████░░░░] 60%
Support task 1   completed
Support task 2   not started
```

The bar communicates verified completion, not motivation.
