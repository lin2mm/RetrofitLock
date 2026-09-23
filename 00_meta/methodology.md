# METHODOLOGY — 历史方法条目档案（35 个标题）

> **2026-09-23 收束：现行方法只查 [`METHOD_CURRENT.md`](METHOD_CURRENT.md)。** 本页保留旧 35 条用于出处审计；不再作为开局入口或新规则的追加目标。旧条目的自动 Git、环境限制和产品状态不自动生效。结案分类见新文件 §4。
> 原“只增不删”的记录习惯仅说明这份历史文档的保留方式，不阻止在唯一现行入口中修订错误。
> 收录标准：换个产品、换个 session 仍然有用。产品参数不是方法论，去 `10_product/`。
> 引用方式：后续 session 直接写「按方法 `xxx` 办」，不要重述。

---

## A. 跨 session 连续性

### cross-session-persistence-rule
问题：多轮 session 做同一个项目，前面成果反复丢失。
做法：① 每轮末 commit + push 到同一分支；② 交接信息写成文件而非依赖对话记忆；③ 固定开局阅读顺序（`META.md` M1）；④ 每轮 append `session_log.md`。
为什么：沙盒销毁后唯一活下来的只有远端仓库；"我记得"在新 session 等于零。
出处：Session 5 — 2026-09-20 | 状态：有效（本 session 实测：四个前序 session 产出全丢，仓库只剩空 README）

### tmp-is-not-durable
问题：在 `/tmp` 装好大依赖（如 209MB chromium）当下能用，下个 session 全空。
做法：所有要留的东西放 `/home/user` 下；重装一律写成脚本（`00_meta/scripts/capacity.sh --fix`）而不是记笔记。
为什么：Arena 快照只收 `/home/user`，且排除 `.cache/.npm/.local/node_modules/dist` 等目录。
出处：Session 5 — 2026-09-20 | 状态：有效

### probe-before-promise
问题：答应能力范围外的交付（如"给你 Drive 链接我就能读"），到执行才发现网络白名单。
做法：任何"能不能"先花 60 秒实测（`curl -o /dev/null -w "%{http_code}"`、装包试跑），再回答；结论写进 `capacity.md` 的能力表。
为什么：本沙盒只有 `github.com`/`api.github.com`/`codeload`/npm/PyPI 通，其余（Drive、Figma、Dropbox、jsdelivr、unpkg、raw.githubusercontent、Google Fonts、gstatic、conda、apt 源）全不通；凭直觉回答会反复给用户同一条错误建议。
出处：Session 5 — 2026-09-20 | 状态：有效（用户指出"你每次都犯这个错误"）

## B. 出海获客 → 承接（Session 1→3 的链路，待原文核对）

### ladder-market-to-icp
问题：市场数据一堆，但不知道该找谁说话。
做法：爬取/竞品数据 → 先出"谁会为这个省下的钱或时间付账"（ICP）→ 再定切入话术；市场研究稿本身不进入后续环节。
为什么：研究的价值是收敛成 2–3 个可执行画像，不是覆盖面。
出处：Session 1–2（待用户确认原表述）— 状态：**待验证**

### dm-to-catalog-handoff
问题：DM 客户回"发个目录给我"，随手发的 PDF 却答不了他真正问的那句。
做法：把 DM 里出现频率最高的提问原话抄下来 → 每一条必须能在目录某一页被直接回答；目录首页大字 = 回复率最高的那句话。
为什么：客户回你一句话的成本极低，接不住就断在漏斗第一步。
出处：Session 3（待用户确认原表述）— 状态：**待验证**

## C. 产品定义与资料

### single-host-multi-accessory-series
问题：一款产品想做"适配全球各种锁"，容易滑成几十页重复内容 + 几十倍图片工作量。
做法：结构化为 `1 主机 × N 配件(适配/装法) × K 个 ICP 版本`；目录写"兼容矩阵 + 按 ICP 选配件包"，产品页只有一份；主机渲染 1 次，换配件/门型/背景延展系列。
为什么：把差异放进表格与配件图，避免重复劳动；也避免客户看到 8 页长得很像的产品页。
出处：Session 5 — 2026-09-20（用户定义）| 状态：有效

