# META — 顶层规则（跨 session 长期有效）

> **最高原则：** 只在 `arena/01a0cc8f-retrofitlock` 工作。不向 `main` 提交或推送，不 merge 进 `main`。merge 进 `main` 会结束这个对话。
>
> 含中文的 9 个文件名已改成英文，对照见 `UNKNOWN_FILE_MAP.md`。现行方法是 `METHOD_CURRENT.md`。封面仍是 Name pending。取名规则和未选定预览在 `BRAND_CANDIDATES.md`。商业草稿的访客选择在 `VISITOR_REGION.md`。销售国家未定。

> **历史规则档，非当前方法论入口。** 2026-09-23 用户要求把方法收束到唯一的 `METHOD_CURRENT.md`；以后查方法、循环及 Git 执行门槛只看该文件。仓库记录／Drive 来源分别见 `REPO_RECORD_SUMMARY.md`、`DRIVE_INDEX_SUMMARY.md`。
> 为什么改：用户明确取消每轮自动 Git，要求三份结束节点。以下旧 M0/M1/M2/M3/M8 的自动提交、推送、合并或固定旧分支流程均不可当作当前授权；其它旧条目保留供追溯。

---

## M0. 存在公理

1. **本地文件与 Git 远端是两种状态。** 本工作区改动可在本会话保存；是否写入 Git 历史／远端由用户本轮单独授权。不能因“需要持久化”自行 `git add`、`commit` 或 `push`。现行门槛见 `METHOD_CURRENT.md` L5。
2. **`/home/user` 之外一律不持久。** `/tmp`、`~/.cache` 里的东西（哪怕我辛苦装好的 209MB chromium）下个 session 全没。
   工具可以重装，靠 `bash 00_meta/scripts/capacity.sh --fix`。
3. **交接靠文件，不靠对话。** 任何"我记住了"都无效，写进 md/csv 才算数。

## M1. 开局入口（2026-09-23 收束）

方法论与循环只读 `00_meta/METHOD_CURRENT.md`。需要仓库／Drive 的历史覆盖情况，再**按需**查 `REPO_RECORD_SUMMARY.md`／`DRIVE_INDEX_SUMMARY.md`；产品正文不自动纳入开局。可按需运行 `capacity.sh` 只读体检；未提交或未推送只是状态，不是自动 Git 的授权或停止方法工作的一票否决。

## M2. 每一轮的节奏（用户要求：每条消息都要沉淀）

每条用户消息在 `loop_ledger.md` 记一行，实质轮在 `session_log.md` 记要点；可复用且经过查重／确认的方法只写入 `METHOD_CURRENT.md`，否则记“无新增”的原因。按需做容量自检并报告状态。**默认不执行 `git add`、`commit`、`push` 或合并；用户在本轮明确给出相应动作及已列文件范围才可执行**（见 `METHOD_CURRENT.md` L5）。

> 以下旧格式／`learn.sh`／Dxx 续编说明是来源档案。新方法只在 `METHOD_CURRENT.md` 中查重和更新；不得用旧工具把方法继续追加到 `methodology.md`。文档编辑安全约束仍适用。

**硬约束（本 session 两次踩坑后写死）**：改文档正文**只允许** `write_file` / `edit_file`；
`bash -c` 里**禁止**出现含反引号、`$()`、`<占位符>`、成对双引号的文档内容 —— 会被 shell 展开，**静默吃掉文件名甚至把文档当重定向目标**。
需要批量替换时：先用 `write_file` 写一个临时 `.py`，跑完立刻 `rm`（M10 用完即删）。
命令式追加（只用于**纯 ASCII 短文本**）：`bash 00_meta/scripts/learn.sh <kebab-name> <板块A-D> "问题" "做法" "为什么" [状态]`
**先查已有，再新增（沿用项目自己的 D44 元规则）**：动手前先查 `methodology.md` / `naming.md` / 本规则页有没有对应条目；
已有 → 引用并更新（版本号 +1），缺失 → 才新增，并分配下一个 delta 编号。
项目序列**已用到 D67**（`J90` R25 / 2026-09-15），本项目从 **D68** 续编；
**能用既有 Dxx 表达的就不新开条目**（例如我的渲染管线其实等于 D64/D66，直接引用）。
这样"学习"表现为对同一份文件的收敛修订，而不是不断长出平行文档。
判定标准（什么才算方法论）：能改写成「以后凡是遇到 X，就做 Y，因为 Z」的句子才算；
只是「这次这个 SKU 的孔距是 60mm」不算，那是数据。

## M3. 分支与 Git 动作闸门（2026-09-23 用户重新裁定）

