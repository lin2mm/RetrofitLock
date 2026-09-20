# DISTILL PROMPTS — 让 Session 1–4 自己把经验交出来（复制即用）

为什么用这个：那 4 个 session 的对话与文件我只看不到一次机会；但你**不用复述**——
在各自 session 里粘一段提示，让它自己压成一份 markdown 并 push 到本仓库，我 fetch 就完了。
（本沙盒实测：`drive.google.com` / `figma.com` / `dropbox.com` / 各 CDN 全部不通 → Drive 分享链接我打不开；
只有 `github.com` / `api.github.com` / `codeload` / npm / PyPI 通，所以 **GitHub 就是通道**。）

**操作：每个 session 粘一段 → 它生成文件 → 它自己 push → 你回来跟我说一句"XX 已 push"。**
我这边收到后会合进 `00_meta/methodology.md` 与 `00_meta/index_sessions1-4.md`，并告诉你省了哪几步。

模板是固定的 8 个板块；只有**第一行文件名**和**【本 session 重点】**两行不同。粘错文件名的后果只是我要手动挪位置。

---

## PROMPT → Session 1（市场研究 / 爬数据）
```
你现在要做的不是继续研究，而是**把本 session 的经验蒸馏成交接文件**，给下一个 session（Session 5：产品图→目录→网站）用，
让它不必重复我已做过的事。只写结论与方法，不写过程叙事。

请新建文件（目录不存在就创建）：00_meta/intake/session1_market.md
严格用这 8 个板块：
1. 做过什么：一句话/条，标状态 ✅已定稿 / 🔁被后续推翻 / ⏸未做
2. 关键决策与原因：当时为什么这么选，不要写"我考虑过"
3. 可复用方法论：每条固定 4 行——问题 / 做法 / 为什么 / 状态(有效|待验证|已废弃+原因)
4. 资产清单：每条一行「文件/数据名 | 在哪(沙盒路径或仓库路径) | 是否需要重新上传给下个 session(要/不要) | 一句话用途」
5. 踩过的坑：明确写"别再这么做 + 原因"
6. 下个 session 该先做什么：你建议的下一步
7. 我没给你但重要的信息：
8. 一句话总结：这个 session 最大的价值

约束：总长 < 400 行；中文正文（英文原文引用保留英文）；不确定的标 [不确定]，不要脑补；**不要粘贴大表格与原始数据**。
【本 session 重点】资产清单要具体到"哪个文件、多少条、字段是什么"；并明确区分：
哪些结论已被 Session 2 的 ICP 取代（写"不要"）、只有哪些片段值得下个 session 上传（预计：5–8 个直接竞品那一小段、地区优先级那一页）。

写完后（若本 session 能访问 GitHub/终端；不能就跳过并把文件内容整段贴给我）：
  git clone https://github.com/lin2mm/RetrofitLock /tmp/rl && cd /tmp/rl \
   && mkdir -p 00_meta/intake && cp <你生成的文件> 00_meta/intake/session1_market.md \
   && git add -A && git -c user.name=distill -c user.email=distill@local commit -m "distill: session1" \
   && git push origin HEAD:main
如果 push 被拒绝 → 直接把文件全文贴在对话里发给我（我有仓库写权限，我替你 push）。
```

## PROMPT → Session 2（Methods + ICP）
```
【同上开头的任务定义、8 板块清单、约束段落，原样保留】
文件名改为：00_meta/intake/session2_icp.md
【本 session 重点】这个 session 的结论是 Session 5 的**阻塞项**，所以我需要原文而不是摘要：
把「ICP 定义全文」「卖点优先级排序」「不该卖给谁」三块原文**逐字粘进第 4 板块**（作为引用块），其余板块正常写。
另注明：你在 Session 1 数据上做了哪些收敛判断，哪些我不用再爬。
push 命令同上（commit message 写 "distill: session2"）。
```

