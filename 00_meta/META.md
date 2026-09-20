# META — 顶层规则（跨 session 长期有效）

> 这一页不是产品文档，是**这个项目怎么运转**的规则。优先级高于任何 session 的临时想法。
> 改这一页必须写清「为什么改」，因为它被所有后续 session 继承。
> 最近更新：2026-09-20（Session 5 建立）

---

## M0. 存在公理

1. **没进 GitHub 的东西不存在。** Arena 沙盒每个 session 独立、会销毁；只有 commit + push 到
   `lin2mm/RetrofitLock` 的产出才能被下一个 session 读到。
2. **`/home/user` 之外一律不持久。** `/tmp`、`~/.cache` 里的东西（哪怕我辛苦装好的 209MB chromium）下个 session 全没。
   工具可以重装，靠 `bash 00_meta/scripts/capacity.sh --fix`。
3. **交接靠文件，不靠对话。** 任何"我记住了"都无效，写进 md/csv 才算数。

## M1. Session 开局固定顺序（不要先干活）

```
① 00_meta/META.md              ← 规则（本页）
② 00_meta/index_sessions1-4.md ← 有什么资料、缺什么
③ 00_meta/methodology.md        ← 可复用的方法论（长期沉淀的目标文件）
④ 00_handoff/HANDOFF.md         ← 当前进度与在办事项
⑤ bash 00_meta/scripts/capacity.sh   ← 空间/持久化/工具链自检（10 秒）
```
只有 ⑤ 报 ✅ PASS 才开始产出。⑤ 报 [4][5] 告警时，先补 commit/push 再做别的。

## M2. 每一轮的节奏（用户要求：每条消息都要沉淀）

每个回合结束时，在动手写代码之外做三件事：
1. **append 到 `00_meta/session_log.md`**：本轮我做了什么（1–3 行，含关键决策与**为什么**）。
2. **判断是否产生了方法论**：凡是「换个产品/换个 session 仍然有用」的经验 → 写进
   `00_meta/methodology.md` 对应板块；只对本产品有效的写成败事实 → 写进 `10_product/`，**不污染方法论**。
3. **跑 capacity.sh 并 commit + push**（含 `00_meta/capacity.md` 的快照更新）。

命令式追加（保证格式统一）：`bash 00_meta/scripts/learn.sh <kebab-name> <板块A-D> "问题" "做法" "为什么" [状态]`
**先查已有，再新增（沿用项目自己的 D44 元规则）**：动手前先查 `methodology.md` / `naming.md` / 本规则页有没有对应条目；
已有 → 引用并更新（版本号 +1），缺失 → 才新增，并分配下一个 `D5x` 编号（项目原序列 D01–D55 已到 D55，本项目继续往后编）。
这样"学习"表现为对同一份文件的收敛修订，而不是不断长出平行文档。
判定标准（什么才算方法论）：能改写成「以后凡是遇到 X，就做 Y，因为 Z」的句子才算；
只是「这次这个 SKU 的孔距是 60mm」不算，那是数据。

## M3. 分支与 merge 闸门（**用户硬性要求**）

- 本 session 全程只在 `arena/01a0bd80-retrofitlock` 上工作、push。
- **禁止**：合并进 main、创建并合并 PR、删除任何分支、`rebase`/`force push`。
  合并会结束这个 session，而用户要在**同一个 session 里连做** 产品图 → 目录 → 网站。
- 阶段完成时只说："阶段 X 完成，已 push 到 `arena/01a0bd80-retrofitlock`（未 merge）。
  要 merge 请明确说'合并'。" —— **拿到用户明确同意才动 merge**。
- 三个大阶段（图 / 目录 / 网站）之间**不 merge、不换 session**，用本页 + HANDOFF 做内部续接。
- 若平台侧出现自动合并/分支清理迹象，立刻告知用户并停止 merge 类操作。

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
10_product/base_unit.md + accessories.csv  ← 唯一真相源
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

## M8. 前序 session 的交接方式（本项目唯一的"记忆通道"）

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

## M7. 长期学习的记录格式（methodology.md 怎么写）

每条方法论固定四行，带出处，可被后续 session 引用：
```
### 方法名（kebab-case）
问题：什么情况下会用得上
做法：具体 2–5 步
为什么：机制，不是偏好
出处：Session N — 日期 | 状态：有效 / 待验证 / 已废弃(说明)
```
废弃不删除，改成 `已废弃 + 原因`，让下一个 session 知道别再走回头路。
