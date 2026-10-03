# 40_images directory structure

This file explains the role and layout of the `40_images/` directory, which stores visual assets, CAD references, generated outputs, and image-related evidence.

## Purpose

`40_images/` is where the repo keeps:

- product image references
- CAD-derived visuals
- output folders for verified vs. unverified work
- slots data and QA ledger
- reference material used for design review

## Directory map

```text
40_images/
├── QA_ledger.md
├── README.md
├── slots.csv
├── out/
│   ├── .gitkeep
│   ├── README.md
│   ├── CAD_Verified/
│   └── Hypothesis_Not_ProductTruth/
├── refs/
│   └── .gitkeep
├── video/
│   ├── .ffmpeg_path
│   └── .gitkeep
```

## Key subdirectories

### `out/`
Used for generated or staged output images.

- `CAD_Verified/` — geometry and product-truth validated assets
- `Hypothesis_Not_ProductTruth/` — speculative or non-final outputs not to be treated as truth
- `README.md` — notes for how these outputs should be used

### `refs/`
Reference images, screenshots, and source material. These are treated as input or evidence, not final asset output.

### `video/`
Video-related files and local FFmpeg configuration metadata.

## Important file notes

- `QA_ledger.md` — quality and verification log for visual assets
- `slots.csv` — data used for slot or layout tracking
- `README.md` — explains the intended use of reference vs. output material

## Practical rule

This folder is not a generic image dump. It is organized around validation state:

- `CAD_Verified/` = trusted, product-truth aligned visuals
- `Hypothesis_Not_ProductTruth/` = exploratory, non-authoritative assets

When in doubt, check the folder README and the image QA ledger before using an asset.
