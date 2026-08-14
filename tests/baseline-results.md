# Daily Growth Review v2 Baseline Results

## Evidence boundary

This baseline begins with static inspection of the committed pre-v2 package. It does not claim that a fresh model produced these failures. Fresh-context behavior is tested after the v2 rewrite when the local Codex executable is available.

## Expected RED categories

- Missing progressive profile schema.
- Missing weighted tomorrow board and auditable progress formula.
- Missing evidence-anchored 0–4 score and comparable-situation delta.
- Missing delayed recall-before-answer workflow.
- Missing mobile capture Inbox contract.
- Personalized defaults in public Skill and prompt files.
- Codex and Claude package mismatch after adding v2-only files.
- Missing private path and connector-secret ignore rules.

## Behavioral risks established from current text

| Scenario | Current-text evidence | Risk |
|---|---|---|
| S01 | Public defaults name research output, fitness/work goals, and fixed mentors. | A student can receive irrelevant identity assumptions. |
| S03 | The template offers next actions but no weighted acceptance contract. | A vague large goal can receive a false percentage. |
| S05 | No comparable-situation or missing-baseline field exists. | Day-over-day growth may be invented across unlike events. |
| S07 | Integrations are only described as optional. | A response may fail to distinguish prepared content from a verified write or reminder. |
| S08 | Generated scripts are distinguished from spoken output, but recall is not required before answer display. | Re-reading can be mislabeled as mastery. |

## RED command

```powershell
powershell -ExecutionPolicy Bypass -File tests/run-v2-validation.ps1
```

## Observed static result

- Date: 2026-08-15 Asia/Shanghai.
- Exit code: `1`.
- Failure count: `94`.
- Missing v2 contract files: `12` checks across Codex and Claude distributions.
- Personalized public defaults: `36` findings across Skill, templates, shared method, and DeepSeek prompts.
- Missing workflow/schema/README/privacy requirements: `45` findings.
- Codex/Claude Skill mismatch: `1` finding.

This is the expected RED state: the validator now runs successfully and fails because v2 behavior and contracts are absent.