- **默认不执行 `git add`、`commit`、`push` 或合并。** 仅当用户在**本轮**明确授权具体动作时执行，且只处理其授权范围内、已列出的文件。提交不隐含推送；推送不隐含合并。
- 本 Arena 会话仅在固定的 `arena/01a0cc8f-retrofitlock` 分支工作。不得切换／创建其它分支，不自动 merge、PR merge、rebase、force-push、改默认分支或部署。任何合并都须本轮明确指明来源、目标及动作，且仍受当前会话分支限制。
- 旧 Session 5 的分支名、自动 push、部署以及索取凭据的说法是历史内容，不是本轮指令。不要向用户索要或在聊天、文档中存放凭据；需要 GitHub 连接时按平台配置处理。完整现行规则只见 `METHOD_CURRENT.md` L5。

## M4. 目录与命名体系（细则见 `00_meta/naming.md`）

- 顶层数字前缀分区：`00_meta`(规则) `10_product`(事实源) `20_audience`(客户) `30_sales_assets`(话术)
  `40_images`(图) `50_catalog`(目录) `60_website`(站) `90_archive`(只读原始素材) `00_handoff`(进度交接)。
- 一个数字段只干一件事；`00_` 是"关于项目的项目"，`90_` 只进不改。
- 素材到位先落 `90_archive/<来源>/`（只读），**再**派生成 `10_product/` 的数据或 `40_images/refs/` 的图。
  原始素材永不直接当产出用。

## M5. 数据流（单向，防止三处打架）

```
90_archive (原始素材，只读)
   ↓ 人工/脚本提炼
外壳见 CAD 日志。面盖见确认稿。目录句子见已读目录。10_product 只留未确认字段
   ↓ 派生
40_images/slots.csv → 40_images/out/*  (图位登记 + 成品)
   ↓ 排版
50_catalog/catalog.html (中英双语，同时喂 Ctrl+P 出 PDF 与网页版)
   ↓ 复用
60_website/  (同一份数据 + 同一批图，禁止另写文案)
```
**任何图片/网页/目录与 `10_product/` 冲突时，以 `10_product/` 为准，先改数据再改产物。**
不确定就 `[待确认]`，禁止用行业常识填空（价格、认证、尺寸尤其禁止）。

## M6. 空间与容量红线（细则见 `00_meta/capacity.md`）

- 提交进 git 的单文件 **≤ 25MB**；仓库工作树目标 **≤ 60MB**（Arena patchset ~128MB 是累计上限，爆了就丢交付）。
- 交付用图一律压到 **≤ 400KB**；高清原图只存 `90_archive/` 且**不进 git**（存路径与来源说明即可）。
- 视频/模型/字体包这类大件**一律不进仓库**；需要时按 `index_sessions1-4.md` 的"送达方式"走。
- 每轮末跑 `capacity.sh`；连续两轮出现同一告警 → 停下先修健康度，别继续产出。

## M8. 前序 session 交接的历史记录（不可作为当前动作授权）

> 本节及 M8b 是旧通道方案的原文归档。其“读到就 commit”“自动 merge／push”“照旧索引取标识”均由 `METHOD_CURRENT.md` L5/L6 取代；不得据此执行 Git、扩大 Drive 范围或在新文件复制私有标识。

要拿回旧 session 的东西，**不要让用户复述**。两条通道都成立，用户偏好优先（用户已在用 Drive）：
- **通道一 · Drive 直链**（零门槛）：配方见 M8b；我读它用 `fetch_page`，**不要**用沙盒 `curl`（沙盒网络是白名单，工具网络不是 —— 已实测，见 `capacity.md` 第 4 节）。
- **通道二 · git**（成堆文件/源码/要保真度）：让**那个 session 自己**把经验蒸馏成 `00_meta/intake/session<N>_<topic>.md` 并 push（提示词见
`00_meta/distill_prompts.md`），push 到 `main`/`inbox`，收件目录就是 `00_meta/intake/`。
两条通道拿到的东西**都必须落进仓库并 commit** 才算收到 —— Drive 读到的内容要另存进 `00_meta/intake/`；只在对话里读过 = 没收到（这是 S1–S4 反复丢成果的同一个病）。
分工：`main` 是**公共着陆区**（旧 session 只往它 push，本 session 不直接往它 push 自己的成果）；
`inbox` 是备用收件分支；本 session 的成果只走 `arena/01a0bd80-retrofitlock`。
我这边收到后的动作固定：`git fetch origin` → `git merge origin/main`（把蒸馏稿并进我的工作分支）→
记下 push 的 commit SHA 作出处 → 方法论进 `methodology.md` →
资产清单进 `index_sessions1-4.md` → 事实进 `10_product/`·`20_audience/`·`30_sales_assets/` → 回报"省了哪几步、还缺什么"。
**反向义务**：本 session 结束时，也要给自己写一份 `00_meta/intake/session5_images_catalog_website.md`，
否则我就是在重复 S1–S4 犯过的错（成果留在沙盒里蒸发）。
收尾同步顺序：① push 工作分支 → ② 把工作分支 fast-forward 到 `main` 与 `inbox`（让下一个 session 直接看得到规则）
→ ③ 用户同意后才把工作分支 merge 进 main（真正的发布，见 M3）。

