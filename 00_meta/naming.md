# NAMING — 文件命名与状态码体系（继承 + 更新）

> 目的：让下一个 session 不看目录树也能猜到哪是什么，以及让 CSV 能被程序直接消费。
> 更新规则：新增类型时在本页登记一条，别自由发挥。

## 1. 目录段（顶层，稳定，不要改名）

| 段 | 含义 | 写权限 |
|----|------|--------|
| `00_meta/` | 规则、方法论、session 索引、容量、脚本 | 只增补，改动需在 commit message 说明 |
| `00_handoff/` | 当前进度、素材清单、session 日志 | 每轮更新 |
| `10_product/` | **唯一真相源**：主机参数 + 配件矩阵 | 客户资料确认后改 |
| `20_audience/` | ICP、异议、线索 | 导入后稳定 |
| `30_sales_assets/` | DM 话术、已发出版本 | 只增 |
| `40_images/` | `refs/` 输入 · `slots.csv` 图位 · `out/` 成品 · `video/` 抽帧 | 每轮 |
| `50_catalog/` | 双语目录 HTML + 导出物 | 每轮 |
| `60_website/` | 网站 | Step ④ |
| `90_archive/` | 各 session 原始导出 | **只读** |

## 2. 文件命名

- 文档：`snake_case.md`，编号前缀 `NN_topic.md`（`01_` 起，用于有阅读顺序的材料）。
- 表格：`snake_case.csv`，第一行必须是表头；列义写在同名 `.md` 里，注释行用 `#` 开头（消费脚本需跳过）。
- 交接类固定名，不改：`HANDOFF.md`、`session_history.md`、`session_log.md`、`META.md`、`methodology.md`、
  `capacity.md`、`naming.md`、`index_sessions1-4.md`、`assets_index.md`。

## 3. 图片命名（关键：文件名即元数据，脚本可反查）

```
<资产ID>_<slot类型>_<场景>_v<版本><状态>.<ext>
```
| 字段 | 取值 | 例 |
|------|------|----|
| 资产ID | 主机/配件 ID，来自 `10_product/` | `GL-BASE-01`、`ACC-EURO`、`ALL` |
| slot类型 | 见下表 | `packshot_white` |
| 场景 | 装法/门型/ICP 后缀，可省 | `euro`、`glass`、`dealer` |
| 版本 | `v1 v2…`，不覆盖旧版 | `v3` |
| 状态 | `-FIN` 定稿 / `-CAND` 候选 / `-PLACE` 占位（禁用客户可见） | `-CAND` |

```
GL-BASE-01_packshot_white_v3-CAND.png
GL-BASE-01_fitment_euro_v1-FIN.png
ALL_compare_vs_fullswap_v2-FIN.png
PROOF-STYLE_packshot_v1-PLACE.jpg     ← 无参考图的风格基线，永不外发
```

### slot类型词表（与 `40_images/slots.csv` 对齐，新增要登记）
`packshot_white` 白底主图 · `hero_lifestyle` 封面场景 · `exploded_fitment` 分解/兼容 ·
`install_steps` 装法分步 · `finish_options` 颜色/表面 · `dims_annotated` 尺寸图（文字后期叠加，禁 AI 画数字）·
`lifestyle_door` 门型场景 · `kit_flatlay` 整套平铺 · `trust_badges` 认证条（需客户授权）·
`comparison` 对比图 · `accessory_detail` 配件特写 · `icp_variant` 按 ICP 的组合示意

> **状态词表采纳项目原有体系**（`00_meta/PRODUCT_TRUTH.md` §4 ← `00_EXP1-DRIVE_SourceOfTruth_Registry` §8）。映射：
> `blocked-*`→`User-reported` · `ready-to-generate`→`Verified input` · `generated-candidate`→`Angle hypothesis`（未过 QA = 推测，禁外发）·
> 过几何 QA 的渲染→`CAD verified angle` · `approved`/`final`→`Approved asset` · 未批准外发一律 `NoSend`。
> 新表用右侧词；旧 CSV 的左侧词下次改到该行时就地替换。

## 4. 状态码（CSV `status` 列只能用这些，别的算 bug）

| 码 | 含义 | 谁能解 |
|----|------|--------|
| `ready-to-generate` | 参考图与文案齐，可出图 | 我 |
| `queued` | 已排队，等批次一起跑 | 我 |
| `generated-candidate` | 已出图待挑 | 用户 |
| `approved` | 用户点头，可进目录 | 用户 |
| `final` | 已定稿 `-FIN`，进 PDF/网站 | 我 |
| `blocked-no-ref` | 缺真实参考图/设计稿 | 用户 |
| `blocked-no-cad` | 缺几何/尺寸，做不了正交与标注 | 用户 |
| `needs-permission` | 需认证 logo/商标等使用授权 | 用户 |
| `deprecated` | 被新版替代（不删，留溯源） | 我 |
| `placeholder` | 占位，禁止外发 | 我 |

## 5. 交付物命名（阶段产物）

- 目录：`50_catalog/catalog_v<N>_<语言>.html` → `catalog_v2_bilingual.html`；导出 PDF 同名 `.pdf`。
- 网站：`60_website/` 内独立 `package.json`，产物 `60_website/dist/`（不提交）。
- 阶段总结：`00_handoff/stage_<N>_<名称>.md`（如 `stage_1_images.md`），写完才算阶段收尾。