### one-source-of-truth
问题：目录、图、网站三处参数打架，改一处漏两处。
做法：`10_product/` 为唯一源，其它产物全部派生；冲突时先改源文件再重出产物；未知项统一 `[待确认]`。
为什么：视觉稿和数据表同时"就地编辑"必然漂移。
出处：Session 5 — 2026-09-20 | 状态：有效

### no-ai-from-text-for-product-shots
问题：纯文字生成的产品图，每个 SKU 造型都不同，客户一眼看出是 AI。
做法：必须有真实参考图（设计稿导出图 / 实拍抽帧）作 `generate_image` 的 `images` 输入做图生图；无参考图时只出 `PLACE` 风格基线，禁止外发。
为什么：AI 保不住几何一致性，只能保住光照与构图风格。
出处：Session 5 — 2026-09-20 | 状态：有效

## D. 交付工程（中英双语 / PDF / 网站）

### cad-verified-render-pipeline
问题：铝合金边框 + 底部电池盖的产品图**一直生成不出来**，多轮反复失败，从未成功过一次；AI 文生图根本保不住这两处几何。
做法：① 几何只从 CAD 取（`sx-db-4.stp` / `CAD-贴锁-设计-stl.zip` / `装配-DB-4-成功.FCStd`，包络 39.8×22.5×90.5mm）；
 ② 渲染走 mesh → 我自写 z-buffer + 朗伯着色（或 three.js + 用户浏览器出高清图），**禁止 AI 画产品主体**；
 ③ AI 只允许用在场景/手部/门这些背景元素上，且产品区域由 CAD 图**贴回**（inpaint 产品区锁定）；
 ④ 出图前先跑几何 QA：包围盒尺寸、底部 R 角、面盖连续性、旋钮比例，任一项不过 = 自动作废不给人看。
为什么：本沙盒 `cadquery/OCP` 已装但缺 `libGL.so.1`（无 root 装不了）→ 若 STL 分支可用（`trimesh` 读 STL/OBJ 不需 OCP），
直接绕过 CAD 内核；这也解释了为什么"再试一次 AI"永远失败：错误在**管线**而不在提示词。
出处：Session 5 — 2026-09-20（用户："还没生成过成功的铝合金边框与正确电池盖的图"）| 状态：有效（STL 到手即跑通）

### failure-ledger-before-retry
问题：同一个部件（电池盖 / 铝框）反复犯错，每轮都从头猜，纠错不累积。
做法：每次用户纠正落成一条硬记录：错在哪 → 用户原话 → 禁止项（"不得从面盖稿反推厚度/R 角"、"不得引用已删除的 71–93 记录"）→
 可判定验收式（"R 角：底视轮廓四角半径>0"）→ 对应 QA 脚本。生成之前先读该部件的 ledger，**把验收式当 prompt 的一部分与出图后的断言**。
为什么：上一线就是这么做的（`60_GTM_ConfirmedClosedCover_KnobSource_Crop_v1.png` + `96_GTM_V4_Knob_Error_Cleanup_Manifest` +
 `70_..._Frozen_And_AluminumCAD_Verification`），它把"纠错"变成机器可判定的约束而不是设计师的印象；任何渲染器没有这套硬约束都会重复犯错。
出处：Session 5 — 2026-09-20 | 状态：有效（本 session 建 `40_images/QA_ledger.md` 承接）

### one-html-two-outputs
问题：目录 PDF 和网页版各写一遍，改文案要改两处。
做法：`50_catalog/catalog.html` 用 A4 `@page` + print CSS，同一份既 Ctrl+P 出 PDF 又是网页版；Step ④ 网站继续复用。
为什么：双语排版一旦分叉，中文先烂。
出处：Session 5 — 2026-09-20 | 状态：有效

### cjk-font-via-npm-not-system
问题：沙盒零系统字体，中文一律豆腐块；apt 源不通装不了字体包。
做法：`npm i @fontsource/noto-sans-sc` 拿 woff2（浏览器/PDF 排版用）；PIL/fpdf2 需要 ttf 时用 `fonttools` 或找 ttf 包转换。
为什么：npm/PyPI 在本沙盒是通的，系统包管理器不通。
出处：Session 5 — 2026-09-20 | 状态：有效

