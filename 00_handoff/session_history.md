# Session 日志（每个 session 结束时追加，最近在最上）

格式：
```
## Session N — <日期> — <一句话主题>
- 做了什么：
- 产出文件：
- 下一步：
- 还缺什么：
```

---

## Session 5 — 2026-09-20 — 交接与骨架
- 做了什么：清点仓库发现 GitHub 上只有 `# RetrofitLock` 一行 README，四个 session 的产出**都没 commit/push**，
  新沙盒拿不到任何前作。于是建立交接骨架 + 逐项实测沙盒能力（结论见 `HANDOFF.md` 第 5 节）：
  Drive/Figma/CDN/apt 源全不通、缺 libnss3（→ 沙盒内 `page.pdf()` 暂不可用）、中文字体走 npm `@fontsource/noto-sans-sc`、
  `imageio-ffmpeg` 自带 static ffmpeg（→ **实拍视频抽帧可行**）、`generate_image` 支持传参考图做图生图。
- 当时记录的产品模型后来被目录覆盖：现行是一个驱动核心、两条机械路径，不是“只做一款主机加配件”。当时原话是：目录只做一款主机，靠配件、装法和 ICP 扩展；
  素材现状 = 实拍半成品视频 + 成品设计稿；交付 = **中英双语 + 双语 PDF + 同款网页版**。
  据此把 `sku_master.csv` 改成 `base_unit.md`（唯一数据源）+ `accessories.csv`（兼容矩阵），图位清单按"主机渲染一次"重排。
- 产出文件：`00_handoff/{HANDOFF,session_history,assets_index}.md`、`10_product/{base_unit.md,accessories.csv,sku_master.csv}`、
  `20_audience/{ICP,objections}.md`、`30_sales_assets/dm_templates.md`、`40_images/{slots.csv,README.md}`、`50_catalog/README.md`、`.gitignore`、README 指向 HANDOFF
- 下一步：等 P1 设计稿 + P2 视频抽帧 + P3 配件清单 + C1 ICP → 定稿 `base_unit.md` → 锁风格出主图 → 双语目录 HTML → 网站
- 还缺什么：`assets_index.md` 里标 🔴 的 P1–P5、C1；另有 3 个决策类问题待答（品牌名、PDF 走 print-ready 还是图片版式、首个 ICP 版本）


---

## Session 4 — 建立 GlobalLockSummary 工程师资料库
- 做了什么：（待补：站点结构、内容板块、给工程师学习的资料范围、技术栈、是否已部署及 URL）
- 产出文件：（待补 —— 目前不在仓库里）
- 下一步：
- 还缺什么：源码或线上 URL，Session 5 第④步要用

---

## Session 3 — 客户数据 → DM → 索取目录 → 渲染图 + 目录
- 做了什么：（待补：DM 话术、发送量/回复率、索取目录的客户数、渲染图做法与工具、目录格式与页数）
- 产出文件：（待补 —— 目前不在仓库里）
- 下一步：→ 已交接到 Session 5
- 还缺什么：**本 session 最需要的就是这一包的导出**

---

## Session 2 — Methods 总结 + ICP
- 做了什么：（待补：ICP 定义、切入方法、卖点排序）
- 产出文件：（待补）
- 还缺什么：ICP.md、客户异议实录

---

## Session 1 — 智能锁市场研究 + 数据爬取
- 做了什么：（待补：爬了什么源、多少条、竞品与价格带结论）
- 产出文件：（待补）
- 还缺什么：原始数据集与字段说明（做对比图时才需要）
