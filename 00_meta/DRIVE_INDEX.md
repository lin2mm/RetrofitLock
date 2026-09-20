# DRIVE 资产索引（长期有效 · 唯一入口清单）

> 规则：**本文件是 Drive 的索引，不是副本**。二进制**永不进仓库**（用户指令：CAD 是临时分析文件，只推 md/xlsx 结论）。
> 沙盒 `curl` 实测 `drive.google.com/uc` = **000**（不可下载）；`fetch_page` 只能读**文本类**（md/txt/PDF）。
> 所以：文本 → 我 fetch；二进制 → 聊天附件，或你本机跑 `00_meta/scripts/fetch-drive.sh <FILE_ID> <名字>`。
> 每次取用后：写结论 md → 删本地源（`bash 00_meta/scripts/scratch.sh clean`）→ 只更新本页状态列（`refetch on demand`）。

## Folder 1 · `20260920-LockSession5`
`https://drive.google.com/drive/folders/1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT`

| 文件 | FILE_ID | 大小 | 类型 | 状态 |
|------|---------|------|------|------|
| `00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md` | `1XsxEj_AO4pXERB2b4VPElN1MAlAjF0mZ` | 27KB | md | `Agent read`（**3/3 chunk 全读**，含 R15–R20 视觉修订史）→ `PRODUCT_TRUTH.md`、`CATALOG_METHOD.md`、`CAD_LOG.md` |
| `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` | `1ZiCFZwu9WtuGROTaGvDowwBIAweeZU6f` | 3KB | md | `Agent read`（全文）→ `PRODUCT_TRUTH.md` §1–3 |
| `00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md` | `1J8Qo7vJ9mScbkepnj2acbxLKGS8aABNJ` | 9KB | md | `Agent read`（全文）→ 状态词表、目录结构、交换协议 |
| `00_EXP1-J09_DriveFolder_FileExchange_Link_CN_v1.md` | `1kvH9LNRVR-5eIIb_XOZcv2NHwwb1ld3R` | 2KB | md | `Agent read`（全文）→ 通道方法与 M8b |
| `00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1.md` | `1thWc6_dv07HdkzFJtEgk8xBUMxiQtWGG` | 17KB | md | `Agent read`（**2/2 chunk 全读**，D01–**D67**）→ `CATALOG_METHOD.md`、`CAD_LOG.md` |
| `00_EXP1-J00_Index_..._RunLog_CN_v1.xlsx` | `1dOaF7cZESaq7dC-S2DOb-OI-BSBWwHwX` | 27KB | xlsx | `Drive pointer stored`（未读；xlsx 需附件或 `fetch-drive.sh`） |
| `00_EXP1-J90_..._Recommendations_CN_v1.xlsx` | `1ezj1dcVJ01cr4nYDpfmjXO3M4-ucJ4aC` | 23KB | xlsx | `Drive pointer stored` |

## Folder 2 · Canonical（长期归档 = 用户指定的唯一文件往来通道）
`https://drive.google.com/drive/folders/14Enb5EiikE_EbIqReAp-oEqqPqg4EtSi`