### sandbox-pdf-limitation-workaround
问题：headless Chromium 起不来（缺 `libnss3/libnspr4/libnssutil3`），apt 又装不了 → 沙盒内无法 `page.pdf()`。
做法：优先级 ① 交付 print-ready HTML 让用户浏览器导出（矢量、字体最正）；② 需"可直接下载的文件"时用 `fpdf2` 出图片版式 PDF；③ 想真矢量则补 `.so`（未验证，先试 `index_sessions1-4.md` 里的 GitHub 通道）。
为什么：绕不过的系统库缺口只能用"谁来排版"换掉；网站不受影响（HTML 本来就在用户浏览器里渲染）。
出处：Session 5 — 2026-09-20 | 状态：有效（③ 待验证）

### video-to-frames-for-refs
问题：客户/工厂只给视频，不给照片。
做法：`pip install imageio-ffmpeg`（自带 static ffmpeg）→ 抽帧 1fps、宽 1600px → 挑 20–30 帧当 `40_images/refs/`；视频本体不进 git。
为什么：图生图只需要少量干净帧，整片 500MB 会把仓库与 patchset 撑爆。
出处：Session 5 — 2026-09-20 | 状态：有效

### stage-gate-without-merge
问题：阶段一完成就去 merge，session 被结束，长链条任务断掉。
做法：阶段末只 commit + push 到工作分支并报告，等用户明确说"合并"才 merge（`META.md` M3）。
为什么：Arena 用分支跟踪 session；merge = 该分支对话终结。
出处：Session 5 — 2026-09-20（用户硬性要求）| 状态：有效

---

## 待用户确认才能升级为"有效"的条目
上面 B 组三条是从你口述的 session 1–3 流程**反推**的，等 `00_meta/index_sessions1-4.md` 的 S2-A/S2-B/S3-E/S3-F 原文到齐后校对措辞；
如果原方法和我写的不同，以你的原文为准，我的版本改成 `已废弃`。


### self-export-at-source
问题：跨 session 要拿回前序成果，但沙盒互不可见、外部网盘不通
做法：在每个旧 session 里粘一段固定提示词，让它自己把经验压成 00_meta/intake/sessionN_*.md 并 push 到仓库公共着陆区；新 session 只需 git merge 进来
为什么：让最了解那段工作的是产出它的 session；用户复述必然丢信息，人工搬运必然漏文件，而 push 通道是实测唯一稳定可写的口
出处：Session 5 — 2026-09-20 | 状态：有效

### two-network-paths
问题：我断言"外部资源不可达、别发 Drive 链接"，但用户在别的 Arena session 一直用 Drive 链接成功 → 我的"实测"给了错误结论。
做法：任何"能不能访问 X"的判断，必须用**将来真正会执行它的那条路径**测，而不是就近找个代理工具：
  · `bash`/`curl` = 沙盒内，白名单（只有 github.com / api.github.com / codeload / npm / PyPI）
  · `fetch_page` / `web_search` = 工具侧网络，沙盒外，**不在该白名单约束内**
  对照实验：同一 URL 两个工具各打一次（本轮 `example.com`：curl 000 / fetch_page 成功；`workspace.google.com`：fetch_page 成功）。
为什么：沙盒网络与工具网络是两套出口，结论可以相反；用沙盒 curl 的结果回答"我的工具能不能读"是范畴错误。
这类错误的代价是**反复给用户同一条错误限制**（用户已指出"你每次都犯这个错误"）。
出处：Session 5 — 2026-09-20 | 状态：有效

### drive-direct-link-intake
问题：用户想发外部文档，但 Drive 的分享链接是 HTML 预览页（只有 JS 壳），抓不到正文；而沙盒里又不能落文件。
做法：按"取内容"的端点要链接 ——
  · 原文件（推荐）：`https://drive.google.com/uc?export=download&id=<FILE_ID>`，FILE_ID 取分享链接里 `/d/` 与 `/view` 之间那串
  · Google Doc：`https://docs.google.com/document/d/<ID>/export?format=txt`
  · 共享权限：任何拥有链接的人 = 查看者
  · 我读到内容后**立刻**另存进 `00_meta/intake/` 并 commit（对话里读过不保存 = 再丢一次）
为什么：只有导出/下载端点返回纯内容；预览页对无 JS 的抓取器等于空页；持久化仍以仓库为准。
出处：Session 5 — 2026-09-20 | 状态：有效（首次用到时再验一次真实 FILE_ID 是否返回 200 而非登录跳转）

