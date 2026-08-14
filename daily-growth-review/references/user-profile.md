# Adaptive User Profile

Read this file when no profile exists, the user's current cycle has changed, or a recommendation depends on missing context.

## Core rule

Build the profile progressively. Ask one question at a time, reuse facts the user already supplied, and never block a useful first review on a complete intake form.

Collect only context that can change the review, score, or next action. The user may skip any optional question, correct any field, or ask to delete the profile.

## First-use essentials

Gather these four areas, in order, only when still missing:

1. **Current roles or life stage**: allow multiple roles and use broad categories rather than requiring an employer or school name.
2. **One to three current goals**: ask what meaningful change the user wants in the current cycle.
3. **Constraints and resources**: time, energy, environment, responsibilities, tools, and support that affect action.
4. **Feedback preference and boundaries**: gentle, direct, or strict; topics the user does not want analyzed; accessibility needs.

If the user asks for a review before all four are known, use available context, mark uncertainty, and ask only the single next question with the highest decision value.

## Optional context

Ask only when it can materially change the recommendation, and explain why:

- age range or developmental stage;
- field of study or work responsibilities, without requiring an exact institution;
- family or caregiving effects on time, energy, emotion, or decisions, without requesting identities or full family history;
- health or accessibility constraints, without diagnosis;
- financial, housing, cultural, religious, or relationship context.

Do not infer sensitive details from indirect clues.

## Storage contract

Real profile values belong in a private local artifact, not in the public Skill repository.

```yaml
profile_version: 2
updated_at: YYYY-MM-DD
stable:
  roles: []
  values: []
  feedback_style: direct
  analysis_boundaries: []
current_cycle:
  horizon: 2-12 weeks
  goals: []
  constraints: []
  resources: []
  support_system: []
  active_score_dimensions: []
optional_context:
  age_range:
  domain:
  caregiving_effects:
  accessibility_needs:
  other:
uncertainties: []
```

## Refresh rules

- Keep `stable` fields until the user changes them.
- Refresh `current_cycle` after a major role, goal, schedule, or constraint change.
- Do not mechanically re-interview on every review or on a fixed calendar date.
- Show the relevant profile fields when they affect a recommendation.
- When the user asks to delete profile data, identify the exact private artifact and remove it only with appropriate authorization.