| 文件 | FILE_ID | 大小 | 类型 | 状态 / 我要它做什么 |
|------|---------|------|------|--------------------|
| `CAD-贴锁-设计-stl.zip` | `1HlDJX0bcZY_ZbNKrUjoXj87Bp9M4inLN` | 473KB | zip | `Drive pointer stored` → trimesh 出精确 mesh + K1/K2 几何 QA（**铝框正确出图的唯一正路**） |
| `装配-DB-4-成功.FCStd` | `1uVdFpzdDQbS4WQBQ7bhIkwpJgOb0Vu2S` | 17KB | zip(FCStd) | `Drive pointer stored` → 核对装配关系（电池盖） |
| `装配- DB-4-DC-4-成功-3个FCStd`（子文件夹） | folder `1n5gFRP-AcLH8y1-Rqq9zKRueRgo3kIZ8` | — | folder | 见 Folder 2a |
| `nuki like lock smallest size all over world.mp4` | `1gmu4Lfyf1BazFjDE4-FXFns-HIHedG4t` | 1.3MB | mp4 | `Drive pointer stored` → **= 当前产品/样机**（registry §3）；抽帧当视觉参考 |
| `nuki like lock with mortise.mp4` | `1YR-QcQNO3NWLOaMojVCHoySqhf1FoMWs` | 356KB | mp4 | `Drive pointer stored` → = 外部安装参考，非产品事实 |
| `00_MTH-J07_NewAgent_Upload_Package_CN_v1.zip` | `1hw_Cc38zLgEqbtLcQicA1r9X17l0sptw` | 116KB | zip | `Drive pointer stored`（12 文件 + manifest/SHA256） |
| `00_MTH-J08_EXP1_Baseline_Required_Source_Package_CN_v1.zip` | `1tTMYwwZKcAuWpr0mdJFa6mZlLKIHSxhD` | 1.7MB | zip | `Drive pointer stored`（32 文件基线包） |
| `gtm_exp1_p1_core-agent1-upload-agent3.zip` | `1o0HybAfVLaZB0Swd7jMK3VO0tJA4Nvtw` | 272KB | zip | `Drive pointer stored`（Agent1 核心包，含 52/54/55/K01） |
| `07_SL-H03_SocialDM_Wave1_..._添加了已发送.xlsx` | `1kg0VuFVX5nppuYBx3HTWhL_1hBWCvtD1` | 15KB | xlsx | `Drive pointer stored` → 外联状态（DM 已发/回复）→ 目录封面大字取数 |

## Folder 2a · `装配- DB-4-DC-4-成功-3个FCStd`（子文件夹，已枚举）
`https://drive.google.com/drive/folders/1n5gFRP-AcLH8y1-Rqq9zKRueRgo3kIZ8`

| 文件 | FILE_ID | 状态 |
|------|---------|------|
| `装配-DB-4-成功.FCStd` | `1a4h7m__cpRPNrWHB-sA8j9MZpQx_kVCL` | `Drive pointer stored` → 与 Folder2 里同名件不同 id（两份，取这份还是那份需你确认） |
| `装配-db-4.FCStd` | `1hYHmEAJZZ9IJMe1MssVv5HH7b-eFkPZf` | `Drive pointer stored` |
| `装配-DC-4.FCStd` | `1PyQDppCv8aJsUDl18HZakXSbmk_9XRDP` | `Drive pointer stored` → DC-4 变体（与"成功"版差异需核对） |

## 实测结论（2026-09-20，两条路径各测一次，别再重复测）
| 目的 | 途径 | 结果 |
|---|---|---|
| 枚举 folder / 取 FILE_ID | `fetch_page` folder URL | ✅ 成功（含子文件夹） |
| 读 **md/txt** 正文 | `fetch_page` + `uc?export=download&id=` | ✅ 成功（Folder 1 的 4 份 md 全读） |
| 读 **zip/stl/FCStd/mp4** 内容 | `fetch_page` 同一端点 | ❌ **HTTP 500** |
| 读上面这些 | 沙盒 `curl` | ❌ **000**（白名单） |
→ 所以对你的问题「能不能自己从 Drive 读那 2 个 CAD 文件」：**不能**。二进制只有 ①聊天附件 ②你本机 `fetch-drive.sh`。
→ 这条边界就是项目自己 **D65** 的结论：无输入只能标"用户报告、尚未验证"，不得据此出正式角度图。

## 仍然缺（不在任何已枚举位置）
1. **底部电池盖 3 张装配截图（2026-09-20 新版）** —— 全项目唯一的电池盖装配证据；两个 folder 里都没有。
   ⚠️ 没有它，`K7` 无法通过，电池盖相关的任何图/文案我都不会生成（不再猜）。
2. `01_SL-B03_..._DesignerFinal_Hero_Source_v1.png`（面盖确认源，registry §10 指定优先级最高）—— 不在 folder 里。
3. `02_SL-B15` / `02_SL-B16`（目录资产盘点 + 文案草稿，md+xlsx）—— 做目录要对照，未枚举到。

## 取用纪律（写死，防再次膨胀）
- 文本类（md/txt/PDF）：我用 `fetch_page` 读，**读完只把要点写进本仓库 md，不存原文副本**。
- 二进制（zip/mp4/png/xlsx）：进 `/home/user/RetrofitLock/.scratch/`（已 gitignore）→ 分析 → 产结论 md → **删源**。
- 任何情况下**不把 CAD/视频/压缩包 push 到 GitHub**，包括 `90_archive/cad/`（该豁免已作废并收回）。
