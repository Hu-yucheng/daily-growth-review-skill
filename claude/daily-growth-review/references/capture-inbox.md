# Capture Inbox and Connector Boundaries

Use this file for phone fragments, messages, voice notes, links, screenshots, short-video shares, and other material collected before the daily review.

## Capture contract

```yaml
capture_id: I-YYYYMMDD-HHMMSS
captured_at: YYYY-MM-DDTHH:MM:SSZ
source:
type: thought | task | link | audio | event | learning
raw_content:
context:
confidence: high | medium | low | unknown
processed: false
```

Keep `raw_content` unchanged. Put interpretation in a derived knowledge, question, or action card so the original evidence remains available.

## Mainline and patch rule

- The user's own summary is the mainline.
- Messages, automated transcripts, browsing history, and noisy recordings are patches.
- Rank patches by confidence and use them to fill gaps, add evidence, or flag contradictions.
- Do not let a long noisy transcript choose the event heart over the user's direct account.

## Link handling

1. Preserve the source URL and capture time.
2. Record whether the content was actually opened and read.
3. If the page or video is unavailable, do not infer claims from a title or link slug.
4. Ask for a transcript, screenshots, captions, or the user's key points.
5. Separate source claims, the user's interpretation, and proposed applications.

For Douyin and similar short-video platforms, a shared link does not guarantee access to full video content or captions.

## Derived cards

Process useful captures into one of:

- knowledge card: source, claim, evidence, boundary, explanation;
- question card: uncertainty, why it matters, next verification;
- action card: cue, behavior, evidence, review date;
- entertainment: explicitly marked, with no false learning claim.

Daily review should use only captures relevant to that day's mainline. Do not dump the entire Inbox into the review.

## Connector boundaries

- A Skill cannot monitor personal WeChat by itself.
- An outgoing group webhook does not prove incoming-message access.
- Notion, email, enterprise messaging, and scheduling require available tools, credentials, permission, and a successful call.
- Verify writes by reading the destination back when the connector supports it.
- If a connector is unavailable, return copyable Markdown or YAML and state that no external write occurred.