## M8b. Drive 直链收件配方（用户发链接时照这个要 / 判）

- Drive 里**上传原文件**（`.md`/`.pdf`/`.png`/`.jpg`）→ 共享设成「任何拥有链接的人 = 查看者」→ 发这条：
  `https://drive.google.com/uc?export=download&id=<FILE_ID>`（`<FILE_ID>` = 分享链接里 `/d/` 与 `/view` 之间那串）
- 若用 Google Docs 排版：发 `https://docs.google.com/document/d/<ID>/export?format=txt`
- ❌ 只发预览页 `.../file/d/<ID>/view?usp=sharing` 抓不到正文（只有 JS 壳）；发来了我会回一句「换成 uc?export=download」
- 多份一起给：一行一个链接 + 对应 ID（例 `S3-C 配件清单: https://drive.google.com/uc?export=download&id=...`），我好对号入座
- 我收到后的固定动作：存进 `00_meta/intake/` 或 `90_archive/` → **`bash 00_meta/scripts/verify-upload.sh` 确认落地** → 才回「已收到」
- 视频：链接留作备份即可，**干活靠抽帧的图**（沙盒放不了 mp4）；设计稿/渲染图直接发图片直链

## M9. 台账 —— 证明 loop 真的转了（不是自我感觉良好）

`00_meta/loop_ledger.md`：**每条用户消息一行**，写清「输入要点 → 沉淀成哪条方法论 / 改了哪些文件 / 撤回或更正了什么」。
没有增量也要写一行「本轮无方法论增量（原因：…）」。
为什么：本 session 已两次栽在"我记得 / 我以为成功"上（成果没入库、网络结论写反）；台账是唯一能被审计的证据，
也逼我在动手前先答一次"这条消息该改哪条规则"。

## M10. Workspace 卫生循环（外部文件取用即焚；用户 2026-09-20 指定）

```
取源 → .scratch/（gitignore，永不入库）→ 分析 → 结论只写 md/xlsx 进仓库 → 更新 00_meta/DRIVE_INDEX.md 状态 → 删源
```
- 二进制（CAD/视频/压缩包/图片包）**一律不 push GitHub**；连 `90_archive/cad/` 的豁免也已收回。
- 需要再看源时：按 `DRIVE_INDEX.md` 的 FILE_ID **重新 fetch**（文本我用 `fetch_page`；二进制你附件或本机跑 `fetch-drive.sh`）。
- 每阶段末跑 `bash 00_meta/scripts/scratch.sh status`：它顺带证明"没有二进制被 git 跟踪"；有就 `git rm --cached`。
- 保留物 = ①分析结论 md ②文件夹/文件索引（含大小、SHA256、状态）；**不保留原件副本**。
- 理由：CAD 属临时分析件、非长期资产；而 Arena patchset 有 128MB 累计上限，二进制会把后半程（网站）预算吃光。

## M11. 建议 loop（Session 10，2026-09-23 用户要求）

每一轮回复都要给建议，不能只答问题。

1. 放在结论之后，单独一节，标题写「建议」。
2. 2–4 条。每条标「建议」，不写成事实，不写成已执行。
3. 每条写：建议做什么、为什么、会改哪条 loop。不展开当前里程碑以外的执行。
4. 方法论阶段的建议只谈 loop 与规则。GTM、产品、目录、网站，等用户明确进入下一里程碑再建议。
5. 建议不等于新规则。同一条建议被用户接受，或第二次独立出现，才写入 `methodology.md`。
6. 已有规则能覆盖的，引用，不新开一条。

为什么：只回答问题，loop 只会在被追问时才补。建议 loop 把「下一步可以收紧什么」变成每轮可见动作。

## M7. 长期学习格式（历史条目）

> 仅用于理解旧 `methodology.md`，不再向旧库或 `learn.sh` 追加新规则。现行方法的查重、晋级和更新只在 `METHOD_CURRENT.md`。

每条方法论固定四行，带出处，可被后续 session 引用：
```
### 方法名（kebab-case）
问题：什么情况下会用得上
做法：具体 2–5 步
为什么：机制，不是偏好
出处：Session N — 日期 | 状态：有效 / 待验证 / 已废弃(说明)
```
废弃不删除，改成 `已废弃 + 原因`，让下一个 session 知道别再走回头路。
