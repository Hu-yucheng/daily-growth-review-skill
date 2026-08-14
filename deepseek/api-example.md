# DeepSeek API Example

DeepSeek's API supports OpenAI-compatible and Anthropic-compatible formats. The example below uses the OpenAI SDK style with `base_url=https://api.deepseek.com`.

Official docs: https://api-docs.deepseek.com/

## Python

```python
import os
from openai import OpenAI

SYSTEM_PROMPT = open("deepseek/system-prompt.txt", "r", encoding="utf-8").read()

client = OpenAI(
    api_key=os.environ["DEEPSEEK_API_KEY"],
    base_url="https://api.deepseek.com",
)

response = client.chat.completions.create(
    model="deepseek-v4-pro",
    messages=[
        {"role": "system", "content": SYSTEM_PROMPT},
        {
            "role": "user",
            "content": "Help me review today without assuming my background. Audit prior evidence, then build one weighted primary outcome for tomorrow.",
        },
    ],
    stream=False,
    reasoning_effort="high",
    extra_body={"thinking": {"type": "enabled"}},
)

print(response.choices[0].message.content)
```

## Notes

- Do not paste API keys into chat.
- Store `DEEPSEEK_API_KEY` as an environment variable.
- If you use a low-cost or non-thinking model, keep the prompt shorter and ask for one review at a time.
