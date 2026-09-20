> ⚠️ **SUPERSEDED 2026-09-20**：本页所有"冻结/锁定/FINAL"记录**一律降级为历史溯源**，不得再作为依据、不得用于自证。
> 现行铁律见 `00_meta/PRODUCT_TRUTH.md` §0（= **CAD 铝壳尺寸形状 + 最新设计师稿的面盖含旋钮**）。
> 保留本页只为记录"哪些结论被推翻了、别再引用哪几份"。

# CAD / 产品视觉 —— 历史记录 · 分析记录 · 规则记录（从已给文件汇总）

来源（全部 `Agent read`）：`00_GTM_CAD_LongTermMemory_StartHere_v1`、`00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2`（3/3 chunk，含 R15–R20）、
`00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1`（2/2 chunk，D01–D67）、`00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1`。
**Session 5 实测补充**见 §3、§3c。

---

## 1. 规则记录（历史，R-1…R-25；与现行铁律冲突处以 `PRODUCT_TRUTH.md` §0 为准）

| # | 规则 | 出处 | 现状 |
|---|------|------|------|
| R-1 | 工作范围 = 铝合金 CAD 外壳 + 确认闭合面盖 + 确认旋钮 + 底部电池盖装配关系 | `StartHere` | 沿用，但依据换成 §0 铁律 |
| R-2 | 不得引用已删除的 71–93 底部塑料件记录 / 旧 DDK·GAI·JCP 推断链 | `StartHere` | ✅ 仍有效 |
| R-3 | 不从原始塑料 STEP 推导外部可见性；不从面盖稿反推外壳厚度/尺寸/R 角 | `StartHere` | ⚠️ 修正：面盖稿**可以**定面盖与旋钮的形状；外壳尺寸形状仍只由 CAD 定 |
| R-4/R-5 | 不生成底部塑料件预览；不把 provisional 装配写成工程事实 | `StartHere` | ✅ 仍有效 |
| R-6 | 禁止 AI 重绘/缩放/旋转/透视/侵蚀性重采样产品主体 | R20 / D58 | ✅ 仍有效（本项目最硬的执行规则） |
| R-7 | 整图生成 + 蒙版边缘 + QA 不足 = 失败来源 | R20 | ✅ 仍有效（这就是"一直犯错"的机制诊断） |
| R-8 | 逐像素比对冻结底稿并评分，不到分不呈现 | R20 / D58 / D64(≥95) | ⚠️ 保留评分动作，**底稿换成 §0 的最新设计师稿** |
| R-9 | AI 生成图一律删除；用户上传选定版 = 唯一工作底稿 | R18 / D57 | ✅ 正好与"不能完全锁定"同向：**以最新用户稿为准** |
| R-10 | 修订必须累积，只改用户指定的局部 | R16→R17 / D55·D56 | ⚠️ 累积链已断，改由 §0 单张稿起算 |
| R-11 | 派生白底图：去手机/电池/灰底，保留两把锁原始比例 | R19 | 历史（两把锁那张已非基准） |
| R-12 | 冻结基准 = `..._BorderHighlightCorrected_CN_v1.png` | R19 | ❌ **已被你判定有问题** |
| R-13 | 面盖=普通塑料棕红细密纹理 not wood；对外 `Aluminum Case` | Registry §10 / D45 | ✅ 措辞沿用；材质以最新稿可见纹理为准 |
| R-14 | 旋钮：近直角矩形长条、普通塑料、无金属套/装饰环/胶囊端 | `StartHere` | ⚠️ **需按最新稿重判**：最新稿的旋钮/操作区看起来是**圆盘 + 斜向长条**，与"近直角矩形长条"不完全一致 → 已列【问】 |
| R-15…R-18 | STL 只当 mesh reference；视频不转码；"已上传≠已读"；删源后称 refetch on demand | Registry §5/§6/§2/§11 | ✅ 全仍有效 |
| R-19 | CAD=几何主事实 / 视频=运动外观参考 / 冻结图=对外基准 / AI 只做助手与合成，CAD-to-render 优先 | **D66** | ✅ 现行铁律即其具体化 |
| R-20 | 探索稿 vs 产品事实必须区分；未知角度要 CAD/实拍/测量/扫描 | **D64** | ✅ |
| R-21 | 角度稿标 `angle hypothesis / not product truth`；QA ≥95/100 才进候选 | **D64** | ✅ 阈值沿用 |
| R-22 | 无 CAD/实物输入前只标 `User-reported`，不得出正式角度图 | **D65** | ✅（本轮我自己被这条管住了） |
| R-23 | 出现品牌名触发 Brand360；涉专利叠 IP screen（换外壳≠规避 Nuki claim） | D60/D63 | ✅ |
| R-24 | 先做**一页** B2B retrofit one-pager，不做大而全 Catalogue；批准前 NoSend | **D61** | ✅ 决定我第①步交付物 |
| R-25 | 对外不写"全球第一门锁"，可写 "global leader in access solutions" | D62 | ✅ |

