# Publishing Frost

## GitHub release

The project is published at https://github.com/wnanbei/dsh-theme-frost. The skin directory is self-contained and can be copied directly into the DSH user skins directory.

## Community submission

Submit Frost to https://github.com/zhu1090093659/dsh-skins using the commit published in this repository. Do not submit only from an unpushed local working tree.

Suggested commit: `feat(skins): add frost`.

Suggested title: `feat(skins): add frost`.

### Submission contents

Copy the following into the dsh-skins contribution:

- `skins/frost/`: the complete skin directory.
- `evidence/frost-light.jpg`: the byte-identical copy of the final light preview.
- `evidence/frost-dark.jpg`: the byte-identical copy of the final dark preview.

Run the dsh-skins checks `pnpm skin-center:check` and `pnpm test` in the contribution checkout.

### PR description template

```markdown
## What

Add Frost, a refined white and graphite theme with complete light and dark palettes. It is CSS-only, uses Skin Center semantic selectors, and contains no third-party artwork or fonts.

## Skin submission checklist

- [x] `skins/frost/skin.json` declares the v2 contract and every referenced file exists
- [x] `README.md` and `README.zh.md` are present
- [ ] `pnpm skin-center:check` passes in the contribution checkout
- [ ] `pnpm test` passes in the contribution checkout
- [x] The original CSS and documentation are MIT licensed; no third-party assets are included
- [x] The skin depicts no characters or prohibited works

## Evidence

The two images below are also committed verbatim as `evidence/frost-light.jpg` and `evidence/frost-dark.jpg`.

![Frost light theme](PASTE_THE_LIGHT_IMAGE_URL_AFTER_GITHUB_UPLOAD)

![Frost dark theme](PASTE_THE_DARK_IMAGE_URL_AFTER_GITHUB_UPLOAD)

## Verification

In the standalone repository:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate.ps1
```

Result: `frost 0.1.0 — PASS`.

Light and dark previews were rendered at 1440 × 900 from the community official-facade snapshot with the final skin styles. The author also accepted the installed theme in DSH, including the compact sidebar typography.

In the dsh-skins contribution checkout, paste the results of:

```sh
pnpm skin-center:check
pnpm test
```
```

The image placeholders must be replaced with GitHub-hosted uploads. Their downloaded bytes must exactly match the two evidence files; preview regeneration, JPEG recompression, or editor re-saving after upload invalidates the match.