### verify-artifact-not-status-label
问题：UI 显示"上传成功 / Mark as successful"，但沙盒里根本没有该文件（本轮 `00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md` 即如此），我却差点当成已收到。
做法：凡是"用户已经提供了 X"的判断，用**一次文件系统证据**替代信任标签：
  `bash 00_meta/scripts/verify-upload.sh`（扫候选落地路径 + 按扩展名做时效搜索；找不到就明说"没落地"并立刻给替代通道 Drive 直链 / 贴文本）
  同时排除平台自己的临时物（`/tmp/arena-workspace/*`），否则会误把 `coding.patch` 当用户文件收下。
为什么：成功标签衡量的是上传请求，不是"投递进本沙盒"；两者之间没有任何保证。
出处：Session 5 — 2026-09-20 | 状态：有效

### never-edit-docs-via-bash-strings
问题：我把文档内容写在 bash 双引号字符串里（含反引号与 `$`），shell 先做命令替换，把内容吃掉/写坏（本轮 3 条方法论被截成乱句）。
做法：改文档一律用 `write_file`/`edit_file`；脚本只做纯追加（`learn.sh`）且避免在参数里塞反引号/`$`/尖括号 URL。
为什么：shell 的展开发生在我的工具之前，任何"看起来没事"的输出都可能已被改写；这是静默损坏。
出处：Session 5 — 2026-09-20 | 状态：有效（我自己刚踩）


### sandbox-capability-probe-not-memory
问题：同一个能力（从 Drive 拉文件）在不同 session 结果相反：旧沙盒能、本沙盒不能 → 我把某一次实测写成了永久规则
做法：能力一律写成探针脚本每次现测，文档里只记'当前沙盒的观测 + 日期 + 对照记录'，不记'世界规律'；已建 00_meta/scripts/probe-drive.sh（域名可达性 + 真实下载测试 + 按结果给 A/B/C/D 方案）
为什么：Arena 每个 session 是新建沙盒，网络出网策略与预装软件都可能不同；把某沙盒的实测当普适真理，就会像本轮一样给出'你不能自己取 CAD'这种只对当前环境成立的结论，用户会反复纠正
出处：Session 5 — 2026-09-20 | 状态：有效

### consult-before-build
问题：新 session 一上来就设计交付物与规则，结果与项目已有资产重复甚至冲突（本轮我起草 9 页目录，而项目 D61 要求先做一页 one-pager；我又发明了 D66 已写的 CAD-to-render 管线、自拟了 D64 已有的 ≥95/100 QA 阈值）。
做法：开工前 60 秒扫 `00_meta/REUSABLE.md`：命中 → 引用+扩展（不重做）；未命中 → 才新建，并在那里登记"我用了谁的、差异在哪"。
     每次发现自己重复造轮子，就往 `REUSABLE.md` §D 追加一条。
为什么：重复劳动的根源不是懒惰，是**开工时没有可读的"已有资产账本"**；把它做成固定第一步，比指望我记得可靠。
     本轮实证：项目早已有 one-pager 草稿（D61）与 CAD-to-render 管线（D66），我各自重做了一遍。
副作用记录：本条目首次写入时用 `bash -c "python3 -c \"…\""`，反引号被当命令替换 → `REUSABLE.md` 险被当输出重定向目标
（因目录权限拒绝而侥幸未损坏），且正文里的文件名被吃掉。→ 已由 `edit_file` 修复；规则见 `never-edit-docs-via-bash-strings`。
出处：Session 5 — 2026-09-20（用户指出是否加入了一个环节：之前有哪些记录可以参考）| 状态：有效

### root-cause-before-rule

**状态：有效**

> 失败要先定位在**哪一层**（DNS / TCP / TLS / HTTP / 工具的内容类型），再写成规则。
> 只凭一次工具报错就立规则 = 大概率把"环境策略问题"误写成"能力边界"。

