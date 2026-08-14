# Adaptive Daily Review Template

Use this template for a full daily review. Omit empty optional commentary, but keep the machine-readable fields stable.

````markdown
# Daily Growth Review — YYYY-MM-DD

## 0. Context Check

- Roles or life stage used:
- Current-cycle goals used:
- Constraints and resources used:
- Feedback style and boundaries:
- Missing context that could change the review:

## 1. Previous Commitment Audit

| Prior outcome | Status | Required evidence | Evidence found | Main cause |
|---|---|---|---|---|

Valid status: `completed / partial / missed / unknown / blocked`.

## 2. Today in Evidence

| Approximate time | Event or action | Evidence | Energy | Confidence |
|---|---|---|---|---|

### Mainline

### High-value patches

### Uncertainties

## 3. Event Heart and Emotional Mechanism

**Event heart**:

**Why this matters beyond a diary entry**:

**Observed behavior**:

**Reflective hypothesis**:

**Recurrence count and structural response**:

## 4. Comparable Growth

| Current situation | Comparison basis | Evidence of change | comparison_delta |
|---|---|---|---:|

Use `baseline_missing` when no similar prior event exists.

## 5. Adaptive Scores

| Profile-relevant dimension | evidence_score 0–4 | Behavioral evidence | seven_day_trend |
|---|---:|---|---|

Do not create a universal total across unrelated dimensions.

## 6. Tomorrow Execution Board

**primary_outcome**:

**definition_of_done**:

**estimated_effort**:

**scheduled_block**:

**dependencies**:

| Subtask | Weight | Completion evidence | Partial-credit rule |
|---|---:|---|---|

Weights must total 100.

- **minimum_version**:
- **first_physical_action**:
- **if_then_plan**:
- **support_tasks**: maximum two
- **progress_percent**: 0

## 7. Delayed Recall Queue

| recall_id | Learning target | Recall questions | Due dates | Verified status |
|---|---|---|---|---|

Ask recall before showing the prior answer. Leave this section empty when no learning item deserves later retrieval.

## 8. Weekly Index Fields

```yaml
date: YYYY-MM-DD
profile_version:
profile_context_used: []
profile_uncertainties: []
event_heart:
commitment_audit:
  status:
  evidence: []
  cause:
pain_recurrence:
  pattern:
  count:
  structural_response:
comparison:
  comparison_basis:
  comparison_date:
  comparison_delta:
  evidence_of_change: []
scores: []
primary_outcome:
definition_of_done:
subtasks: []
support_tasks: []
progress_percent: 0
recall_queue: []
captures_used: []
connector_actions:
  attempted: []
  verified: []
uncertainties: []
```
````

## Field rules

- Use approximate periods when exact times are unknown.
- Evidence and interpretation must remain distinguishable.
- Scores require cited behavior and may be low.
- A first-time situation creates a baseline; it does not prove improvement.
- Tomorrow's subtask weights must total 100 before output.
- Connector actions remain empty unless a tool call succeeded and was verified.
