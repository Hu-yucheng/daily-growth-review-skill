# Evidence Scoring and Comparable Growth

Use this file when scoring a day, comparing growth, or building weekly trends.

## Choose adaptive dimensions

Activate only 4–6 dimensions that match the user's current profile and goals. Candidate dimensions include commitment closure, focused execution, body and energy, emotional regulation, learning transfer, and relationship responsibility. Rename or replace them when the profile requires different dimensions.

Do not create one universal total score across unrelated life domains.

## Evidence score

Store each dimension as `evidence_score: 0..4` with cited behavioral evidence.

| Score | Behavioral anchor |
|---:|---|
| 0 | No supporting evidence, or clear harmful regression. |
| 1 | The user recognized the issue but did not take an effective action. |
| 2 | Meaningful partial action exists, but the definition of done was not met or heavy prompting was required. |
| 3 | The user independently met the pre-defined completion standard. |
| 4 | The standard was met and evidence shows improved quality, independence, transfer, efficiency, or sustainability. |

Effort and insight may be recorded, but neither closes a commitment by itself.

## Comparable growth

Compare an event with the last similar situation, not automatically with yesterday.

```yaml
comparison_basis:
comparison_date:
comparison_delta: baseline_missing
evidence_of_change: []
```

Valid `comparison_delta` values:

- `-2`: clear regression in a comparable situation;
- `-1`: small regression;
- `0`: no evidenced change;
- `+1`: one evidenced improvement;
- `+2`: improvement is stable, transferable, or holds under harder conditions;
- `baseline_missing`: no sufficiently similar prior event exists.

When the baseline is missing, record today's event as the first baseline. Do not invent improvement.

## Seven-day trend

For repeated, comparable dimensions only, store:

```yaml
seven_day_trend: rising | stable | falling | insufficient_data
trend_evidence: []
```

Use `insufficient_data` when observations are sparse, definitions changed, or days are not comparable. Never turn missing data into an average score.

## Output contract

```yaml
scores:
  - dimension:
    evidence_score:
    evidence: []
    comparison_basis:
    comparison_delta:
    evidence_of_change: []
    seven_day_trend:
```
