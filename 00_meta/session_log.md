# SESSION LOG — 每轮一条（最新在最上，别删旧的）

格式（照抄即可）：
```
### R<N> — 2026-09-20 — 一句话主题
做了：
决策：… —— 因为 …
方法论：新增/更新 `methodology.md` 的 <方法名>（或：本轮无）
容量：capacity.sh = PASS/WARN（WARN 写是什么）
下轮起点：
```

---

### R1 — 2026-09-20 — 从"要文件"改为"先建 loop"
做了：清点仓库确认 S1–S4 产出全部丢失（只有空 README）；搭 `00_meta/`（META 规则、naming、methodology、
  capacity + 自检脚本、index_sessions1-4），把 S1–S4 资料全量索引化；实测网络白名单/字体/PDF 阻塞点。
决策①：顶层先立 `META.md`（规则）再谈单 session 内容 —— 因为用户指出我反复给错"Drive 能读"这类能力判断，
  说明缺的是持久化规则而不是又一次口头说明。
决策②：**本 session 不做 merge**，三个阶段（图/目录/网站）做完并经用户同意后才 merge —— 因为 Arena 用分支跟踪 session，
  merge = 对话结束，而用户要在同一 session 里连续跑完三步。
决策③：原始素材（视频/设计稿源文件/爬取数据）不进 git，只进 `90_archive/_manifest.md` 清单 —— 因为 patchset 128MB 是累计上限。
方法论：新增 `tmp-is-not-durable`、`probe-before-promise`、`stage-gate-without-merge`、
  `cjk-font-via-npm-not-system`、`sandbox-pdf-limitation-workaround`、`video-to-frames-for-refs`、
  `single-host-multi-accessory-series`、`one-source-of-truth`、`one-html-two-outputs`、`cross-session-persistence-rule`。
容量：PASS（工作树 705KB / 25 文件；工具链除 chromium PDF 引擎外全绿；字体迁至 `/home/user/.npm-fonts` 持久化）
下轮起点：用户按 `00_meta/index_sessions1-4.md` 上传 `S3-A/S3-B/S3-C/S3-J`（阻塞）+ `S2-A`；
  我这边可先做的是把 `50_catalog/catalog.html` 双语骨架 + print CSS 搭出来，不依赖素材。

### R2 — 2026-09-20 — 建"旧 session 自导出"通道（不再要用户复述/网盘）
做了：确认远端 `main` 只有 15B README、除工作分支外无其他 ref → 我对 S1–S4 零知识，已如实说明。
  写 `00_meta/distill_prompts.md`：4 段复制即用的提示词，让 S1–S4 各自把经验压成 `00_meta/intake/sessionN_*.md` 并自己 push。
  建 `00_meta/intake/` 收件箱 + 实测通道（用 worktree 把收件说明与同步推上 `main`/`inbox`，工作分支跟踪未受影响）。
决策：`main` = 公共着陆区（旧 session 只 push 它），成果仍只走 `arena/01a0bd80-retrofitlock`，
  我读资料 = `git merge origin/main` 进来（inbound merge 不会终结 session）—— 因为不能为了收件去动 M3 的 merge 闸门。
方法论：新增 `self-export-at-source`（M8 的机制根据）。
容量：PASS（带提示）。
下轮起点：你去 S1–S4 各粘一段提示词；回来只需说"sessionX 已 push"。若那边 push 失败，把 md 全文贴聊天里我代收。
