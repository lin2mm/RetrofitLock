# Repository structure index

This file is the repo-level directory index for quick navigation and context.

## Summary

- Repository: `lin2mm/RetrofitLock`
- Primary language composition:
  - Shell: 85%
  - Python: 15%
- Repository structure is organized by operational phase and asset type.

## Top-level tree

```text
RetrofitLock/
├── .gitignore
├── README.md
│
├── 00_handoff/
│   ├── ASK_NEXT.md
│   ├── HANDOFF.md
│   ├── HERMES_START.md
│   ├── assets_index.md
│   └── session_history.md
│
├── 00_meta/
│   ├── ACCESSX_CLASSIFICATION.md
│   ├── AI_NOW.md
│   ├── BRAND_CANDIDATES.md
│   ├── CAD_LOG.md
│   ├── CATALOG_METHOD.md
│   ├── CONFLICT_LOG.md
│   ├── COUNTRY_POOL.md
│   ├── DRIVE_INDEX.md
│   ├── DRIVE_INDEX_SUMMARY.md
│   ├── DRIVE_NAME_TREE.md
│   ├── ENGINEER_SITE_CLASSIFICATION.md
│   ├── GTM_BRAND_PROPOSAL.md
│   ├── INDEX_session3_files.md
│   ├── INSTALLER_SENTENCE_CHECK.md
│   ├── KNOB_LOG.md
│   ├── LOOP_AUDIT.md
│   ├── META.md
│   ├── METHOD_CURRENT.md
│   ├── NEXT_STEP.md
│   ├── NO_INVENT.md
│   ├── OLD_SUMMARY_CN.md
│   ├── OLD_SUMMARY_INDEX.md
│   ├── PATH_PLAN.md
│   ├── PRODUCT_TRUTH.md
│   ├── QUESTION_COMPARE.md
│   ├── REPO_RECORD_SUMMARY.md
│   ├── REQUEST_FILES.md
│   ├── REUSABLE.md
│   ├── SESSION_BOOTSTRAP.md
│   ├── SHORTPATH_IMAGES_CN_v1.md
│   ├── SOP_THREE.md
│   ├── TOKEN_SAVE.md
│   ├── UNKNOWN_FILE_MAP.md
│   ├── VISITOR_REGION.md
│   ├── capacity.md
│   ├── distill_prompts.md
│   ├── index_sessions1-4.md
│   ├── loop_ledger.md
│   ├── methodology.md
│   ├── naming.md
│   ├── session10_method.md
│   ├── session_log.md
│   ├── intake/
│   │   ├── README.md
│   │   └── _READ_LOG.md
│   ├── scripts/
│   │   ├── capacity.sh
│   │   ├── fetch-drive.sh
│   │   ├── learn.sh
│   │   ├── probe-drive.sh
│   │   ├── pull-inbox.py
│   │   ├── push-inbox.sh
│   │   ├── scratch.sh
│   │   └── verify-upload.sh
│   ├── REPO_STRUCTURE.md
│   ├── STRUCTURE_00_META.md
│   └── ...
│
├── 10_product/
│   ├── .gitkeep
│   ├── accessories.csv
│   ├── base_unit.md
│   └── sku_master.csv
│
├── 20_audience/
│   ├── .gitkeep
│   ├── ICP.md
│   └── objections.md
│
├── 30_sales_assets/
│   ├── .gitkeep
│   └── dm_templates.md
│
├── 40_images/
│   ├── QA_ledger.md
│   ├── README.md
│   ├── slots.csv
│   ├── out/
│   │   ├── README.md
│   │   ├── CAD_Verified/
│   │   └── Hypothesis_Not_ProductTruth/
│   ├── refs/
│   ├── video/
│   ├── STRUCTURE_40_IMAGES.md
│   └── ...
│
├── 50_catalog/
│   ├── .gitkeep
│   ├── README.md
│   └── REPLY_BOUNDARY_NOTE.md
│
├── 60_website/
│   ├── .gitkeep
│   ├── README.md
│   ├── buyer-questions.txt
│   ├── catalog.html
│   ├── index.html
│   ├── markets.html
│   ├── questions.html
│   ├── site.js
│   └── styles.css
│
└── 90_archive/
    ├── .gitkeep
    └── README.md
```

## Key directory roles

- `00_handoff/` — session handoff and transfer notes
- `00_meta/` — repo-level method, logic, logs, rules, and scripts
- `10_product/` — product details, SKU data, accessories, core product file
- `20_audience/` — ICP and objection analysis
- `30_sales_assets/` — sales collateral and templates
- `40_images/` — image source, output, QA, and visual asset pipeline
- `50_catalog/` — catalog-related materials
- `60_website/` — static website
- `90_archive/` — archived or historical project files

## Recommended reading order

1. `README.md`
2. `00_meta/META.md`
3. `00_meta/SESSION_BOOTSTRAP.md`
4. `00_meta/PRODUCT_TRUTH.md`
5. `00_meta/METHOD_CURRENT.md`
6. `00_meta/REPO_STRUCTURE.md`
7. `00_meta/STRUCTURE_00_META.md`
8. `40_images/STRUCTURE_40_IMAGES.md`

## Related structure notes

- `00_meta/STRUCTURE_00_META.md` explains the governance and operational role of the metadata folder.
- `40_images/STRUCTURE_40_IMAGES.md` explains the visual asset pipeline and QA boundaries.
- This repository is intentionally organized as a research-and-operations sandbox, so metadata and logs are as important as the final deliverables.
