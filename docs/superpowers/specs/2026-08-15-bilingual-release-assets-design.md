# Daily Growth Review Bilingual Release Assets Design

**Date:** 2026-08-15

## Goal

Publish five approved v2 promotional infographics in paired Simplified Chinese and English, add bilingual repository documentation, and preserve the previous public implementation as a stable v1 release without rewriting Git history.

## Version model

- `main` remains the latest stable line.
- Annotated tag `v1.0.0` points to commit `ffb70e7`, the last pre-v2 public implementation.
- Annotated tag `v2.0.0` points to the final bilingual-assets release commit.
- Historical source is accessed through Git tags instead of duplicating an old source tree inside `main`.

## Asset model

Each approved Chinese source image is copied byte-for-byte into `assets/v2/zh/`. A localized English counterpart with the same visual system and narrative role is stored in `assets/v2/en/`.

The five paired topics are:

1. overview and evidence-to-action workflow;
2. adaptive context and privacy boundaries;
3. evidence-based progress scoring;
4. anonymized verified-completion case;
5. capture, delayed recall, second brain, and action verification.

## Documentation model

- `README.md` is the English entry point and embeds the English image set.
- `README.zh-CN.md` is the Simplified Chinese entry point and embeds the Chinese image set.
- Each README links to the other language and to the version history.
- `docs/version-history.md` explains the stable tags and the non-destructive upgrade policy.

## Privacy and content boundaries

The public case remains anonymized. No real person, employer, institution, Notion identifier, private transcript, webhook, token, or personal profile is added to the repository.

## Verification

The release validator checks that every paired PNG exists, is valid, uses the 1672 x 941 target canvas (with a one-pixel width tolerance for the image generator), is referenced by the correct language README, and that every local Markdown link resolves. Existing Skill validation must continue to pass. After push, the remote branch and both tags are read back.
