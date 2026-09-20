# RetrofitLock

海外 retrofit 智能锁的销售资产库（目录 / 产品图 / 网站）。

**新 session 开局顺序（固定，别跳）**：
0. **[`00_meta/PRODUCT_TRUTH.md`](00_meta/PRODUCT_TRUTH.md) — 产品冻结事实（优先级最高，先读这份再读别的）**
1. [`00_meta/META.md`](00_meta/META.md) — 顶层规则：持久化、每轮沉淀 loop、**merge 闸门**、命名与容量红线
2. [`00_meta/index_sessions1-4.md`](00_meta/index_sessions1-4.md) — Session 1–4 资料索引（防重复劳动）
3. [`00_meta/methodology.md`](00_meta/methodology.md) — 累积方法论
4. [`00_handoff/HANDOFF.md`](00_handoff/HANDOFF.md) — 当前进度与在办事项
5. `bash 00_meta/scripts/capacity.sh` — 空间/持久化/工具链自检（新沙盒加 `--fix` 重装依赖）

**唯一数据源：`00_meta/PRODUCT_TRUTH.md` + `10_product/base_unit.md` + `10_product/accessories.csv`**（`sku_master.csv` 已废弃）。
产品图必须分目录标状态：`Hypothesis_Not_ProductTruth/`（AI 推测，禁外发）vs `CAD_Verified/`（几何 QA 通过）。
