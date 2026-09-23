# LOOP AUDIT — 全部 loop 的唯一清单（长期文件）

> 你要的那个"包含全部 loop 说明的长期文件"就是这个。**回答"一共有多少 loop"以本页为准。**
> 计数快照：2026-09-23（Session 10 · S10-R6）· meta 规则 **12** 条（M0–M11）· 方法论 **35** 条 · 台账含 S10-R1–R6（R1–R3 事后补记）。
> **loop 全清单以本节 B 为准。** 其他文件只放指针，不再各写一套步骤。
> 当前里程碑 = 只建方法论 loop。不处理产品，不进入 GTM 执行。
> R10/R11 新增 `root-cause-before-rule`；R12 新增 `binary-artifact-capacity-discipline`（109 判废 + 容量考古）；R13 新增 `binary-starve-to-text`（STEP 文本自读 + OCP stub 配方，渲染栈本沙盒打通）。
> Session 10 更正：`PRODUCT_TRUTH.md` 的冻结值已降为待筛选。最高优先级改看 `session10_method.md` 的未裁定冲突，不把旧铁律当成当前事实。
> 维护规则：新增/废弃任何 loop，只改本页 + 对应正文；本页与正文冲突时以正文为准并把本页修正。

## A. Meta 规则（`00_meta/META.md`，12 条。步骤不在这里展开，看 §B）
| ID | 一句话 | 执行方式 | 状态 |
|----|--------|----------|------|
| M0 | 没进 GitHub 的东西不存在；`/home/user` 之外不持久 | 每轮末 commit+push | 有效 |
| M1 | 开局固定顺序：META → **PRODUCT_TRUTH** → Drive 索引 → 方法论 → HANDOFF → 自检 | 每个 session 开头 | 有效 |
| M2 | 每轮三件事：写日志 / 沉淀方法论 / 跑 capacity + commit | 每条消息末 | 有效 |
| M3 | **merge 闸门**：阶段完成只 push 工作分支；合 main 必须用户明确同意（否则 session 被终结） | 阶段末 | 有效 |
| M4 | 目录段与命名体系（数字前缀、图片文件名即元数据、状态码） | 建文件时 | 有效 |
| M5 | 单向数据流：90_archive → 10_product(真相源) → 图 → 目录 → 网站 | 任何派生前 | 有效 |
| M6 | 容量红线：工作树≤60MB、单文件≤25MB、交付图≤400KB、**二进制不入库** | capacity.sh | 有效（本轮按你指令强化） |
| M7 | 方法论四行格式 + 出处 + 状态 | learn.sh / 直接编辑 | 有效 |
| M8 | 跨 session 交接双通道：Drive 文本直链（`fetch_page`）+ git（`main`/`inbox`） | 要资料时 | 有效 |
| M8b | Drive 直链配方：folder→列 id→`uc?export=download`；预览页读不到正文 | 收链接时 | 有效（实测跑通） |
| M9 | 每条消息必须进台账 | `loop_ledger.md` | 有效 = L1 |
| M11 | 每轮回复给 2–4 条建议，不写成事实 | 回复中的「建议」节 | 有效 = L3 |
| **M10** | **workspace 卫生循环（你本轮要的）**：Drive/附件取源 → `.scratch/` 分析 → **只留结论 md + 文件夹索引** → 删源 → 需要时重新 fetch；**CAD/视频/压缩包永不 push GitHub** | `scratch.sh` + `fetch-drive.sh` | **新增·有效** |

## B. 当前要跑的 loop（2026-09-23 收束。旧的四段描述降为指针）

每条实质消息按这个顺序。产品阶段的检查不插进这个顺序。

| ID | 名字 | 何时 | 做到哪算跑过 | 规则 |
|---|---|---|---|---|
| L0 | 开局 | 每个 session 一次 | 读本页 + 台账最后 3 行 + 方法名列表 | M1。方法论阶段不打开产品正文 |
| L1 | 消息台账 | 每条用户消息 | `loop_ledger.md` 一行；漏记标明事后补记 | M9 |
| L2 | 方法论捕获 | 同一轮，做事之后 | 有新流程才追加；没有就在台账写原因 | M2 / M7。先查重。不用 `learn.sh` |
| L3 | 建议 | 每一轮回复 | 回复里有「建议」节，2–4 条，标建议不标事实 | M11 |
| L4 | 轮检 | 实质轮回复末尾 | 一行轮检 | 通用启动文件的可见记录，不另抄 7 步 |
| L5 | 合并闸门 | 任何 merge / 推 main 之前 | 默认否。用户本轮写「合并」才动 | M3 |
| L6 | 取用 | 只在授权读某个外部文件时 | 结论进文本；二进制不入库 | M10。本里程碑不触发 |
| L7 | 阶段 | 一个交付阶段结束时 | 报告并停。不自行标 FINAL | `stage-gate-without-merge`。本里程碑不触发 |

历史里同义、不再各写步骤的名字：M2 三件套、M9 台账、D43/D44、通用启动文件 4.1、`substantive-turn-visible-ledger`。它们都指向 L1+L2+L4。

## B2. 历史 loop 摘要（只谈循环，不谈产品）

