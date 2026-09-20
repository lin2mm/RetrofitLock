# RetrofitLock

海外 retrofit 智能锁的销售资产库（目录 / 产品图 / 网站）。

## ⛔ 当前铁律（2026-09-20，高于一切历史"冻结/FINAL/100 分"）
**产品外观唯一依据 = 铝合金外壳的 CAD 尺寸形状 + 最新设计师稿（面盖含旋钮）。**
以前所有"锁定/冻结"的底稿一律 `superseded`，只能溯源，不能用来证明新图正确。
详见 `00_meta/PRODUCT_TRUTH.md` §0；待确认清单见 `00_meta/CAD_LOG.md` §3c。

**新 session 开局顺序（固定，别跳）**：
0. **[`00_meta/PRODUCT_TRUTH.md`](00_meta/PRODUCT_TRUTH.md) — 产品冻结事实（优先级最高，先读这份再读别的）**
1. [`00_meta/META.md`](00_meta/META.md) — 顶层规则：持久化、每轮沉淀 loop、**merge 闸门**、命名与容量红线
2. [`00_meta/LOOP_AUDIT.md`](00_meta/LOOP_AUDIT.md) — **全部 loop 的唯一清单**（几条规则、几个循环、多少方法论） · **要文件看 [`00_meta/REQUEST_FILES.md`](00_meta/REQUEST_FILES.md)**（P0/P1/P2，按它传、别盲传）
3. [`00_meta/REUSABLE.md`](00_meta/REUSABLE.md) — **先查旧记录再动手**（可复用清单，防重复劳动）
4. [`00_meta/CAD_LOG.md`](00_meta/CAD_LOG.md) — CAD/视觉的历史·分析·规则 + 你的五条确认（O2/O3/O4/O5/O8）
4. [`00_meta/DRIVE_INDEX.md`](00_meta/DRIVE_INDEX.md) + [`INDEX_session3_files.md`](00_meta/INDEX_session3_files.md) — Drive 有什么、Session 3 该给哪些旧文件
5. [`00_meta/index_sessions1-4.md`](00_meta/index_sessions1-4.md) — Session 1–4 总索引（防重复劳动）
3. [`00_meta/methodology.md`](00_meta/methodology.md) — 累积方法论
6. [`00_handoff/HANDOFF.md`](00_handoff/HANDOFF.md) — 当前进度与在办事项
7. `bash 00_meta/scripts/capacity.sh` — 空间/持久化/工具链自检（新沙盒加 `--fix` 重装依赖）

**唯一数据源：`00_meta/PRODUCT_TRUTH.md` + `10_product/base_unit.md` + `10_product/accessories.csv`**（`sku_master.csv` 已废弃）。
产品图必须分目录标状态：`Hypothesis_Not_ProductTruth/`（AI 推测，禁外发）vs `CAD_Verified/`（几何 QA 通过）。