## 2. 几何与文件记录（历史谱系，仅供溯源）
```
包络（CAD 定） 39.800 W × 22.500 D × 90.500 H mm      来自 sx-db-4.stp（铝合金CNC喷砂氧化高光）
外壳母件  /home/user/exp1/drive_imports/CAD_贴锁_设计_stl/.../sx-db-4.stp
成功装配  /home/user/exp1/drive_imports/FreeCAD_assembly/装配-DB-4-成功.FCStd
```
视觉谱系（**每一环现在都被判"有问题"**）：
```
31/33 provisional closed-appearance
 └ R16 BottomShapeCorrected（银=圆角弧线 / 黑=方角平底）
   └ R17 BorderHighlightCorrected = R19 冻结基准   ← 你判定：不能完全锁定
     └ LockOnly_WhiteBG v1                          ← R20 判废
       └ R20 ImmutableCrop_v2 SilverLock/BlackLock（100/100） ← 现也降级为历史
```
→ 教训（写死）：**逐像素 100/100 也不等于用户批准**。评分是"是否忠实于底稿"，底稿本身对不对由你定。

## 3. 分析记录（Session 5 本轮实测）
- **"一直生成不成功"的机制原因**：不是提示词，是管线（R-6/R-7）。项目 09-15 已定位并给出 `ImmutableCrop_Extract_v2.py` + `QA_Score_v2`。
- **STEP 在沙盒不可解析**：`cadquery/OCP` 装上但 `import` 失败于缺 `libGL.so.1`（无 root、apt 源不通）；`trimesh` 读 STL/OBJ 不需要 OCP → 要 STL/OBJ，不要 STEP。
- **Drive 能力 = 每个沙盒不同（Q1 的答案）**：
  · 旧 session **能**：`J07 R15` 与 `D67` 记录"沙盒内 curl 拉下 `CAD-贴锁-设计-stl.zip` + 2 个视频并读取"；`00_EXP1-J09` 操作手册就是沙盒 curl 流程。
  · 本沙盒 **不能**：`drive.google.com`=000、`drive.usercontent`=000、`workspace.google.com`=000，而 `github.com`=200/npm=200/PyPI=200 → 白名单只放行少数域名；同一 zip 的 FILE_ID 用 `fetch_page` 也是 HTTP 500，而同工具同目录读 `.md` 成功 → **限制在二进制内容类型 + 沙盒出网策略，不在链接形式**。
  · 对策：`bash 00_meta/scripts/probe-drive.sh` 每次开局探测；能力**不记忆**（已写进方法论 `sandbox-capability-probe-not-memory`）。
- **聊天附件仍会静默失败**：本轮你发的 `image-1.png`，沙盒内 `/home/user/uploads` 不存在、全盘 find 无匹配（`verify-upload.sh` 实测）→ 图我能"看见"（对话内），但**没有像素文件**，所以 §0 铁律目前处于 `User-reported`，K-系列几何 QA 与逐像素比对**无法执行**，我不会据此出正式图（R-22/D65）。

## 3c. 从最新设计师稿读出的可见特征（我的观察，需你逐条确认；不是产品事实直到你点头）
| 编号 | 观察 | 影响 |
|------|------|------|
| O1 | 整机为**跑道形（两端大圆角）细长外壳**，正面被面盖覆盖，四周露出**金属亮边**（铝壳本体） | 定形：铝壳轮廓由 CAD，圆角程度由本稿 |
| O2 | 顶部**大圆盘**（深灰）内有一条**斜向浅色长条** | 这是旋钮/手动操作区？与旧"近直角矩形长条"记录不同 → 【问】 |
| O3 | 大圆盘下方有一个**小圆点**（浅灰） | LED / 按键 / 定位点？→ 【问】 |
| O4 | 中部一个**圆形棕色按钮**（与面盖同色系，略亮） | 功能键？→ 【问】 |
| O5 | 下部有**"LOGO"字样**（浅灰刻字） | 与旧"无 logo"记录**冲突**：应为可放 logo 的位（占位文字），位置≈下 1/3 居中偏右 → 【问：保留 logo 位还是不刻字？】 |
| O6 | 面盖为**棕红细密纹理**（与 Registry §10 一致，非木纹） | ✅ 与历史一致，沿用 `not real wood` |
| O7 | 图中央有 **CAD 视口坐标轴**（红/绿/蓝小箭头） | 派生图必须清掉（历史 `CleanWorkingDerivative` 同规则） |
| O8 | 底部端头有**棕色带横纹区域**（约 3 道槽） | 这是**电池盖**的可见部分？纹路方向？→ 【问，且这是电池盖唯一新证据】 |
| O9 | 视角为**单一 3/4 正面等轴**，无侧/底/背视图 | 侧面厚度、背面机构、电池盖装配关系**不可见** → 仍需 CAD + 电池盖截图（R-20） |