| 来源 | 当时建立的 loop | 现在怎么用 |
|---|---|---|
| 2026-09-14 D43 | 每条消息检查要不要固化成方法，每条回复回写日志 | 太重，造成平行文档。收成 L2：没有新流程就写「无新增」 |
| 2026-09-14 D44 | 先查已有，再新增 | 仍有效。等于 `consult-before-build` |
| Session 5 M0–M2 | 不 push 等于不存在；开局阅读；每轮日志+方法+容量 | 仍有效。开局清单以 L0 为准，不在这里再列一份 |
| Session 5 M9 | 消息台账。R1/R2 是事后补记，因为当时还没有这页 | 仍有效。Session 10 的 R1–R3 又漏了，所以加 L4 轮检 |
| Session 5 M3 | 不提前 merge | 仍有效 = L5 |
| Session 5 M10 | 外部文件用完即删，二进制不入库 | 仍有效 = L6。没授权就不跑 |
| Session 5 阶段闸门 | 阶段完只报告，不合并、不标 FINAL | 仍有效 = L7 |
| 通用启动 v4 | 实质轮 7 步 + 回复末尾轮检；冲突先问 | 7 步不整份再存。留下 L4，冲突规则已有 `conflict-ask-not-third-system` |
| Session 10 S10-R5 | 把漏跑的台账补上，并写成可见 loop | 被本节替代为唯一清单。方法条保留，步骤不再复制 |

已知重复失败：台账规则写在文件里，回复没有可见步骤，就会漏跑。Session 5 一次，Session 10 一次。L3 和 L4 是针对这次重复的补丁。

## C. 方法论库（`00_meta/methodology.md`，20 条 = 有效 17 · 待验证 3 · 本 session 新增 13）
分组：A 跨 session 连续性（6）· B 获客链路（3，沿用项目 GEN/SL 的 M01–M13，待原文校正）· C 产品定义（4）· D 交付工程（7）。
本轮关键新增：`cad-verified-render-pipeline`、`failure-ledger-before-retry`、`two-network-paths`、
`drive-direct-link-intake`、`verify-artifact-not-status-label`、`never-edit-docs-via-bash-strings`、`self-export-at-source`。

## D. 脚本（10 个，幂等，可重复跑）
| 脚本 | 干什么 |
|------|--------|
| `capacity.sh [--fix]` | 空间/持久化/未提交/未推送/工具链自检；`--fix` 装缺失依赖（字体、ffmpeg） |
| `scratch.sh status\|clean\|purge` | `.scratch` 生命周期 + **证明二进制没被 git 跟踪** |
| `fetch-drive.sh <FILE_ID> <名>` | 你本机跑：把 Drive 文件拉进 `.scratch/`（沙盒 curl 不通，实测 000）并记 sha256 |
| `learn.sh <name> <板块> "问题" "做法" "为什么"` | 按 M7 格式追加方法论（内容别放反引号/`$`，会被 shell 吃掉） |
| `verify-upload.sh` | 附件是否真落地（不信 UI 的 "successful"） |
| `push-inbox.sh 文件...` | 把文件送进 `inbox` 分支（**不碰 main/会话分支**）——本沙盒唯一可靠的二进制入口，≤1MB |
| `pull-inbox.py [--get inbox/<名>]` | 按字节取回并打印 sha256（实测往返一致） |
| `probe-drive.sh [FILE_ID]` | **每次开局测本沙盒能否拉 Drive**（旧沙盒能、本沙盒不能 → 能力不可记忆） |

## E. 审计与溯源
| 文件 | 内容 |
|------|------|
| `00_meta/loop_ledger.md` | **每轮一行**：输入要点 / 沉淀 / 改了哪些文件 / **撤回了什么**（13 行，含我 8 次自纠：R2/R4/R5/R6/R7/R8/R9b/R11） |
| `00_meta/session_log.md` | 每个 session 收尾三行（做了/下一步/还缺） |
| `00_meta/intake/_READ_LOG.md` | Drive 读取台账：谁被 `Agent read`、谁只是 `Drive pointer stored` |
| `00_meta/DRIVE_INDEX.md` | Drive 全量 FILE_ID 索引 + 取用纪律（**这就是"保留的文件夹 index"**） |
| `00_meta/INDEX_session3_files.md` | **Session 3 文件索引（从已读文档重建）**：按 CAD 优先级列"该给我哪些旧文件" |
| `00_meta/REUSABLE.md` | **先查旧记录再动手**：可复用清单 20 项 + 我白做的 6 项（开工前 60 秒扫） |
| `00_meta/CAD_LOG.md` | CAD/视觉的**历史+分析+规则**（顶部有 SUPERSEDED 横幅）+ 最新稿可见特征 O1–O9 与【问】清单 |
| `00_meta/PRODUCT_TRUTH.md` | 产品冻结事实 + 7 条禁止事项（优先级最高的真相源） |

## F. 已知漏洞（诚实列出，别假装 loop 完美）
1. R1/R2 的台账是**事后补记**——当时还没有 M9；从 R3 起才是即时的。
2 `two-network-paths` 之前我有两版错判（"Drive 不通" / "gitignore 已修好"）——都是**没验证就断言**；
   现在的对策是每条断言配一个可跑探针（`check-ignore`、`verify-upload.sh`、`fetch_page` 对照实验）。
3. 沙盒缺 `libGL.so.1` → STEP 解析不可用；`.FCStd/.zip` 只能靠你附件或 `fetch-drive.sh` 送达。
4. `web_search`/`fetch_page` 能出网但**不能写回 Drive**，所以"我帮你同步 Drive"永远不成立（registry §2 已写明，我不再承诺）。
5. **Drive 二进制两条路都实测失败**（沙盒 curl = 000；`fetch_page` = HTTP 500，同一个 zip）→ 我**不能**自己从 Drive 取 CAD。
   于是把项目自己的 D65（"无输入不得生成正式角度图"）用在我身上：我前几轮那 2 张 AI 基线图判为违规产物，
   已标 `placeholder` + 待删。同时 `never-edit-docs-via-bash-strings` 本轮**再次触发**（一个补丁里反引号被当命令替换，
   导致 LOOP_AUDIT 一处没写上）→ 说明这条规则还不够硬：文档改动今后**必须**走 `edit_file`/`write_file`，
   `python3 - <<'PY'` 只用于无引号风险的纯逻辑。
