# DRIVE 资产索引（长期有效 · 唯一入口清单）

## 0. Canonical 链接（**原始 URL 全文长期保存**，不只存 id）
| 名称 | 原样链接 | 出处（我从哪个文件读到的） | 状态 |
|---|---|---|---|
| Session 3 长期记忆 / EXP1 唯一文件往来通道 | `https://drive.google.com/drive/folders/14Enb5EiikE_EbIqReAp-oEqqPqg4EtSi?usp=drive_link` | `00_EXP1-J09_DriveFolder_FileExchange_Link_CN_v1.md` + `00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md` §1（**从文件里挖出来的，不是我猜的**） | ✅ 已枚举（9 项 + 1 子夹） |
| 子文件夹（3 个 FCStd） | `https://drive.google.com/drive/folders/1n5gFRP-AcLH8y1-Rqq9zKRueRgo3kIZ8` | 上一条枚举结果 | ✅ 已枚举 |
| 你本轮给我的 Session5 收件夹 | `https://drive.google.com/drive/folders/1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT?usp=sharing` | 你消息正文（2026-09-20） | ✅ 已枚举（7 项，4 份 md 已读） |
| **`确认设计稿`（原 `image-1.png`，视觉唯一底稿）** | ⚠️ **待登记**：请给所在 folder 或 file 链接 + FILE_ID | 你 2026-09-20 指令改名 | `User-reported`（沙盒内无文件；附件 3 次未落地） |

> 通道结论（本轮实测）：**GitHub `inbox` 分支 = 把文件按字节送进沙盒的可靠路**。
> `push-inbox.sh` 送 → `pull-inbox.py --get inbox/<名>` 取，sha256 已验证一致；单文件 ≤1MB。

> 规则：**本文件是 Drive 的索引，不是副本**。二进制**永不进仓库**（用户指令：CAD 是临时分析文件，只推 md/xlsx 结论）。
> 沙盒 `curl` 实测 `drive.google.com/uc` = **000**（不可下载）；`fetch_page` 只能读**文本类**（md/txt/PDF）。
> 所以：文本 → 我 fetch；二进制 → 聊天附件，或你本机跑 `00_meta/scripts/fetch-drive.sh <FILE_ID> <名字>`。
> 每次取用后：写结论 md → 删本地源（`bash 00_meta/scripts/scratch.sh clean`）→ 只更新本页状态列（`refetch on demand`）。

## Folder 1 · `20260920-LockSession5`  ← **2026-09-20 你更新后：7 → 14 项**
`https://drive.google.com/drive/folders/1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT?usp=sharing`

