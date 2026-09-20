# CAD / 产品视觉 —— 历史记录 · 分析记录 · 规则记录（从已给文件汇总）

来源（全部 `Agent read`）：`00_GTM_CAD_LongTermMemory_StartHere_v1`、`00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2`（3/3 chunk 已读完，含 R15–R20）、
`00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1`、`00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1`。
**Session 5 本轮实测补充**：沙盒读 Drive 二进制 = 失败（见 §4）。

---

## 1. 规则记录（CAD / 视觉硬规则，全部来自项目自身，不新增偏好）

| # | 规则 | 出处 |
|---|------|------|
| R-1 | **唯一工作范围** = 真实铝合金 CAD 外壳 + 用户确认闭合面盖 + 用户确认旋钮 + 09-20 新确认的底部电池盖装配关系 | `StartHere` |
| R-2 | 不得引用已删除的 71–93 底部塑料件记录；不得恢复旧 DDK/GAI/JCP 推断链 | `StartHere` |
| R-3 | **不从原始塑料 STEP 自行推导外部可见性**；不从面盖视觉稿反推外壳厚度/尺寸/R 角 | `StartHere` |
| R-4 | 不生成任何底部塑料件或内部配件的 CAD 预览 | `StartHere` |
| R-5 | 不把旧 provisional 装配或旧图写成工程事实 | `StartHere` |
| R-6 | **禁止 AI 重绘 / 缩放 / 旋转 / 透视 / 重采样产品主体**；只允许 `ImmutableCrop_Extract` 式 1:1 裁剪 | **R20 / D58** |
| R-7 | **整图生成 + 分割蒙版边缘处理 + 不足够的逐像素 QA = 失败来源**（已被用户指出） | **R20** |
| R-8 | 每张成品必须**逐像素比对冻结底稿并评分**（如 `SilverLock_v2`/`BlackLock_v2` = 100/100）；不到 100 不呈现 | **R20 / D58** |
| R-9 | **AI 生成的视觉图一律删除**；用户手工选定版 = 后续视觉 QA 的**唯一底稿** | **R18 / D57** |
| R-10 | 修订必须**累积**：后一版只能在上一版已批准图上做局部修正，不得改动画布/构图/已修部分（底部圆角必须保留） | **R16→R17 / D55·D56** |
| R-11 | 派生白底图要**去掉手机/电池/灰底，但保留两把锁的原始相对比例** | R19 / D58 |
| R-12 | 冻结基准 = `..._BorderHighlightCorrected_CN_v1.png`（锁体/外圈亮边/手机·锁·电池比例全锁定） | R19 |
| R-13 | 面盖材质表述：普通塑料 + 棕红细密纹理，**not real wood**；对外措辞 `Aluminum Case`，内部 `CNC 铝合金` | Registry §10 / D45 |
| R-14 | 旋钮：近直角矩形长条、普通塑料、**无**金属套/装饰环/胶囊端/额外间隙，位置比例方向不得改 | `StartHere` |
| R-15 | STL/OBJ 只当 mesh reference，**不自动视为参数化工程 CAD**；native CAD 不许只转成 STL 后删原 | Registry §6 |
| R-16 | 视频不重新压缩/改码率；ZIP 必须附 README + manifest + SHA256 | Registry §5 |
| R-17 | "已上传 Drive" ≠ Agent 已读取；只有进 workspace 读成功才算 `Agent read` | Registry §2 |
| R-18 | 本地副本已删除时，称其为 `Drive source indexed / refetch on demand`，**不得**说成当前可读取 | Registry §11 |
| R-19 | **管线分工（最高层规则）**：CAD = 几何主事实；视频 = 运动/外观/覆盖参考；冻结图 = 对外视觉基准；AI = 助手/探索/场景合成。`CAD-to-render 优先`，**AI 不得替代工程验证，也不得与场景一起重绘产品** | **D66** |
| R-20 | 冻结图 → 多角度必须区分「视觉探索稿」与「产品事实」；未知角度需 CAD/实物照片/测量/扫描；场景 = 已验证产品层 + 背景合成 | **D64** |
| R-21 | 角度稿一律标 `angle hypothesis / not product truth`；**QA ≥95/100 才进入候选** | **D64** |
| R-22 | 未取得 CAD/实物输入前只能标"用户报告、尚未验证"，**不得据此生成正式角度图** | **D65** |
| R-23 | 出现任意品牌名即自动触发 Brand360 正查+反查+生态查；涉结构/外观/专利再叠 IP screen（公开专利检索只作风险筛查，不作 FTO 意见；换外壳≠规避 Nuki claim） | **D60/D63** |
| R-24 | 当前先做**一页 B2B retrofit one-pager，不做大而全 Catalogue**；白底、大留白、银/黑独立、单一 CTA；用户批准前 NoSend | **D61** |
| R-25 | 对外表述纪律：官方定位可写 "global leader in access solutions"，**不写**无第三方口径的"全球第一门锁" | **D62** |

## 2. 几何与文件记录

