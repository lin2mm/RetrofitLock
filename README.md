# RetrofitLock

海外 retrofit 智能锁的销售资产库（目录 / 产品图 / 网站）。

**现在能打开的说明在 `00_meta/META.md` 开头。** 现行方法是 `00_meta/METHOD_CURRENT.md`。只在当前工作分支工作，不合并进 `main`。

**2026-09-23 当前入口**：方法论只读 [`00_meta/METHOD_CURRENT.md`](00_meta/METHOD_CURRENT.md)；已查仓库及 Drive 的结束节点分别是 [`REPO_RECORD_SUMMARY.md`](00_meta/REPO_RECORD_SUMMARY.md)、[`DRIVE_INDEX_SUMMARY.md`](00_meta/DRIVE_INDEX_SUMMARY.md)。本轮 Git 默认不提交／推送／合并；今天两份目录的用户优先级裁决见 Drive 总结。下文旧完成、冻结或铁律如与新裁决冲突，只作历史待核记录。

## 2026-09-20 历史铁律（不覆盖 2026-09-23 用户新裁决）
**产品外观唯一依据 = 铝合金外壳的 CAD 尺寸形状 + 最新设计师稿（面盖含旋钮）。**
以前所有"锁定/冻结"的底稿一律 `superseded`，只能溯源，不能用来证明新图正确。
详见 `00_meta/PRODUCT_TRUTH.md` §0；待确认清单见 `00_meta/CAD_LOG.md` §3c。

**2026-09-20 历史开局顺序（以下仅供追溯，不再逐项开局读取）**：
-1. **[`00_meta/SESSION_BOOTSTRAP.md`](00_meta/SESSION_BOOTSTRAP.md) — 新 session 系统顶层（loop/空间/命名体系/限制编造，R20：每个新 session 先读这页）** · **禁编造约束总集 = [`00_meta/NO_INVENT.md`](00_meta/NO_INVENT.md)**
0. **[`00_meta/PRODUCT_TRUTH.md`](00_meta/PRODUCT_TRUTH.md) — 产品冻结事实（优先级最高，先读这份再读别的）**
1. [`00_meta/META.md`](00_meta/META.md) — 顶层规则：持久化、每轮沉淀 loop、**merge 闸门**、命名与容量红线
2. [`00_meta/LOOP_AUDIT.md`](00_meta/LOOP_AUDIT.md) — 旧 loop 审计快照（现行表已迁至 `00_meta/METHOD_CURRENT.md`） · **要文件看 [`00_meta/REQUEST_FILES.md`](00_meta/REQUEST_FILES.md)**（P0/P1/P2，按它传、别盲传）
2b. **出图先分型**：[`00_meta/SHORTPATH_IMAGES_CN_v1.md`](00_meta/SHORTPATH_IMAGES_CN_v1.md) — Tier 0 外观图三步法（零新文件），Tier 1 工程图才动用 CAD 链；**禁止把 Tier 1 当前置闸门**
3. [`00_meta/REUSABLE.md`](00_meta/REUSABLE.md) — **先查旧记录再动手**（可复用清单，防重复劳动）
4. [`00_meta/CAD_LOG.md`](00_meta/CAD_LOG.md) — CAD/视觉的历史·分析·规则 + 你的五条确认（O2/O3/O4/O5/O8）
4. [`00_meta/DRIVE_INDEX.md`](00_meta/DRIVE_INDEX.md) + [`INDEX_session3_files.md`](00_meta/INDEX_session3_files.md) — Drive 有什么、Session 3 该给哪些旧文件
5. [`00_meta/index_sessions1-4.md`](00_meta/index_sessions1-4.md) — Session 1–4 总索引（防重复劳动）
3. [`00_meta/methodology.md`](00_meta/methodology.md) — 35 个旧方法标题的历史档案（现行归类见 `00_meta/METHOD_CURRENT.md`）
6. [`00_handoff/HANDOFF.md`](00_handoff/HANDOFF.md) — 当前进度与在办事项
7. `bash 00_meta/scripts/capacity.sh` — 空间/持久化/工具链自检（新沙盒加 `--fix` 重装依赖）

**唯一数据源：`00_meta/PRODUCT_TRUTH.md` + `10_product/base_unit.md` + `10_product/accessories.csv`**（`sku_master.csv` 已废弃）。
产品图必须分目录标状态：`Hypothesis_Not_ProductTruth/`（AI 推测，禁外发）vs `CAD_Verified/`（几何 QA 通过）。
