# Daily Growth Review v2

> A background-neutral reflection Skill that turns evidence into one realistic next outcome.

`daily-growth-review` works with **Codex, Claude Code, and DeepSeek**. It does not assume that the user is a student, researcher, employee, parent, athlete, or any other fixed identity. It progressively learns only the context that changes the review, then keeps real profile data private.

## What v2 changes

- **Adaptive profile**: current roles, one to three goals, constraints/resources, and feedback boundaries are gathered one question at a time.
- **Evidence before scores**: active dimensions use a 0–4 behavioral anchor rather than a motivational total.
- **Fair comparison**: growth is compared with the last similar situation, not automatically with yesterday.
- **One primary outcome**: tomorrow's main result is split into 3–5 weighted subtasks totaling 100.
- **Verified progress**: `progress_percent` is the sum of accepted subtask weights, not time spent or confidence.
- **Delayed recall**: important learning is retrieved before the prior answer is shown.
- **Capture Inbox**: phone fragments, audio, messages, and links share one source-preserving schema.
- **Honest connectors**: Notion, reminders, WeChat, email, and other integrations are used only when real tools and permissions exist.

## Public core and private profile

The repository contains schemas and method instructions only.

Keep these outside Git:

- real profiles and personal background;
- daily reviews and second-brain content;
- Notion database or page identifiers;
- tokens, webhook URLs, and connector configuration;
- private transcripts, relationship notes, and health context.

The public Skill asks four essential areas progressively:

1. current roles or life stage;
2. one to three goals for the current cycle;
3. constraints and available resources;
4. feedback preference and analysis boundaries.

Age, family, health, finances, institution, culture, and relationships are optional. They are asked only when relevant, with a reason and a skip option.

## Tomorrow progress example

```yaml
primary_outcome: Submit a complete application draft
definition_of_done: One reviewable PDF exists and required fields are complete
subtasks:
  - title: Confirm requirements
    weight: 15
    evidence: Saved checklist
  - title: Draft core content
    weight: 40
    evidence: Complete editable draft
  - title: Add supporting material
    weight: 25
    evidence: Required files attached
  - title: Review and export
    weight: 20
    evidence: Reviewable PDF
support_tasks:
  - Thirty-minute recovery session
progress_percent: 0
```

Only accepted evidence raises the progress bar. Support tasks do not inflate the primary outcome.

## Evidence and growth model

### evidence_score 0–4

| Score | Meaning |
|---:|---|
| 0 | No evidence or clear harmful regression |
| 1 | Recognition without effective action |
| 2 | Meaningful partial action, not yet complete |
| 3 | Independently met the definition of done |
| 4 | Met it with improved quality, independence, transfer, efficiency, or sustainability |

### comparison_delta -2..+2

Use the last similar situation. If none exists, store `baseline_missing` and treat today as the first baseline. Seven-day trend values are `rising`, `stable`, `falling`, and `insufficient_data`.

## Delayed recall

Generated explanations are not mastery. For an important learning item, v2 asks 1–3 recall questions before revealing the prior answer, compares the reconstruction with the source, and records only verified states such as recalled, spoken, recorded, taught, or transferred.

## Capture Inbox

```yaml
capture_id:
captured_at:
source:
type: thought | task | link | audio | event | learning
raw_content:
context:
confidence: high | medium | low | unknown
processed: false
```

The user's direct summary remains the mainline. Automated transcripts, links, and logs are confidence-ranked patches.

## WeChat, Douyin, Notion, and reminders

- A Skill cannot monitor personal **WeChat** by itself. Incoming messages require a supported official account, enterprise application, server, permissions, and connector implementation.
- A group webhook that sends messages does not automatically receive user messages.
- A shared **Douyin** link does not guarantee access to the video or captions. When content cannot be read, v2 preserves the URL and requests a transcript, captions, screenshots, or user notes.
- A **Notion** write is complete only after the tool succeeds and the destination is read back when supported.
- A reminder is created only when a scheduling capability exists and the user approves its time and recurrence.

When a connector is unavailable, the Skill returns copyable Markdown or YAML and states that no external action occurred.

## Install

### Codex

```powershell
Copy-Item -Recurse -Force .\daily-growth-review "$env:USERPROFILE\.codex\skills\daily-growth-review"
```

### Claude Code

```powershell
Copy-Item -Recurse -Force .\claude\daily-growth-review "$env:USERPROFILE\.claude\skills\daily-growth-review"
```

### DeepSeek

Use `deepseek/system-prompt.md` for a readable prompt or `deepseek/system-prompt.txt` for API loading. Neutral examples are in `deepseek/user-prompts.md`.

## Use

```text
$daily-growth-review This is my first review. Use what I already told you, ask only the next essential context question, and give me a useful draft.
```

```text
$daily-growth-review Audit yesterday, compare today only with a similar situation, and build one weighted primary outcome for tomorrow.
```

```text
$daily-growth-review Test my recall from yesterday before showing me the old explanation.
```

## Package structure

```text
daily-growth-review/           Codex Skill
  SKILL.md
  agents/openai.yaml
  references/
claude/daily-growth-review/    Claude mirror
deepseek/                      Prompt pack and API example
shared/core-method.md          Platform-neutral contract
tests/                         RED baseline, validator, and forward-test evidence
```

## v1 migration

v2 removes fixed professions, named mentors, life goals, and score dimensions from public defaults. If you want a previous personal setup, put it in a private profile and select its custom lenses explicitly. Do not commit that profile.

## License

MIT
