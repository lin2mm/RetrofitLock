# 先查旧记录再动手 —— 可复用清单（避免重复劳动）

> 用途：**开工前 60 秒扫本页**。凡是这里已存在的，只"扩展/换依据"，**不重新做一遍**。
> 本轮就是教训：我起草了 9 页目录结构，而你们 09-14 已有 one-pager 草稿 + D61 规则；我还独立"发明"了
> CAD-to-render 优先的管线，而项目 **D66** 早写着。→ 立成规则：`consult-before-build`（见 `methodology.md`）。
> 状态列 = 我这边现在有没有实物：**指针** = 只在 Drive/文字里被提到，未进沙盒；**已读** = 内容已入库；**已建** = 我这边新写的。

## A. 视觉 / CAD（第①步要用）
| 旧资产 | 内容 | 我原本会重复做什么 | 现在怎么用 | 状态 |
|--------|------|-------------------|-----------|------|
| `09_GTM_Visual_FromFrozenProduct_ToAngles_ToScenes_Method_CN_v1.md`（D64） | 冻结图→多角度→场景的三段法 + `angle hypothesis` 标注 + **QA≥95/100** | 我自己定 QA 阈值与标注 | **阈值直接采用 95/100**，写进 `40_images/QA_ledger.md` K10 | 指针 |
| `09_GTM_AI_CAD_Combination_Capability_Assessment_CN_v1.md`（D66） | CAD=几何真源 / 视频=外观参考 / 冻结图=对外基准 / AI=助手与合成 | 我上轮独立写了 `cad-verified-render-pipeline` | **改为引用 D66**，我的脚本只是它的实现 | 已读要点 |
| `ImmutableCrop_Extract_v2.py` + `QA_Score_v2`（R20） | 1:1 原生像素裁剪（禁重绘/缩放/旋转/透视/重采样）+ 逐像素评分脚本 | 我重写一套裁剪与比对脚本 | **要文件本体**（≤1MB，走 `inbox` 通道）；拿到即用 | 指针 |
| `09_GTM_Visual_Input_Inventory_2026-09-15.md` / `09_GTM_Input_Asset_Audit_2026-09-15.md` | 输入清单+审计的**字段格式**（CAD 格式/单位/历史、视频遮挡/反光/比例一致性） | 我自拟登记表 | 用他们的字段做我的 `.scratch` 取用记录 | 指针 |
| `70_GTM_CAD_ClosedCover_KnobPanel_Frozen_And_AluminumCAD_Verification_v1_2026-09-19.md` | 面盖+旋钮+铝壳的验证清单与结论 | 我重新设计验证项 | **K1–K10 就是它的可判定化**；拿到原文后对齐措辞 | 指针 |
| `105_..._BottomBatteryCover_Geometry_Verification_Plan` / `107_..._FCStd_Downloaded_And_BottomCover_Geometry_Read` | 电池盖装配关系的读取与验证记录 | 我从 0 推断电池盖（历史翻车点） | **电池盖唯一合法依据之一**；拿到后我只需确认"与 O8 一致" | 指针 |
| `96_GTM_V4_Knob_Error_Cleanup_Manifest_2026-09-19.md` | 旋钮错误的清理清单（哪些别再引用） | 我重新踩同一批坑 | 并入我的禁止清单 | 指针 |
| `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` | 8 条禁止事项 + 8 个必读文件 | 我起草自己的禁忌 | ✅ 已全文抄进 `PRODUCT_TRUTH.md` §3（现按铁律加了"旋钮/logo 待重判"两条修正） | 已读 |
| `66_GTM_FrozenClosedCover_Knob_And_Envelope_Proportions_v1_2026-09-19.md` | 旋钮/包络比例记录 | — | ⚠️ **依据已被新稿取代**，只作差异对照 | 已读要点 |

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
5. 沿用 R19/R20 冻结底稿与"旋钮=近直角长条""无 logo"两条规则 → 你判定**全部有问题** → 已降级 `superseded`。
6. 把本沙盒 000 写成 Drive 普遍不通 → 真相是**每个沙盒策略不同** → 已改成"每次探测"。
