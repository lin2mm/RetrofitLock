# METHODOLOGY — 跨 session 累积的方法论库

> 唯一允许「只增不删」的文件。格式见 `00_meta/META.md` M7（四行 + 出处 + 状态）。
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
上面 B 组三条是从你口述的 session 1–3 流程**反推**的，等 `assets_index.md` 的 C1/C3 原文到齐后校对措辞；
如果原方法和我写的不同，以你的原文为准，我的版本改成 `已废弃`。

