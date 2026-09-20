# LOOP LEDGER — 每条消息一行（M9 的落地处）

用途：证明"每条 message 都进了方法论 loop"是**事实**而不是态度。
规则：我每收到一条你的消息，就先在这里加一行再干活；没有增量也必须写明原因。
列：`轮` = 你第几条消息 · `输入要点` = 你实际说了什么（不是我以为的） · `沉淀` = 新增/更正的方法论 ·
`改了什么` = 文件 · `撤回` = 我上一条说错的东西。

| 轮 | 输入要点 | 沉淀 | 改了什么 | 撤回 / 更正 |
|----|----------|------|----------|-------------|
| R1 | 复述 S1–S4 各干了什么；问我需要什么文件才能接上 S5；问交接方式（图→目录→网站） | `cross-session-persistence-rule`、`no-ai-from-text-for-product-shots`、`one-source-of-truth`、`single-host-multi-accessory-series`（来自你回答） | 建 `00_handoff/`、`10_product/`、`40_images/slots.csv`、README 指向 HANDOFF | 无 |
| R2 | 「你每次都犯这个错误」；要顶层方法论优先、要 index 让我自选、要容量/空间 loop、**不许擅自 merge**、要 S1–S4 全量索引 | `tmp-is-not-durable`、`probe-before-promise`、`cjk-font-via-npm-not-system`、`sandbox-pdf-limitation-workaround`、`video-to-frames-for-refs`、`one-html-two-outputs`、`stage-gate-without-merge` | 建 `00_meta/`（META/naming/methodology/capacity/index/intake/scripts）+ `.gitignore` 挡大素材 | 撤回"把 Session 3 细节当重点推进"：改为顶层规则先行 |
| R3 | 指出"mark as successful"点错、实际没成功；**Drive 链接在别的 session 里一直能用**；说已上传 session3 的 md；追问是否还要企业资料与 S1/S2 索引；质问每条消息是否真进了 loop | `two-network-paths`、`verify-artifact-not-status-label`、`self-export-at-source`、`drive-direct-link-intake` | 更正 `capacity.md` 第 4 节（两条网络）；`META.md` 加 M8b（Drive 直链配方）+ M9（台账）+ M8 改为双通道；`index_sessions1-4.md` 送达方式更正；新增 `verify-upload.sh` 与本台账 | **撤两条错的**：① 我写"Drive 不通、别发链接"→ 错，沙盒 curl 不通 ≠ 工具读不到（对照实验：`fetch_page` 能读 example.com 与 Google 域名）；② 我写"外部素材只能靠聊天附件或 git"→ 已删 |
| R6 | 你给了 Canonical folder（CAD+视频在里头），并暴露出我漏读了 J90（31+ 条方法论 delta 早已存在） | 未新增方法，改为**继承**：新建 `CATALOG_METHOD.md`（8 步 + 9 页骨架 + D45 措辞）；`META.md` 写入项目自己的 **D44 元规则**（先查已有→引用更新→缺失才新增，delta 续编 D56+） | `00_meta/CATALOG_METHOD.md` 新建；`PRODUCT_TRUTH.md` 加 §3b 对外措辞 + §5b 目录状态；`_READ_LOG.md` 更新 J90 已读；`.gitignore` 放行 `90_archive/cad/*.zip` | 撤回我的"另起一套方法论命名"：改为沿用 `GEN/SL + Dxx` 体系；并更正：目录不是"重新设计"而是执行既有 B15/B16 计划 |
| R5 | ①设计图：电池盖/铝框**从未成功**，反复犯错 ②目录重做但**继承做目录的方法论** ③给了 Drive folder 链接 | 新增 `cad-verified-render-pipeline`、`failure-ledger-before-retry`（累计 20 条）；采纳项目原有状态词表（`naming.md` §4 映射） | 新建 `00_meta/PRODUCT_TRUTH.md`（冻结事实+禁止事项+交换协议）、`00_meta/intake/_READ_LOG.md`（两个 folder 全清单）、`40_images/QA_ledger.md`（K1–K8 可判定式）、图输出拆分 `CAD_Verified/` 与 `Hypothesis_Not_ProductTruth/`；README 顺序加 0 号必读 | **撤回我自己的两条限制结论**：① "Drive 链接不可用"→ 实测 `fetch_page` 能枚举 folder、能读 md 正文（正是项目 `00_EXP1-J09` 早就写好的方法）；② "需要企业资料清单"→ 冻结事实已在 Drive，不需要你重述；改为只要 4 个二进制资产 |
| R4 | 本轮：①"Mark as successful" 点错、实际没成功 ②Drive 在我其它 session 一直能用 ③已传 session3 的 md，问还要不要企业资料与 S1/S2 索引 ④每条 message 是否真进了 loop | 新增 `two-network-paths`、`drive-direct-link-intake`、`verify-artifact-not-status-label`、`never-edit-docs-via-bash-strings`（累计 15 条有效方法） | 更正 `capacity.md` §4；`META.md` M8 双通道 + M8b 配方 + M9 台账；`index_sessions1-4.md` 送达方式；新增 `loop_ledger.md`、`verify-upload.sh`；本行 | 撤两条错判：① "Drive 不通/别发链接"——沙盒 curl 不通 ≠ 工具读不到（对照实验证明）；② "附件已落在 /home/user/uploads"——实测该目录不存在，全盘 find 无匹配；另外我差点把 `/tmp/arena-workspace/coding.patch`（平台临时物）当用户文件收走，已排除 |

## 我此刻对你消息里那 3 个具体问题的答复去向
- 「上传的 session3 md」→ 沙盒里不存在（`/home/user/uploads/` 无此目录，全盘 `find` 无匹配）→ 已把"别信 UI 成功标签"写成方法 `verify-artifact-not-status-label`，并配 `verify-upload.sh`。
- 「Drive 是不是更好」→ 不是 Drive 更好，是**我之前判断错了**；两条通道都可用，Drive 直链成为你的默认通道（M8b）。
- 「每条 message 是否进了 loop」→ R1–R3 现在都有台账；R1/R2 是我**事后补记**（当时没有台账这个机制，这正是漏洞），从 R3 起是即时登记。
