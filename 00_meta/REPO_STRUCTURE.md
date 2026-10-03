# Repository structure index

本文件用于索引此仓库的目录结构和主要内容分布，便于快速定位文件与工作区。

## 统计信息

- 仓库：`lin2mm/RetrofitLock`
- 主要语言组成：
  - Shell: 85%
  - Python: 15%
- 结构特点：
  - `00_meta/`：元数据、方法论、日志、脚本和索引
  - `00_handoff/`：交接材料
  - `10_product/`：产品与 SKU 数据
  - `20_audience/`：受众与对象分析
  - `30_sales_assets/`：销售资产
  - `40_images/`：图像、CAD、视频与输出目录
  - `50_catalog/`：目录与说明稿
  - `60_website/`：静态网站
  - `90_archive/`：归档材料

## Top-level index tree

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
│   └── scripts/
│       ├── capacity.sh
│       ├── fetch-drive.sh
│       ├── learn.sh
│       ├── probe-drive.sh
│       ├── pull-inbox.py
│       ├── push-inbox.sh
│       ├── scratch.sh
│       └── verify-upload.sh
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
│   │   ├── .gitkeep
│   │   ├── README.md
│   │   ├── CAD_Verified/
│   │   └── Hypothesis_Not_ProductTruth/
│   ├── refs/
│   │   └── .gitkeep
│   └── video/
│       ├── .ffmpeg_path
│       └── .gitkeep
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

## 关键目录说明

- `00_meta/`：这是仓库的“方法论与元数据中心”，包含历史记录、方法、索引、脚本和 session 记录。
- `10_product/`：产品事实与 SKU 数据，适合做产品基线核对。
- `20_audience/`：目标客户与产品诉求分析。
- `30_sales_assets/`：销售沟通模板和资产。
- `40_images/`：图像、模型引用与输出目录；图像状态会分入 `CAD_Verified/` 或 `Hypothesis_Not_ProductTruth/`。
- `50_catalog/`：目录与发稿材料。
- `60_website/`：静态站点，包含页面、样式和脚本。
- `90_archive/`：历史归档。

## 入口建议

- 读项目前先看：`00_meta/META.md`
- 当前方法参考：`00_meta/METHOD_CURRENT.md`
- 仓库主说明：`README.md`

这份索引适合在快速定位、文档导航和协同开发中使用。
