# HANDOFF — RetrofitLock / GlobalLock 项目交接文件

> **给任何一个新 session 的第一份读物。** 先读完这一页，再决定要不要读别的。
> 规则：每个 session 结束时，把本页和 `session_history.md` 更新 + commit + push。
> 只有 push 到 GitHub 的东西才存在；沙盒里的工作成果不 commit 就会永久消失。

- 仓库：`lin2mm/RetrofitLock`
- 本分支：`arena/01a0bd80-retrofitlock`（Session 5）
- 最近更新：2026-09-20

---

## 1. 我们在做什么（一句话）

把中国的 retrofit / smart 门锁卖给海外的 **智能锁安装商与本地经销商**（ICP 来自 Session 2），
用社媒 DM 冷启动（Session 3 已跑通），用**目录 + 产品渲染图**承接客户索取资料的动作，
最后用网站沉淀（Session 4 已建工程师向资料库 GlobalLockSummary）。

## 2. 四个 session 干了什么

| # | 主题 | 主要产出 | 产出现在在哪 |
|---|------|----------|--------------|
| 1 | 市场 + 爬数据 | 智能锁海外市场的爬取数据、竞品/价格带 | ⚠️ 只在 session 1 沙盒，未入库 |
| 2 | Methods + ICP | 目标客户画像（installer / dealer）、切入角度、卖点排序 | ⚠️ 只在 session 2 沙盒，未入库 |
| 3 | 数据 → DM → 目录 | 从客户名单到社媒 DM 话术、客户索取目录、制作渲染图与目录 | ⚠️ 只在 session 3 沙盒，未入库（**本 session 打包的是这段**） |
| 4 | 工程师资料库 | GlobalLockSummary 网站（给工程师学习用的资料库） | ⚠️ 未入库 |
| 5 | 产品图 + 目录 + 网站 | 见下方第 4 节 | ← 本 session |

## 3. Session 5 的目标与顺序（顺序不能反）

```
① 目录文案 / SKU 主数据 (10_product/sku_master.csv)   ← 先定稿，图片与网页都吃这份
② 产品图片生成 (40_images/)                            ← 渲染图 + 白底图 + 尺寸图 + 场景图
③ 目录排版 PDF (50_catalog/)                           ← 用 ①+② 组版
④ 网站 (60_website/)                                   ← 复用 ①②③ 的全部资产，最后做
```

反了会怎样：先做图再改文案 = 图重做；先做网站 = 每个 SKU 改一次要改三处。

## 4. 本 session 需要的输入清单（关键程度排序）

**A. 阻塞项 —— 没有就只能瞎编，必须给**

1. `10_product/sku_master.csv` — SKU 主数据：型号 / 适配锁体 / 材质颜色 / 规格 / MOQ / 阶梯价 / 认证 / 卖点。
   模板已建好，把 session 3 目录里的表格贴进去即可。
2. **真实产品图的原始文件**（`.obj/.fbx/.step/.blend/.stl` 或 CAD 截图 / 实拍照片 / 3ds Max・KeyShot・Blender 的 `.max/.blend` 源文件）。
   渲染图必须**以真实图为输入**做生成/重打光，不能纯文字生成，否则每个 SKU 会长得不一样，客户一眼看穿。
3. `50_catalog/*` — session 3 已做的那版目录（PDF / AI / Figma / HTML / PPT / 截图，任一形态都行），用来复刻版式与口径。

**B. 强烈建议 —— 决定图怎么拍、文案往哪打**

4. `20_audience/ICP.md` — 客户画像 + 卖点优先级（决定哪张图放首页、哪句当大标题）。
5. `20_audience/objections.md` — 客户提问/异议实录（直接变成图上标注和 FAQ）。
6. `30_sales_assets/dm_templates.md` — DM 话术（目录要能和话术接得上，客户点开不要断层）。

**C. 可选 —— 用到再说**

7. session 1 的原始爬取数据（只在要做价格带/竞品对比图时才需要）。
8. GlobalLockSummary 的源码或线上 URL（第 ④ 步要复用时才需要）。

## 5. 本沙盒的能力与坑（先读，避免提做不到的需求）

**有**：Node 22 + npm（可装任何包）、Python 3.11、ImageMagick 6、`gh`/git、外网可访问、
`generate_image`（文生图 + **图生图编辑**：传参考图进 `images` 参数即可改图/换背景/重打光）、
`present_file`（把成品开到你的预览器）、`start_process`（起 dev server，你能实时看到网站预览）。

**没有 / 要现装**：Blender、KeyShot、CAD、ffmpeg、pandoc、LaTeX、LibreOffice、**任何字体（含中文字体）**。

- ⚠️ **零字体**：任何要在图上/PDF 里出现文字（尤其中文）的渲染，必须先装字体或走浏览器排版（Tailwind + Playwright `page.pdf()`，文字用 webfont）。
  纯 PIL 画图会出豆腐块。中文排版请提前说，我先装 Noto Sans CJK。
- 目录 PDF 走 HTML→Playwright，好处是同一份代码既能出 PDF 又能出网页版目录，Step ④ 直接白捡。

## 6. 协作约定（请每个 session 都遵守）

1. **一切以 `10_product/sku_master.csv` 为准**。图片和网页不许自己发明参数。
2. 每张图都要在 `40_images/slots.csv` 里有登记：属于哪个 SKU、哪种图型、用了哪张参考图、状态。
3. 未确认的信息一律标 `[待确认]`，不要写成事实。价格尤其不要猜。
4. 目录/网站文案默认**英文**（给客户看），内部注释用中文。
5. 每轮结束：`git commit` + `git push origin <本分支>`，并在 `session_history.md` 记三行：做了什么、下一步、还缺什么。

## 7. 目录结构

```
00_handoff/    HANDOFF.md (本文件) · session_history.md · 本 session 待补清单
10_product/    sku_master.csv  ← 唯一数据源
20_audience/   ICP.md · objections.md
30_sales_assets/ dm_templates.md · 已发出的目录版本
40_images/     refs/ (真实参考图输入) · slots.csv (图位清单) · out/ (生成结果)
50_catalog/    catalog.html · catalog.pdf
60_website/    (Session 4 网站的延续)
90_archive/    各 session 原始导出，只读不改
```
