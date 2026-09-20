# 先查旧记录再动手 —— 可复用清单（避免重复劳动）

> 用途：**开工前 60 秒扫本页**。凡是这里已存在的，只"扩展/换依据"，**不重新做一遍**。
> 本轮就是教训：我起草了 9 页目录结构，而你们 09-14 已有 one-pager 草稿 + D61 规则；我还独立"发明"了
> CAD-to-render 优先的管线，而项目 **D66** 早写着。→ 立成规则：`consult-before-build`（见 `methodology.md`）。
> 状态列 = **指针**（Drive 里有、我没读）/ **已读**（内容已入库，可直接引用）/ **已建**（我新写的）。
> 2026-09-20 更新：Folder 1 新增 7 份 md，其中 **4 份已读完**（111/113/01_A01/09_VisualMethod）→ 下表中**QA 评分制、FCStd 几何、取用纪律、claim 纪律全部变成"已读直接采用"，重复工作被消掉了。**

## A. 视觉 / CAD（第①步要用）
| 旧资产 | 内容 | 我原本会重复做什么 | 现在怎么用 | 状态 |
|--------|------|-------------------|-----------|------|
| `09_GTM_Visual_FromFrozenProduct_ToAngles_ToScenes_Method_CN_v1.md`（D64） | **✅ 已读（Drive 新件）**：Stage0–6 全流程 + **100 分 QA 评分表（8 维 + 6 红项）** + 3 个现成 prompt 模板（探索/合成/拒绝）+ 8 模块学习节奏 | 我自己定 QA 阈值、自拟 prompt、自创分阶段流程 | **整套直接采用**：`QA_ledger` 已换成他们的 100 分制；prompt 用他们的 A/B/C 模板 | **已读** |
| `09_GTM_AI_CAD_Combination_Capability_Assessment_CN_v1.md`（D66） | CAD=几何真源 / 视频=外观参考 / 冻结图=对外基准 / AI=助手与合成 | 我上轮独立写了 `cad-verified-render-pipeline` | **改为引用 D66**，我的脚本只是它的实现 | 指针（id 已知） |
| `111_GTM_Workspace_Refresh_Summary_2026-09-20.md` | **FCStd 已解析完**：db-4/DC-4 的 solid/face/edge/vertex、`SX_DC_GAI_4` 包络、Slider 运动副、103/104/106/108/109 产物、Gate 状态、历史错误保护清单 | 我要从 STL/FCStd 重算几何、重做电池盖 QA | **仅 Tier 1 引用**（数字已按 R16 裁出仓库，原件在 Drive）；Tier 0 出图**不碰**本节 | **已读** |
| `105_GTM_External_FCStd_..._Verification_Plan` | **9 步最短路径 + 8 视图清单 + 四态输出词 + A/B 双图规则 + battery_cover.step 替代方案**（§3/§5 原文） | 我重造 QA 流程和视图清单 | **逐字采用**（已入 CAD_LOG §3e / QA K14） | **已读** |
| `107_GTM_External_FCStd_..._Geometry_Read` | 内部几何数值（**已裁出仓库**）+ §6 七步渲染工序 | 我从零解 FCStd；或找不到的二进制干等 | **仅 Tier 1 引用数值**；工序=电池盖管线；Tier 0 一律不引 | **已读** |
| `101_GTM_Drive_FCStd_..._Render_Delete_QA` | 装配树 13 objects/Slider 引用边；6 条「旧图为何错」；97–100 删除链；**渲染前 6 步新闸门** | 我自己总结 109 教训、自定闸门 | 错误清单直接并入禁止事项；闸门=成品图前置 | **已读** |
| `94_..._Compacted_LongTermMemory` | 唯一工作范围 + **10 条后续硬规则**（组合唯一/内部件不出现/尺寸只认 sx-db-4.stp…） | 我重立视觉规则 | truth/§1ac 已指针化（R16 合并进 `CAD_LOG.md` 单源） | **已读** |
| `110_GTM_Workspace_Refresh_..._Protocol` | refresh 9 触发条件 + 「AI 说不能=强制 A–I 流程」+ 事实/判断/建议/待确认四分 | 我把它当新要求 | META M0/M9 与它对表；四分法即我【源/证/推/问】的母本 | **已读** |
| `102_..._TwoImageGate_And_HistoricalCleanupPlan` | 双图闸门（图1 最小变化验证→QA→图2 受控确认→用户闸门）+ 清理 6 步安全检 + 8 条不可变禁令 + 状态词表 | 我自定「一张候选图直接给你」的节奏；删档无安全检查 | **两图节奏照搬**；清理时执行 6 步检（M10 加严） | **已读** |
| `70_..._Verification` | 三源锁定表（壳=STEP/面盖=确认稿/旋钮=66）+ 禁反推条款 | — | 与我现行 §0 铁律逐条同构 → 引用即可 | **已读** |
| `09_GTM_Visual_Input_Inventory_2026-09-15.md` | CAD 包真相=**5 STEP 无 STL**（全单实体 mm）；视频已抽帧，明细在 3 份待解出的报告 | 我以为 zip 里是 STL 网格 | 渲染轮按 STEP（NURBS）处理，OCP 正合适 | **已读** |
| `113_GTM_Workspace_Compression_..._Completion.md` | 快照 92,354,796B / 355 files / SHA256 `a0300a56…`；按需 refetch 六步法 | 我另造一套取用流程 | 我的 M10 与它**对齐**（先读 index→只取所需→校验→做→删） | **已读** |
| `01_EXP1-A01_ProductTruth_Check_CN_v1.md` | 产品事实表 + **claim 禁用清单**（HomeKit/Matter/Thread/Airbnb/BHMA/ANSI/world's smallest）+ 证据标签【源/证/代/推/问】+ 统计闸门 + 对外语气规范 + **银黑转换需确认** | 我重做 claim 纪律、重定文案口径 | 直接采用；已加 K11（银黑需确认） | **已读** |
| `ImmutableCrop_Extract_v2.py` + `QA_Score_v2`（R20） | 1:1 原生像素裁剪（禁重绘/缩放/旋转/透视/重采样）+ 逐像素评分脚本 | 我重写一套裁剪与比对脚本 | **要文件本体**（≤1MB，走 `inbox` 通道）；拿到即用 | 指针 |
| `09_GTM_Visual_Input_Inventory_2026-09-15.md` / `09_GTM_Input_Asset_Audit_2026-09-15.md` | 输入清单+审计的**字段格式**（CAD 格式/单位/历史、视频遮挡/反光/比例一致性） | 我自拟登记表 | 用他们的字段做我的 `.scratch` 取用记录 | 指针 |
| `70_GTM_CAD_ClosedCover_KnobPanel_Frozen_And_AluminumCAD_Verification_v1_2026-09-19.md` | 面盖+旋钮+铝壳的验证清单与结论 | 我重新设计验证项 | **K1–K10 就是它的可判定化**；拿到原文后对齐措辞 | 指针 |
| `105_..._BottomBatteryCover_Geometry_Verification_Plan` / `107_..._FCStd_Downloaded_And_BottomCover_Geometry_Read` | 电池盖装配关系的读取与验证记录 | 我从 0 推断电池盖（历史翻车点） | **电池盖唯一合法依据之一**；拿到后我只需确认"与 O8 一致" | 指针 |
| `96_GTM_V4_Knob_Error_Cleanup_Manifest_2026-09-19.md` | 旋钮错误的清理清单（哪些别再引用） | 我重新踩同一批坑 | 并入我的禁止清单 | 指针 |
| `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` | 8 条禁止事项 + 8 个必读文件 | 我起草自己的禁忌 | ✅ 已全文抄进 `PRODUCT_TRUTH.md` §3（现按铁律加了"旋钮/logo 待重判"两条修正） | 已读 |
| `66_GTM_FrozenClosedCover_Knob_And_Envelope_Proportions_v1_2026-09-19.md` | 旋钮/包络比例记录 | — | ✅ **旋钮规格唯一有效依据**（并入 `KNOB_LOG.md` §1，R18 恢复有效） | 已读要点 |