## PROMPT → Session 3（客户数据 → DM → 索目录 → 渲染图 + 目录）★最关键
```
【同上开头的任务定义、8 板块清单、约束段落，原样保留】
文件名改为：00_meta/intake/session3_dm_catalog.md
【本 session 重点】请逐条盘点这些资产"还在不在、在哪、要不要重新上传"（Session 5 已把它们编号，请按编号对齐）：
  S3-A 成品设计稿 | S3-B 实拍半成品视频 | S3-C 配件/适配清单 | S3-D 已发出的目录版本 |
  S3-E DM 话术+数据 | S3-F 客户异议原话 | S3-G 旧渲染图 | S3-H 客户名单 | S3-J 规格表
另外必须写清：① 目录的页面顺序与每页讲什么（照抄旧目录）；② 渲染图当初是用什么工具/什么提示词做的，
哪些被客户否了、为什么；③ DM 话术里哪一句带来的回复最多（这句话要当新目录封面大字）；
④ 客户从"索目录"到"下一步"的真实卡点。
如果这些文件还在本 session 的工作区，请顺手把它们一并复制到 `90_archive/session3/`（图片压到 ≤400KB，视频别传），
再一起 push；不能上传的，就在文件里写清"还缺哪几个"，我用聊天附件的方式要。
push 命令同上（commit message 写 "distill: session3"）。
```

## PROMPT → Session 4（GlobalLockSummary 工程师资料库）
```
【同上开头的任务定义、8 板块清单、约束段落，原样保留】
文件名改为：00_meta/intake/session4_globallocksummary.md
【本 session 重点】需要：① 站点大纲（板块 + 每块讲什么）；② 技术栈与目录结构；③ 是否已部署、URL；
④ 定位：给工程师学习 vs 给客户获客（Session 5 的第④步是"扩建它"还是"另做营销站"取决于这句）；
⑤ 哪些内容能直接复用进产品目录（预计：锁体/孔距/装法的技术解释段）。
若源码就在本 session 工作区，可以整个 push 进 `60_website_import/`（**排除** node_modules/dist/大字体，
工作树总量控制在 20MB 内，单文件别超 25MB），Session 5 会评估复用；不 push 也行，把大纲写清楚即可。
push 命令同上（commit message 写 "distill: session4"）。
```

---

## 三个可选的补充通道（按省事程度排）

| 通道 | 适用 | 怎么做 |
|------|------|--------|
| **A. 让源 session push（推荐）** | 全部 4 个 session，尤其有一堆文件时 | 用上面的命令。push 进 `main` 或 `inbox` 分支都行，我 `git fetch` 后合并进 meta。 |
| **B. 聊天里贴文本 / 上传附件** | push 失败、或只有图和 PDF | 文本整段贴给我；图片/PDF 直接当附件上传（我能读图、能转格式）。一条消息一组 ID。 |
| **C. 视频/大文件** | Session 3 的实拍视频 | 你本机或源 session 里 `ffmpeg -i v.mp4 -vf "fps=1,scale=1600:-1" f_%03d.jpg` 抽 20–30 帧，只传帧；整片 500MB 会把仓库撑爆（红线见 `00_meta/capacity.md`）。 |

**不推荐**：Google Drive / Figma / Dropbox / Notion 分享链接 —— 域名在本沙盒不通（已实测 000）。
若你已经在 Drive 里整理好了：把内容**另存为 `.md`/`.txt` 再上传附件**（文本附件我能读），图片用附件而不是链接。

## 收件后我会做的（你不用管）
`git fetch origin` → 找那次 commit SHA 作出处 → 方法论合进 `methodology.md`（改状态）→ 资产清单合进
`index_sessions1-4.md`（`❓` 改 `✅已入库(路径)` 或 `⚪不用给`）→ 事实落到 `10_product/`·`20_audience/`·`30_sales_assets/`
→ 回你一句：**这份蒸馏让 Session 5 跳过了哪几步，还缺哪 3 件。**