```
包络（固定） 39.800 W × 22.500 D × 90.500 H mm      来自 sx-db-4.stp（铝合金CNC喷砂氧化高光）
外壳母件      /home/user/exp1/drive_imports/CAD_贴锁_设计_stl/CAD-贴锁-设计-stl/铝合金CNC喷砂氧化高光/sx-db-4.stp
成功装配      /home/user/exp1/drive_imports/FreeCAD_assembly/装配-DB-4-成功.FCStd
面盖确认源    /home/user/uploads/01_SL-B03_Visual_ConfirmedClosedCover_DesignerFinal_Hero_Source_v1.png
              → 清洁工作派生 /home/user/exp1/01_..._CleanWorkingDerivative_v1.png（仅清掉 CAD viewport 操作轴）
旋钮确认源    /home/user/exp1/66_GTM_ConfirmedClosedCover_KnobSource_Crop_v1.png + 比例说明 md
电池盖证据    仅用户 2026-09-20 新上传的 3 张装配截图（旧推断链作废）
下次 CAD prompt 必读清单（8 个文件） 见 `StartHere`「下一次 CAD prompt 先读取」段
workspace 快照  /home/user/EXP1_Workspace_Compressed_2026-09-20.zip（源已按用户要求删除）
```
视觉谱系（谁在谁之上，逐版累积）：
```
31/33 provisional closed-appearance（已被降级，不再是事实源）
  └─ R16 BottomShapeCorrected（底部形状修正：银=圆角弧线 / 黑=方角平底 → 修正）
      └─ R17 BorderHighlightCorrected（外圈连续金属亮边；保留 R16 修正）= R19 冻结基准
          └─ R19 LockOnly_WhiteBG v1  ← R20 判失败（R 角与角度被改）
              └─ R20 ImmutableCrop_Extract_v2：SilverLock_v2 / BlackLock_v2，逐像素 100/100 ✅
AI 初版（改画布/构图/重绘产品）：R16、R17 各被拒一次；R19 重复锁体初版未采用；R18 已删除
```

## 3. 分析记录（本 session 新增）
- **为什么"铝框 + 电池盖一直没生成成功"**：不是提示词问题。项目在 R20 已定位原因（整图生成 + 蒙版边缘 + QA 不足），
  并给出解法 `ImmutableCrop_Extract` + 逐像素评分。**我上几轮还在用 AI 生成产品主体 = 重复 R20 之前的错误。**
  → 本 session 把 R-6/R-7/R-8 立为硬约束，`40_images/QA_ledger.md` K1–K8 即其可判定化版本。
- **STEP 在沙盒不可解析**：`cadquery 2.8 + OCP` 已装但 `import` 失败于缺 `libGL.so.1`（无 root、apt 源不通）。
  `trimesh` 读 STL/OBJ 不需要 OCP → 结论：**要 STL/OBJ，不要 STEP**。
- **Drive 二进制读取实测（本轮，2 条路径各测一次）**：
  ① 沙盒 `curl drive.google.com/uc?export=download` → **000**（网络白名单）
  ② `fetch_page` 打同一 CAD zip 直链（`id=1HlDJX0b…4inLN`）→ **HTTP 500**（工具能出网但拿不到二进制内容）
  ③ 对照：同工具同域名读 `.md` 成功（Folder 1 全部文本文件）→ **差别在文件类型，不在链接形式**
  → **结论：我读不到这两个 CAD 文件的内容**；能做的只有枚举（文件名/大小/FILE_ID，已 `Agent read`）。
  这条已把 `drive-direct-link-intake` 的边界钉死：**文本 md/txt = 我可 fetch；二进制 = 必须聊天附件或你本机 fetch-drive.sh**。

## 3b. 与我上几轮判断的对照（哪些被项目自己的规则证明/推翻）
| 我的说法 | 项目既有结论 | 判定 |
|---|---|---|
| `cad-verified-render-pipeline`：AI 不画产品主体，只贴回 | **D66 早就写了 CAD-to-render 优先、AI 不得与场景一起重绘产品** | 我的 = 复述，**以 D66 为权威引用** |
| `40_images/QA_ledger.md` 出图前 QA 不过不给人看 | **D64 已定 ≥95/100 才进候选 + 逐像素比对** | 我的 K1–K8 是其可判定化实现，**阈值改用 ≥95/100** |
| "先做 9 页目录骨架" | **D61 明确：先做一页 one-pager，不做大而全 Catalogue** | **推翻我的计划** → 第①步交付物改为 one-pager（`09_GTM_OnePager_...v0.1` 已有草稿） |
| 我起草过 AI 场景图作风格基线 | **D65/R-9：未取得 CAD 输入前不得生成正式角度图；AI 生成图一律删除** | **我的 2 张 `PROOF-STYLE_*` 属违规产物** → 已降级、标 `placeholder`、禁止外发，且下一步删掉 |

## 4. 还缺的 CAD 相关输入（按优先级）
1. `CAD-贴锁-设计-stl.zip`（FILE_ID `1HlDJX0bcZY_ZbNKrUjoXj87Bp9M4inLN`，473KB）→ 出精确 mesh + K1 尺寸 QA
2. `装配-DB-4-成功.FCStd`（子夹那份 id `1a4h7m__cpRPNrWHB-sA8j9MZpQx_kVCL`；顶层另有同名不同 id 一份，**请指认哪份为准**）
   注意：FCStd 本质是 zip，我沙盒无 FreeCAD，真正需要的是它导出的 STL/OBJ（zip 1 里应已含）
3. 电池盖 3 张装配截图（两个 folder 顶层都没有 → 可能在 `00_MTH-J07_NewAgent_Upload_Package_CN_v1.zip` 内，需你确认）
4. `01_SL-B03_Visual_ConfirmedClosedCover_DesignerFinal_Hero_Source_v1.png` + R19 冻结基准 `..._BorderHighlightCorrected_CN_v1.png`
   （R-8 逐像素比对的底稿，没有底稿就没有评分基准）