做法：报错先跑 `curl -v`（看是否 `Connected`）+ 一个已知可用域名做对照（github/npm/PyPI）+ 同一工具的文本类对照（md vs png/zip）。
为什么：2026-09-20 实证——我写"沙盒取不到 Drive"，你追问后实测 **TCP 连上、TLS 被 egress 白名单掐断**；
     `fetch_page` 是**内容类型**限制（md 成功、png/zip 与 `lh3` 缩略图一律 500）。规则因此才收敛为：
     每沙盒策略不同 → 开局 `probe-drive.sh`；**文本我自己从 Drive 读，只有二进制才提 inbox**。
附带义务：**不给用户加动作**——你既有通道能用的我一律继续自己用；要新步骤必须附实测证据与理由。
出处：Session 5 — 2026-09-20（你问"以前只要 Drive 链接，为什么现在要多一步 push"）

### binary-artifact-capacity-discipline

**状态：有效**

> 沙盒里一切二进制（CAD/视频/图片/快照）默认**用完即走**；容量事故不是「东西太大」，是「东西太多代」。

问题：session4 容量爆掉那天没来得及投诉（109 错位）。考古 `112/113`：355 files / 100.79MB 的构成 =
     zip+解包同存、同资产 v1/v2 并存、视频+全量抽帧、uploads 不清、**92MB 抢救快照也留在本地**（爆前夜正好做的）。
做法：四条硬规则——① 一个资产只存一种形态（zip XOR 解包目录）② 新版本替代旧版本并删旧（禁 v2/v3 堆叠）
     ③ 视频抽帧只留 1 张 contact sheet，帧图与母带即删 ④ 快照/抢救包**生成即离机**（传 Drive 或 inbox + sha256 入 index），本地不留。
     `capacity.sh` §3 已加「二进制堆积计数」（>12 个 CAD/视频/zip/obj 即 WARN）。
为什么：128MB 是 patchset 上限；`.git` 只存文本的策略防不了**工作区**膨胀，只有「即删 + 离机」防得住。
出处：Session 5 — 2026-09-20（你问「能看出来 session3/4 为什么突然多很多文件超容量么，总结防以后」）

### binary-starve-to-text

**状态：有效**

> 沙盒取不到二进制时，第一反应不是换存储，而是**把数据降级成文本格式**（STEP/IGES/OBJ/CSV/md/SVG）——
> 文本通道（`fetch_page` 分块）几乎总是通的；同时本地能力缺失先试「stub/纯 CPU」自修复，再谈找外部 session。

- 2026-09-20 双向实证：① `sx-db-4.stp` 222KB 是文本 → 从「拿不到 CAD」变成「我随时能全量自读」；
  ② pip 装不了 libGL 系 → gcc 空 stub + `nm -D` 提取 119 个 GL 符号编进假 `libGL.so.1` → **OCP headless 可用**（配方在 `capacity.md` §4c）。
- 反例（不要做）：把同一需求说成「只能等出网开放的 session」——那是把"当前通道失败"再次写成规则（R11 同族错误）。
出处：Session 5 — 2026-09-20（你问「能从以前的方法论学会取 STL 吗」，答：能，且这次把渲染栈直接打通了）

### tiered-output-before-pipeline

**状态：有效**

> 出任何产物前先分型：**这份要满足到什么级别**（提案级/对外级），级别决定管线深度与取证成本。
> 完备做法存在 ≠ 当前任务必须用它；把 Tier-1 前置成一切动作的闸门 = 死磕模式的定义。

做法：两级表 + 三步法 + 「两轮不过就降级提问」写死在 `00_meta/SHORTPATH_IMAGES_CN_v1.md`；凡"缺文件"的冲动，先查该文件是否只服务于更高级别。
为什么：2026-09-20 实证——session4 死磕 CAD 做不出一张图；同日我差点重演（计划拉 STEP 全文→网格化→8 视图才肯出图）；
     你一句「只要外观图，提取尺寸足够」后，从分型到交付两张候选图只用了 ~10 分钟、零新文件。
出处：Session 5 — 2026-09-20（你的 R15 批评）

### prompt-single-source

**状态：有效**

> 生成类任务（图/文）的约束**只允许来自一个指定单一来源文件**；引用其它记录里的数字/措辞进 prompt = 干扰注入。

做法：每个任务在合并文档里点名其单一来源（产品图=`CAD_LOG.md` §1–§3）；其它 md 只放指针不放数值；
     发现"从 A 文档抄了个细节进 prompt"就记入该文档的干扰台账（`CAD_LOG` §4 格式：来源→怎样带偏→处置）。