## 3d. R12 增补（2026-09-20：用户补投 + 容量考古）
- **109 = rejected-by-user**：电池盖应在底部、被做至上部圆弧面。根因 = 合成时拿 31 的**图像方位**当部件位置
  （构图参考被误当几何权威，正是 D64/D65 反复划的边界）。→ `PRODUCT_TRUTH.md` §1ab 与 `QA_ledger` K13 已同步。
- **旧 session 容量爆掉根因**（112+113 实证：355 files / 100.79MB）：
  ①zip 与解包同存（`CAD-贴锁-设计-stl.zip` 与同名目录）②同资产多代（`FreeCAD_assembly` 与 `_complete_v2`）
  ③2×mp4 视频 + `video_frames/` 全量抽帧留存 ④`/home/user/uploads` 旧参考图不清 ⑤92MB 快照 zip 留本地且未外流
  ——⑤ 最讽刺：**为救容量做的快照本身吃掉近一半容量**。→ 方法论 `binary-artifact-capacity-discipline`（累计 24），
  `capacity.sh` §3 增加二进制堆积计数。
- 设计稿 A 版 png：本沙盒 `uc?export=view` 与 `file/d/<id>/view` 再测均 **500** → 像素只剩 聊天附件（肉眼）/ inbox（真相）两路。

## 3e. R13：三张装配截图 + 105/107/101/110/94 + STEP 头（全部已读）
**三张截图身份**：就是历史文档引用的 `/home/user/uploads/image-1/2/3.png`（94 与 101 明文登记为「装配关系对照」证据），本轮聊天里肉眼重读。
本沙盒附件**第 4 次未落盘**（全盘 find 无新文件）→ 像素文件从未进沙盒，「定期删除」自动满足；分析全部记为肉眼级观察。

- 截图视觉结论（与 107/105 交叉一致）：
  ① 电池盖 = 平板 + 端部 4 条凸筋 + 圆弧折边；**装配动作 = 凸筋端先入远端槽 → 另一端压平扣合**（img1 分离 → img2 半入 → img3 齐平）。
  ② 盖体与圆形机构腔在**两端对立**（107：placed bbox Z=+42.45…+48.85，贴外壳 +Z 端面 48.67）→ 与「109 错在把盖贴到圆盘端」互证。
  ③ 31 视角下盖被面盖遮挡（107 §3 原文）→ 按 105 §5：A 图保持遮挡、**另出 B 底部/后部确认图**，禁止在 A 图臆造遮挡结构。
  ④ 截图含坐标轴 triad + 红色锁定图标 = viewport 叠加件，仅分析用，成品图必须无（沿用 1a 的「坐标轴清除」规则）。
- `sx-db-4.stp`（Drive，222KB 文本，id `1kcUb22aSBNMmsP5p2J7B8XdltalI7R8l`）：
  header = `SX-DB-4` / Creo 导出 / AP242 / 2025-12-23 / author guan；`fetch_page` 分块=29 chunks，**我方可全量自读**（需单独一轮）。
  【问】STEP 首批坐标点 X±19.9（=39.8 全宽）vs 107 的 FCStd local bbox X±21.543（43.09）→ 轴向/特征差异，待网格化后 bbox 对照定论。
- 105 §7「最短 9 步」= 本任务管线原文（含 8 视图清单与 CAD verified / screenshot consistent / discrepancy / incomplete 四态输出词），
  107 §6「正确渲染 7 步」= 电池盖渲染工序。**两条已采纳，不再自造流程。**
- FCStd 子件（107 精确值，全部入 truth）：db-4 local bbox X±21.543136 / Y-0.503532…22.003532 / Z-21.541602…71.015493，
  vol 30262.714750 mm³；DC-GAI-4 bbox X-14.055311…19.047235 / Y0…6.400058 / Z±9.447235，vol 1304.841078 mm³；
  placements：DB (-4.6,-7.55,-22.35)+identity；GAI (-14.2,+3.05,+42.45)+90°X；15.180740 mm³ 仅诊断量。
- 子文件夹两个 id 并存（107 记录 `1n5gFRP-AcLH8y1-Rqq9zKRueRgo3kIZ8`；本轮枚举 `1iGXjZ4djXxYbSHr51WQdcsblDixtRp-B`，文件名与大小同 107：17/45/40KB）
  → 以本轮 id 为现行；旧 id 可能已回收。

## 4. 需要给我的东西（已按 §0 铁律重排）
> **R12 起以 [`00_meta/REQUEST_FILES.md`](REQUEST_FILES.md) 为准**（P0/P1/P2 + 格式换算约定）；本节保留作历史对照。
1. **最新设计师稿原图文件**（png，请重发附件，或直接告诉我它已在 Drive 的哪个 folder，我列 folder 找 id → 但 png 是二进制，我拉不到，仍需附件）
2. `CAD-贴锁-设计-stl.zip`（铝壳尺寸形状真源，473KB）+ 你要我采用的那份 `装配-DB-4-成功.FCStd`
3. 电池盖装配截图（若 O8 就是电池盖，回一句"O8 即电池盖"，我可少要一份文件）
4. 对 O2/O3/O4/O5/O8 的逐条【问】答复（一句话一条即可）
