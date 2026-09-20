# Drive 读取台账（Session 5 · 2026-09-20）

工具：`fetch_page`（沙盒外网络）。方式沿用**用户项目自己的** `00_EXP1-J09_DriveFolder_FileExchange`：
列文件夹 → 取 file id → `uc?export=download&id=` 读正文。**已被证实可用**（我自己先前的"Drive 读不到"结论作废）。

## 文件夹 1 — `20260920-LockSession5`
id `1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT` · 枚举 ✅ · 7 项 · 全部为 md/xlsx（17–27KB）

| 文件 | 大小 | 本次状态 |
|------|------|----------|
| `00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md` | 27KB | `Agent read`（读了第 1/3 块，含验收报告 + Agent1/2 总结 + 缺口清单）→ 要点已并入 `PRODUCT_TRUTH.md`、`index_sessions1-4.md` |
| `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` | 3KB | `Agent read`（全文）→ `PRODUCT_TRUTH.md` §1–3 |
| `00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md` | 9KB | `Agent read`（全文）→ §4 状态词表、§5 目录结构、§6 交换协议；并修正 `capacity.md` |
| `00_EXP1-J09_DriveFolder_FileExchange_Link_CN_v1.md` | 2KB | `Agent read`（全文）→ 通道验证 + 协议 |
| `00_EXP1-J90_Methodology_GapFix_Recommendations_CN_v1.md` | 17KB | `Agent read`（chunk 1/2，D01–D55 + R12–R16）→ 已并入 `CATALOG_METHOD.md` |
| `00_EXP1-J00_Index_..._RunLog_CN_v1.xlsx` | 27KB | `User-reported`（xlsx，待转换或贴表） |
| `00_EXP1-J90_..._Recommendations_CN_v1.xlsx` | 23KB | `User-reported` |

## 文件夹 2 — Canonical（项目长期归档，registry §1）
id `14Enb5EiikE_EbIqReAp-oEqqPqg4EtSi` · 枚举 ✅ · 9 项 —— **CAD 与视频真源在这里**

| 文件 | 大小 | 状态 | 用途 |
|------|------|------|------|
| `CAD-贴锁-设计-stl.zip` | 473KB | `User-reported` | 铝合金外壳母件 STEP/STL + 尺寸；渲染几何真源 |
| `装配- DB-4-DC-4-成功-3个FCStd`（子文件夹） | — | `User-reported` | FreeCAD 装配（成功版） |
| `装配-DB-4-成功.FCStd` | 17KB | `User-reported` | 同上，单件 |
| `nuki like lock smallest size all over world.mp4` | 1.3MB | `User-reported` | = 当前产品/样机实拍（registry §3） |
| `nuki like lock with mortise.mp4` | 356KB | `User-reported` | = 外部安装参考 |
| `00_MTH-J07_NewAgent_Upload_Package_CN_v1.zip` | 116KB | `User-reported` | 12 文件交接包（含 manifest + SHA256） |
| `00_MTH-J08_EXP1_Baseline_Required_Source_Package_CN_v1.zip` | 1.7MB | `User-reported` | 基线源包 |
| `gtm_exp1_p1_core-agent1-upload-agent3.zip` | 272KB | `User-reported` | Agent1 核心包 |
| `07_SL-H03_SocialDM_Wave1_NoSend_CN_v1-添加了已发送.xlsx` | 15KB | `User-reported` | 外联状态表（含用户标注"已发送"） |

## Canonical 文件夹已读到的关键路径（用于对齐"沙盒里没有"这件事）
`00_MTH-J07_..._v2.md` chunk 2/3 读到完整时间线：Wave1 24 家 + SEA 20 家（H03 v1.3）、Wave2 24→17 家（H04 v1.3）、
Wave3 中东 13 家（H06）、H05 邮件 61 家、H08 反馈日志、G05/G06/G07 Brand360、C01 认证 14 市场、
`02_SL-B15` 资产盘点 + `02_SL-B16` 目录文案草稿、`05_SL-P01` 产品路线图、GEN-C00 v1.4 方法卡。
**这些文件我都没在沙盒里看到**（属上一个沙盒 + 已按 registry §11 清理）→ 状态一律 `Drive pointer stored / refetch on demand`。

## 未取得（诚实标注，不冒充）
- 二进制文件（zip / FCStd / mp4 / png）**沙盒内 curl 下不动**，`fetch_page` 只返文本；
  所以以上全为 `User-reported`。要走 `Agent read` 需：聊天附件（≤2MB 的这几个完全够小），
  或我收进 `90_archive/` 并记 SHA256（照 registry 纪律）。
- 用户 2026-09-20 新传的**底部电池盖 3 张装配截图**：不在上述两个文件夹里，需单独给。
- `/home/user/exp1/**` 在我这里不存在（那是上一个 session 的沙盒，且 registry §11 说明本地副本已被有意删除）。
  按 registry 规则我称其为 `Drive source indexed / refetch on demand`，**不会**假装能读。