## B. 目录 / 宣传（第③步要用）
| 旧资产 | 内容 | 免掉的重复工作 | 状态 |
|--------|------|----------------|------|
| `09_GTM_OnePager_RetrofitSmartLock_Content_Draft_EN_CN_v0.1.md` + Silver/Black `.docx` | **已经写好的第①步交付物**（白底/大留白/银黑独立/单一 CTA，NoSend） | 我原计划新写一页文案 → 改为**扩展 v0.1** | 指针（**请优先给我这份**） |
| `02_SL-B15_Marketing_AssetAudit_Plan_CN_v1.md/.xlsx` | 资产分层：当前可用/待恢复/仅参考/禁止公开 | 我不必自己盘点素材 | 指针 |
| `02_SL-B16_Marketing_CopyDraft_Catalogue_Website_Email_EN_CN_v1.md/.xlsx` | 12 天计划 + EN-CN 文案草案 + website/email readiness | 我不必重写文案与站点结构 | 指针 |
| `03_SL-C01_MarketLegal`(14 市场认证矩阵) / `04_SL-K01` 成本模型 | 认证入场顺序与价格基线（中国成品 $59.20 vs 美本地组装 $69.32） | 目录 P8/P9 页不必重查 | 指针 |
| `00_EXP1-J00_Index_..._RunLog_CN_v1.xlsx`(27KB) | 12 方法状态 + delta 台账 | 我不必重建索引 | Drive 里有，`fetch_page` 读不了 xlsx → 走 inbox 通道 | 指针 |
| `08_GEN-C00_方法论卡 v1.4`（含 **12 视觉QA**） | 方法卡正文（M13 协议、信源注册表、活性检查、渠道分层、视觉 QA） | 我"另立方法论"的冲动 | 规则层**全部指向它**，我只做本项目实例化 | 指针（部分要点已读） |

