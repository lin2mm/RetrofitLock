# REQUEST_FILES — CAD / 设计稿取件清单（R12 起）

> 规则：**先查本清单再传，清单里没有的我才缺**。已在 Drive folder `20260920-LockSession5` 的 14 项**都不要再传**
> （其中 7 份 md 我已通读：111 / 113 / 112 / 01_A01 / 09_VisualMethod / J07 / J90；指针：StartHere / Registry / J09 / 09_AICAD / 112…见 `DRIVE_INDEX.md`）。
> 传法：放进**同一个 folder**即可，我用 `fetch_page` 自读（文本类零你的动作）。

## P0 · 没有就无法出正式图

| # | 文件名 | 为什么 | 通道 |
|---|--------|--------|------|
| 1 | `确认设计稿-闭合面盖-带Logo字.png` | 外观唯一依据（A 版） | 已在 Drive，但**像素取不到**（png/zip 一律 500，本轮再测 `export=view`、`file/d/../view` 均 500）→ 二选一：**聊天附件**（我能看见、能做肉眼对照，不能做像素 QA）或 **inbox**（`push-inbox.sh`，能做 QA/裁剪/测量） |
| 2 | `确认设计稿-闭合面盖-不带Logo.png`（B 版） | 你已确认出 A/B 两版；**one-pager 用 B 版**（O5） | 同上；或只传带 LOGO 版、我按图位规则先占位 |
| 3 | `sx-db-4.stp`（外壳主 STEP，**单独一个文件**） | 外壳尺寸/形状唯一权威（包络 39.8×22.5×90.5mm 已由 `111` 给出，但渲染几何需要本体） | **STEP 是文本格式 → 我可能能直接从 Drive 自读**！请单独上传（别包 zip），并尽量 ≤5MB |
| 4 | `装配-DC-4.FCStd` 与 `装配-db-4.FCStd` | 电池盖/装配关系复算（结论已在 111，重渲染时才需要） | FCStd 是二进制 → 若 3 号 STEP 给全了，**可跳过**（优先给 3） |

## P1 · 省下我重做、或防再次返工

| # | 文件名 | 为什么 |
|---|--------|--------|
| 5 | `107_GTM_External_FCStd_Downloaded_And_BottomCover_Geometry_Read_2026-09-20.md` | **标题就是"已下载 FCStd + 底部盖几何已读"**——含旧 session 从 Drive 取 CAD 的确切方法（Q1 的答案）与电池盖几何原文 |
| 6 | `101_GTM_Drive_FCStd_Assembly_Verification_And_Render_Delete_QA_2026-09-20.md` | 渲染 + 删除 + QA 的完整流程记录（我照抄流程，不重造） |
| 7 | `102_GTM_ConfirmedCover_Knob_BatteryCover_From31_TwoImageGate_And_HistoricalCleanupPlan_2026-09-20.md` | 双图闸门 + 历史清理计划（你 ⑤"防重复"的最大件） |
| 8 | `105_GTM_External_FCStd_And_BottomBatteryCover_Geometry_Verification_Plan_2026-09-20.md` | 验证计划（知道哪些步骤已被设计为 PASS） |
| 9 | `94_GTM_CAD_VisualScope_Compacted_LongTermMemory_2026-09-19.md` | 压缩版长期记忆（防我读散档） |
| 10 | `110_GTM_Workspace_Refresh_Summarize_Learn_Recommend_Protocol_2026-09-20.md` | 开局协议原文（我的 META 与它对表） |
| 11 | `106_GTM_..._CAD_QA.png` / `108_GTM_..._CAD_QA.png`（111 提到的两张 QA 图） | 对照"109 到底错在哪"的最短路径（≤2MB 小图即可） |
| 12 | `109_GTM_..._battery-cover-integrated_*.png` | 你已判废，**只作错误样本**（可选，小图） |

## P2 · 有就用，没有不阻塞

| # | 文件名 | 说明 |
|---|--------|------|
| 13 | `CAD-贴锁-设计-stl.zip` 整包 | 若只给 3 号单文件即可；整包走不了 inbox（>1MB）→ 传 Drive 后**把 STL 转成 OBJ/ASCII STL 再传一份**我就能自读 |
| 14 | 实拍半成品视频（1–2 条） | 只用 imageio-ffmpeg 抽 6–10 帧 → 合成 1 张 contact sheet → **删原帧**（见方法论 `binary-artifact-capacity-discipline`） |
| 15 | `iso.svg` | 文本格式，若给我能直接读 |

## 格式换算约定（为了让我"能自读"）
- 能给 **文本格式** 的都给文本：STEP(`.stp`) / IGES / **OBJ** / **ASCII STL** / SVG / md / csv → 我 `fetch_page` 分块自读，你零动作。
- 必须二进制的（png/mp4/xlsx/FCStd）：单文件 **≤1MB → inbox**；>1MB → Drive（我登记 FILE_ID，等出网开放的沙盒再取，或聊天附件让我先看）。
- 一律**别打包 zip 给我想要的单个文件**（zip 是二进制 = 我又瞎了；解包后原件再删，别同存——R12 容量教训）。

## 已防重复（这些我已有结论，不用再传）
- FCStd 拓扑计数 / `SX_DC_GAI_4` 包络 / Slider 运动边 / 15.18mm³ HOLD —— 来自 `111`（已入库 `PRODUCT_TRUTH.md` §1ab）。
- 快照与删除史（355 files / 100.79MB / sha256 `a0300a56…`）—— `112`+`113`（容量规则已入库）。
- claim 禁用清单 / 证据标签 / 银黑转换需确认 —— `01_EXP1-A01`（已入库，K11）。
- 100 分 QA 制 / Stage0–6 / prompt 模板 —— `09_GTM_Visual...Method`（已替换 `QA_ledger.md` 自拟阈值）。