| 文件 | FILE_ID | 大小 | 类型 | 状态 |
|------|---------|------|------|------|
| `确认设计稿-闭合面盖-带Logo字.png` | `11XTS3AWTVC2bBLY__Vrcca3sYuzmbqPt` | — | png | ⛔ `User-reported`：**沙盒拿不到字节**（curl TLS 被掐 / `fetch_page` HTTP 500 / lh3 缩略图也 500 / 聊天附件 3 次未落地）→ 见 §5 通道结论 |
| `111_GTM_Workspace_Refresh_Summary_2026-09-20.md` | `1pV8007Nz1O9QpbjdbrPiKxqyx5tq7JsX` | 新 | md | ✅ `Agent read` **关键**：CAD/FCStd 几何已读完（见下） |
| `112_GTM_Workspace_Compression_And_Source_Delete_Plan_2026-09-20.md` | `1dl1loXUqVE6YSUL-tPTB2azvk-4uKYab` | 新 | md | `User-reported`（要点已由 113 覆盖） |
| `113_GTM_Workspace_Compression_And_Source_Delete_Completion_2026-09-20.md` | `1MoTjN3orsPf13ubAWdnrZiuZq8Cx9wX3` | 新 | md | ✅ `Agent read`：快照 92,354,796 B / 355 files / SHA256 a0300a56…；按需 refetch 六步法 |
| `01_EXP1-A01_ProductTruth_Check_CN_v1.md` | `1_9Tw4l9pijghc-LncTgZ8D7FeUuvx_E1` | 新 | md | ✅ `Agent read`：产品事实/claim 纪律/证据标签/**银黑转换需你确认** |
| `09_GTM_Visual_FromFrozenProduct_ToAngles_ToScenes_Method_CN_v1.md` | `1WgowHv295WmU468KYtw5AK1dCgw97ROX` | 新 | md | ✅ `Agent read` **关键**：Stage0–6 + **100 分 QA 评分表** + 3 个 prompt 模板 |
| `09_GTM_AI_CAD_Combination_Capability_Assessment_CN_v1.md` | `1qazu-EWL359lekGhzyY54BzzHrvZG_4B` | 新 | md | `User-reported`（要点已从 111/D66 获得） |
| `00_EXP1-J09` / `00_MTH-J09` Drive 通道说明 | `1kvH9LNRVR-5eIIb_XOZcv2NHwwb1ld3R` | 2KB | md | ✅ 已读（旧沙盒通道） |
| `00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1.md` | `1thWc6_dv07HdkzFJtEgk8xBUMxiQtWGG` | 17KB | md | ✅ 已读 2/2（**D01–D67**） |
| `00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md` | `1XsxEj_AO4pXERB2b4VPElN1MAlAjF0mZ` | 27KB | md | ✅ 已读 3/3 |
| `00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md` | `1J8Qo7vJ9mScbkepnj2acbxLKGS8aABNJ` | 9KB | md | ✅ 已读 |
| `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` | `1ZiCFZwu9WtuGROTaGvDowwBIAweeZU6f` | 3KB | md | ✅ 已读 |
| `00_EXP1-J00_Index_..._RunLog_CN_v1.xlsx` | `1dOaF7cZESaq7dC-S2DOb-OI-BSBWwHwX` | 27KB | xlsx | ⛔ 二进制类，未取 |
| `00_EXP1-J90_..._Recommendations_CN_v1.xlsx` | `1ezj1dcVJ01cr4nYDpfmjXO3M4-ucJ4aC` | 23KB | xlsx | ⛔ 未取 |

> 旧版 7 项清单已被本表完全覆盖（`00_MTH-J07 / J09 / J90 / StartHere / Registry` 的 FILE_ID 不变，详见 §1 与下表）。
（2026-09-20，两条路径各测一次，别再重复测）
| 目的 | 途径 | 结果 |
|---|---|---|
| 枚举 folder / 取 FILE_ID | `fetch_page` folder URL | ✅ 成功（含子文件夹） |
| 读 **md/txt** 正文 | `fetch_page` + `uc?export=download&id=` | ✅ 成功（Folder 1 的 4 份 md 全读） |
| 读 **zip/stl/FCStd/mp4** 内容 | `fetch_page` 同一端点 | ❌ **HTTP 500** |
| 读上面这些 | 沙盒 `curl` | ❌ **000**（白名单） |
→ 所以对你的问题「能不能自己从 Drive 读那 2 个 CAD 文件」：**不能**。二进制只有 ①聊天附件 ②你本机 `fetch-drive.sh`。
→ 这条边界就是项目自己 **D65** 的结论：无输入只能标"用户报告、尚未验证"，不得据此出正式角度图。

## 4. 从 `111` 拿到的 CAD 几何事实（**我原本要从 STL/FCStd 重新算，现已完成**）
```text
装配-db-4.FCStd  : 1 solid / 159 faces / 866 edges / 1732 vertices
装配-DC-4.FCStd  : 1 solid /  82 faces / 408 edges /  816 vertices
子件 SX_DC_GAI_4 : 局部包络 ≈ 33.1025 × 6.4001 × 18.8945 mm（主装配位置 + X 轴 +90° 旋转已应用）
装配关系        : 主件链接 SX_DB_4 与 SX_DC_GAI_4；SX_DB_4 已接地；运动副 = Slider（DC_GAI_4.Edge30 ↔ DB_4.Edge49）
电池盖形状      : 平板 + 端部圆弧区 + 导轨/加强筋 + 滑动装配（CAD QA 可见）
HOLD 待判       : 公共体积 ≈ 15.18 mm³ —— 是设计配合还是干涉？（工程结论前不得对外宣称）
已生成物        : 103/104 视觉候选（含确认面盖+旋钮，电池盖未被接受）；106/108 CAD QA 图（内部用，非对外渲染）；
                 109 整合候选（用 31 左前 25° + 真实 BREP 电池盖）= CANDIDATE/HOLD，需你批准
Gate 现状       : Drive 子文件 PASS · 子 BREP PASS · 装配位置 PASS · 配合/间隙解释 HOLD · 用户确认 PENDING · 历史清理 BLOCKED
禁止引用（历史错误保护）：v4 旋钮资产 / 71–93 底部塑料推断链 / 97–100 错误成品渲染链 /
                          AI 发明的下部圆形结构、外框、电池门、接口、内部件
```
> 相机/构图起点 = `31_GTM_AngleSet_R1_Black_LeftFront25_CADRatioHypothesis.png`（**构图参考，非几何权威**）。

## 5. 通道结论（本轮实测，回答"为什么还要 push"）
| 做法 | 本沙盒结果 | 证据 |
|---|---|---|
| 沙盒 `curl` 拉 Drive | ❌ | TCP **连上了**（`Trying 142.250.99.132:443` → `Connected`）但 TLS 死于 `SSL_ERROR_SYSCALL`；而 `github.com`/npm/PyPI=200 → **egress 在白名单外直接掐断握手**（`/usr/local/share/ca-certificates/e2b-ca.crt` 说明流量经 E2B TLS 中间人） |
| `fetch_page` 读二进制 | ❌ HTTP 500 | zip 与 png 都失败；**同一工具读 md 成功** → 限制在内容类型，不在链接写法 |
| `lh3.googleusercontent.com` 缩略图 | ❌ HTTP 500 | 连预览小图都拿不到 |
| `read_file` 传 URL | ❌ 不支持 | 只接工作区路径 |
| 聊天附件 | ⚠️ 3 次未落地 | `/home/user/uploads` 不存在（本轮又验证一次） |
| **`push-inbox.sh` → `pull-inbox.py`** | ✅ **唯一实测可用** | 往返 sha256 一致（已用真文件验证） |
→ **不是要你多做动作**：文本类我照旧自己从 Drive 读（本轮 5 份新 md 就是这么读的，零额外操作）。
   只有**二进制**（png/zip/xlsx/视频）才需要 inbox —— 因为本沙盒被网络策略挡住了，而旧 session 的策略没挡。

## 仍然缺（不在任何已枚举位置）
1. **底部电池盖 3 张装配截图（2026-09-20 新版）** —— 全项目唯一的电池盖装配证据；两个 folder 里都没有。
   ⚠️ 没有它，`K7` 无法通过，电池盖相关的任何图/文案我都不会生成（不再猜）。
2. `01_SL-B03_..._DesignerFinal_Hero_Source_v1.png`（面盖确认源，registry §10 指定优先级最高）—— 不在 folder 里。
3. `02_SL-B15` / `02_SL-B16`（目录资产盘点 + 文案草稿，md+xlsx）—— 做目录要对照，未枚举到。

## 取用纪律（写死，防再次膨胀）
- 文本类（md/txt/PDF）：我用 `fetch_page` 读，**读完只把要点写进本仓库 md，不存原文副本**。
- 二进制（zip/mp4/png/xlsx）：进 `/home/user/RetrofitLock/.scratch/`（已 gitignore）→ 分析 → 产结论 md → **删源**。
- 任何情况下**不把 CAD/视频/压缩包 push 到 GitHub**，包括 `90_archive/cad/`（该豁免已作废并收回）。