为什么：2026-09-20 实证——prompt 混入 A01 氧化黑、101「matte/frosted」、107「4 条加强筋」、旋钮被自创为"凸起把手/胶囊条"（有效规格被误用，R18 记 `KNOB_LOG`）后，
     外观图偏离确认稿（用户："为什么跑那么远"）；这些文档各自没错，错在被拉进**生成**环节。
     信息量的正确形态是"仓库里可查、prompt 里单源"。
出处：Session 5 — 2026-09-20（R16 防干扰指令）

## E. Session 10 瘦身（2026-09-23）

> 只加流程。产品参数、目录草稿里的数字、Validated 标签，都不进本节。
> 工作入口是 `session10_method.md`。冲突未裁定前，不另写第三套文案。

### historical-label-not-evidence
问题：旧文件写着已读、Verified、FINAL、100 分或 Validated，下个 session 当成当前事实。
做法：标签只表示「曾经有人这样标」。当前事实要有本 session 的原文或实测。对不上就标待筛选。
为什么：同一项目里，后一次用户裁定会废掉前一次冻结；标签不会自己过期。
出处：Session 10 — 2026-09-23 | 状态：有效

### extend-named-draft-not-rewrite
问题：目录、网站、one-pager 已经有具名草案，新 session 仍从空白重写。
做法：先查 `session10_method.md` §1。命中就引用或标待筛选，不新写平行稿。xlsx 与同名 md 不双读。
为什么：重写会丢掉 NoSend 和 claim 黑名单，也会和后出版本打架。
出处：Session 10 — 2026-09-23 | 状态：有效

### three-bucket-slim
问题：历史文件又多又含废弃错误，全读或全信都会把错误带进新稿。
做法：每份只进三桶之一：继承规则、待检查、筛出工作集。筛出不等于删除。结论收成一页，不复制正文。
为什么：容量和错误都来自多代并存，不来自「还没读够」。
出处：Session 10 — 2026-09-23 | 状态：有效

### conflict-ask-not-third-system
问题：两份旧规则冲突时，Agent 按优先级自己选边，或再写一套「综合版」。
做法：列出冲突的两条、来源、受影响动作。问用户。得到答复前暂停受影响动作。不受影响的沉淀可以继续。
为什么：综合版会变成第三份未批准事实，下个 session 又要筛一次。
出处：Session 10 — 2026-09-23 | 状态：有效

### no-drive-id-in-new-git
问题：把 Drive 链接和文件 ID 写进新的规则、日志或 commit，私有标识进入可推送历史。
做法：新文件只写文件名和状态。旧索引里已有的 ID 不复制、不删除。需要再读时，用你当轮给出的链接。
为什么：2026-09-21 的 Drive 管理规则禁止把标识写进 Git；旧索引是历史，不是新写法的模板。
出处：Session 10 — 2026-09-23 | 状态：有效

### substantive-turn-visible-ledger
问题：消息台账方法论循环写在规则里，本 session 前几轮没有执行，也没有可见轮检。
做法：实质轮结束时写 `loop_ledger.md` 一行，有新流程才追加方法论，回复末尾留轮检。漏记要事后补记并标明。
为什么：没有记录的循环，下一个 session 无法核对，等于没做。
出处：Session 10 — 2026-09-23 | 状态：有效

### reply-suggestions-loop
问题：只回答当前问题，规则要等用户追问才补，loop 看起来建立了但下一轮又漏。
做法：每轮回复在结论后给 2–4 条建议。标建议，不标事实。范围不超过当前里程碑。被接受或第二次出现，才写入方法论。
为什么：不可见的步骤会被跳过。建议是比「每条消息都新写一条方法」更轻的捕获。
出处：Session 10 — 2026-09-23 | 状态：有效

### loop-registry-single-source
问题：同一条消息 loop 在 META、台账、启动页、审计页和通用启动文件里各写一套，后写的和前写的打架。
做法：步骤只维护 `LOOP_AUDIT.md` 本节 B。其他文件只写「按 L0–L7」。新增 loop 先改审计页，再在 META 加一条短规则。
为什么：平行步骤表就是平行事实，下一轮会不知道该跑哪一套。
出处：Session 10 — 2026-09-23 | 状态：有效
