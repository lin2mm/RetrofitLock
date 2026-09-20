# 目录 & 对外资产的方法论继承（不重造，只做 v2）

> 来源：Drive 已读文件 `00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1.md`（D01–D55 全部条目）、
> `00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md`（R7–R14 时间线）、`00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md`。
> 用法：**做目录 = 按本页清单逐条执行**；每条后面写"沿用 / 修订（Dxx）"，不许跳过也不许另起炉灶。
>  **2026-09-20 两处修正**：① delta 已到 **D67**，续编从 **D68**；② 按 **D61**，第①步交付物**不是 9 页目录**，
> 而是**一页 B2B retrofit one-pager**（`09_GTM_OnePager_..._v0.1` 已有草稿，白底/大留白/银黑独立/单一 CTA，批准前 NoSend）；
> 目录（Catalogue）在 one-pager 批准后再做。视觉依据全部改指 `00_meta/PRODUCT_TRUTH.md` §0 铁律。

## 0. 继承的三个既有事实（决定"重做"的含义）
1. 已有产出**存在但实体不在我手上**：`02_SL-B15_Marketing_AssetAudit_Plan`、`02_SL-B16_Marketing_CopyDraft`（md+xlsx，2026-09-14 R14 交付）。
   → 目录**不重新设计**，是**把 B15 的盘点结论执行到底 + B16 的草稿按新真相源重排**。
2. `02_SL-B01/B02/B10–B14` 旧视觉/营销实体**已确认缺失**（J90 R14：不能假设存在）。`uploads/image-1.png` **不是产品图**。
3. 双方法论体系 `GEN-A00 v3 / SL-A00 v4` 已被 31 条 delta 修订为**提案**（GEN v4 / SL v5），
   **状态：等用户 FINAL（停止点 S5），不得自标 FINAL**。→ 本目录同样不标 FINAL。

## 1. 做目录必须走的 8 步（继承 + 本次新增）
| 步 | 做什么 | 出处/状态 |
|----|--------|-----------|
| 1 | **ProductTruth 闸门**：所有参数只从 `00_meta/PRODUCT_TRUTH.md` 取（含 39.8×22.5×90.5、Aluminum Case 措辞、cover=普通塑料棕红细纹理 not wood） | `A01 PASS` + 沿用 D45 |
| 2 | **Asset Audit**：每个素材打标签 `当前可用 / 待恢复 / 仅参考 / 禁止公开`；历史索引里的文件**默认不可用** | 沿用 **D51** |
| 3 | **Claim/Asset Gate**：缺规格、兼容性、认证、价格/MOQ/交期 → 一律 `【问】/TBD`，**不用文案掩盖** | 沿用 **D53** |
| 4 | **图分轨**：`CAD verified angle` 才能进正文；`Angle hypothesis` 只能进"概念/示意"区并显式标注 | Registry §8 + 本 session `cad-verified-render-pipeline` |
| 5 | **双轨文案**：对外 `Aluminum Case`、易读优先；内部/工程页保留 `CNC 铝合金`；不夸大 HomeKit/Matter/BHMA/ANSI | 沿用 **D45** + GTM 禁止事项 |
| 6 | **执行表列序**：`网址 + EN + LOCAL` 相邻列（Excel/HTML 都要这结构）；中英双语同此 | 用户 09-14 指令（新标准顺序固化） |
| 7 | **readiness 卡**：目录定稿后立刻接 website + email readiness（B15 已建卡）——目录、网站、邮件同一批事实 | 沿用 **D52** |
| 8 | **停止点**：外发批准(S1) / 付费数据(S2) / 私人数据(S3) / 改产品事实(S4) / 标 FINAL(S5) —— 五个都必须问用户 | 沿用 SL 体系；我的 **merge 闸门 = S1 的同类** |

## 2. 目录页面骨架（把"一款主机 × 配件 × ICP"落进他们的结构）
```
封面      品牌 + Aluminum Case 一句话 + CAD verified 主图            [D45 措辞]
P1 是什么  3 张 CAD verified 视图（前/侧/底 R 角可见）+ 包络尺寸      [K1/K2]
P2 兼容矩阵 配件 × 锁体类型 × 门厚 × 耗时（表格由 accessories.csv 生成）
P3 装法    3–4 步安装（每步一张 CAD/实拍帧；无文字依赖）              [K6 无假字]
P4 面盖与旋钮  **只以最新设计师稿**（O1/O2/O5/O6）；旧稿不得引用                  [K9]
P5 电池盖   **只放 09-20 三张装配截图的引用图**，其余不写            [K7]
P6 按 ICP 选配件包  installer / dealer / STR-property / hospitality（对齐 Phase B 路线图）
P7 规格表  全字段，缺项 【问】/TBD                                    [D53]
P8 合规与认证  按客户群区分；RF/进口闸门不可豁免（D34）；AU DDA / UK Secured by Design
P9 商务条款  MOQ / 阶梯价 / 交期 / 样品（无证据 → 空，不猜）
封底      Contact + NoSend 状态标记（内部版）/ 去掉（对外版）
```
每页右上角印状态戳：`CAD verified angle` / `Angle hypothesis` / 【问】—— 让客户和我们都看得见证据等级。

## 3. 版本与命名（沿用项目规则，不新造）
`NN_STAGE-TOPIC_Language_日期_vN`：本目录定为 **`50_CAT-B17_Catalogue_Bilingual_v1`**（md 计划 + html 成品 + xlsx 素材台账），
下一版 `v2`，**不覆盖 v1**，不标 FINAL。素材台账沿用 B15 的四标签法。