## C. 通道 / 环境（别再重新发明）
| 结论 | 出处 | 现状 |
|------|------|------|
| 沙盒内 curl 拉 Drive | 旧沙盒 ✅（J07 R15 实测拉过 CAD zip+2 视频）；本沙盒 ❌（000） | 每次跑 `probe-drive.sh`，能力不记忆 |
| `fetch_page` 可读 Drive **文本**（folder 枚举 / md 正文） | 我本轮实测 ✅ | 已写进 `META.md` M8b |
| `fetch_page` 读二进制 ❌（HTTP 500） | 本轮实测 | 同上 |
| **GitHub `inbox` 分支 = 按字节送文件进沙盒**（≤1MB，sha256 已验证一致） | 本轮实测（push→pull→cmp→sha 全通过） | ✅ 新通道：`push-inbox.sh` / `pull-inbox.py` |
| 聊天附件会**静默失败** | 本项目 3 次（含改名后的 `确认设计稿`） | 每次发完必跑 `verify-upload.sh` |

## D. 我上几轮白做/做错的（记录以免再犯）
1. 起草 9 页目录骨架 → 与 **D61** 冲突（应先 one-pager）→ 已按 D61 改。
2. 独立"发明" CAD-to-render 管线 → 等于 **D66** → 改为引用。
3. 自拟 QA 阈值"不过就不给看" → 项目已有 **≥95/100（D64）** → 采用他们的。
4. 生成 2 张 AI 基线图 → 违反 **D65/R-22** → 已删除并记违规。
5. 沿用 R19/R20 冻结底稿与"无 logo"规则 → 你判定有问题 → 已降级 `superseded`；"旋钮=近直角长条"规则当时被误标作废，R18 已更正（规格有效，见 `KNOB_LOG.md` §1）。
6. 把本沙盒 000 写成 Drive 普遍不通 → 真相是**每个沙盒策略不同** → 已改成"每次探测"。
7. 差点自己重跑「电池盖装配关系」分析 → `107`/`101` 已把 FCStd 解析完（placement/体积/bbox 全给了）→ R12/R13 扫记录截停，`consult-before-build` 生效（本轮连 8 视图清单都省了：`105` §4 现成）。
8. 差点自拟「渲染要等出网 session」的限制 → 实际 gcc stub 119 个 GL 符号就打通 OCP headless → R13 立成 `binary-starve-to-text`（#25）：限制要么当场实测要么写明沙盒，禁止写成项目规则。
