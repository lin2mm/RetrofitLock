# HANDOFF — RetrofitLock / GlobalLock 历史项目交接文件

> **2026-09-23 更新：**本页是历史进度档案，方法论只读 `00_meta/METHOD_CURRENT.md`；仓库与 Drive 来源结案见两份总结。旧自动 commit+push、旧分支名和产品冻结叙述不再作为当前授权；今天两份目录的用户裁决见 `00_meta/DRIVE_INDEX_SUMMARY.md`，但本轮不展开产品内容。

> 以下为 Session 5 的历史交接叙述，非新 session 的第一份必读物。
> 历史要求曾是每轮更新交接并 commit+push；**已被 2026-09-23 用户授权闸门取代**。工作区成果与 Git 远端同步状态分开报告，未获当轮明确授权不执行 Git 写操作。

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

## 4. 本 session 需要的输入（完整清单见 `assets_index.md`，编号对应）

**最小可开工组合**：`P1 成品设计稿` + `P2 实拍半成品视频(抽帧)` + `P3 配件清单` + `C1 ICP 定义`。
这 4 个到位我就能出：`base_unit.md` 定稿、图位清单锁定、1 张锁风格主图、1 页双语目录样张。

**已按你的回答修正的两件事**：
1. 不是"多 SKU 目录"，是 **1 款主机 → 配件/装法/ICP 组成系列**（见 5b）。`sku_master.csv` 已改成
   `base_unit.md` + `accessories.csv` 两张表；目录结构随之从"每 SKU 一页"改成"兼容矩阵 + 按 ICP 选包"。
2. 交付形态：**中英双语 + 双语 PDF + 同款网页版**（同一套 HTML 出三种，见第 5 节 PDF 坑位）。

**⚪ 不用重复给的**（防重复，别浪费时间）：session 1 的完整研究稿（结论已固化进目录/ICP/话术）、
session 1 的原始爬取数据集（只有要做价格带对比图时才要那一小段）、任何 `.ai/.psd/.blend` 源文件（本沙盒没有对应软件，给我导出图就行）。

## 5. 本沙盒能力（已实测，别再猜）

**通**：`github.com` / `api.github.com` / `codeload` / npm registry / PyPI。Node 22、Python 3.11、
ImageMagick 6、git+`gh`（有 push 权限）、gcc/make、`generate_image`（**支持传参考图做图生图编辑**）、
`present_file`、`start_process`（起 dev server 给你实时预览）。

**已装好可用**：`Pillow` / `fonttools` / `fpdf2`（pip --user）、`@fontsource/noto-sans-sc`（npm，中文字体！）、
`imageio-ffmpeg`（**自带 static ffmpeg 7.0.2**：`python3 -c "import imageio_ffmpeg as f;print(f.get_ffmpeg_exe())"`）
→ 所以**实拍视频抽帧完全可行**，不用你另外装东西。

**不通 / 没有（已实测，别浪费时间去试）**：Google Drive、Figma、Dropbox、`raw.githubusercontent.com`、
`media.githubusercontent.com`（GitHub LFS）、`storage.googleapis.com`、`fonts.gstatic.com`、`unpkg`/`jsdelivr`、
conda 源、**所有 apt 源**（且无 root）。没有 Blender/KeyShot/CAD/pandoc/LaTeX/LibreOffice，系统字体为 0。

- ⚠️ **PDF 排版有坑**：headless Chromium 我跑起来了（`@sparticuz/chromium` + `puppeteer-core`，209MB 二进制能解出），
  但缺 `libnss3.so / libnspr4.so / libnssutil3.so`，apt 装不了、源也不通 → **沙盒内 `page.pdf()` 暂时不可用**。
  已排期解决的三条路：① 交付 **print-ready HTML**（A4 `@page` 已写好）由你浏览器 Ctrl+P 导出，字体最正、最像设计稿；
  ② `fpdf2` 生成**图片版式 PDF**（每页一张高清 PNG，客户能收，但文字不可选）；
  ③ 从 GitHub 仓库里捞 `.so` 补进 `LD_LIBRARY_PATH`（未验证，若成则 ①② 都升级成真矢量双语 PDF）。
  → **网站不受影响**：它是 HTML，本来就在你浏览器里跑，`start_process` 直接给你实时预览。
- ⚠️ **零系统字体**：图上/PDF 里的任何中文都必须走 `@fontsource` 的 woff2（浏览器排版）或先 `fonttools` 转 ttf（PIL/fpdf2）。
- 中英双语 + PDF + 网页版**同一套 HTML 代码**出（见第 5 节坑位说明），Step ④ 的网站直接白捡。

## 5b. 产品架构（已确认 2026-09-20）
一款主机，**不是一堆 SKU**：`1 主机 × N 配件 × M 装法 × K 个 ICP 版本 = 一个系列`。
含义：目录按"兼容矩阵 + 按 ICP 的选配件包"组织；图片只把主机渲染一次，换配件/门型/背景做延展。
详见 `10_product/base_unit.md` 与 `10_product/accessories.csv`。

## 6. 规则、方法论、命名、容量、S1–S4 全量索引 → 都在 `00_meta/`
本页只讲进度；**跨 session 的长期规则在 `00_meta/META.md`（开局必读）**：
`00_meta/index_sessions1-4.md` = Session 1–4 有什么资料、我该给你什么（按 ID）·
`00_meta/methodology.md` = 累积方法论（每轮末追加）· `00_meta/naming.md` = 命名与状态码 ·
`00_meta/capacity.md` = 空间红线 · `bash 00_meta/scripts/capacity.sh` = 自检。
`00_handoff/assets_index.md` 是本 session 的**精简版**（先给哪 4 个），全量以 `00_meta/` 为准。

## 6c. 待你回答的 3 个决策（不答我只能默认）
1. **品牌名**：客户看到的品牌名/Logo/联系方式是什么？GlobalLockSummary 是内部工程师库，目录上能不能挂它？
2. **PDF 路线**：沙盒内出不了真矢量 PDF（缺 libnss3）。默认走 **print-ready HTML（你浏览器 Ctrl+P 导出，双语排版最干净）**；
   要"我直接给你一个可下载 PDF"就得走图片版式（文字不可选、放大略糊）。
3. **第一个 ICP 版本**：目录 v1 先对谁说话 —— installer / dealer / property manager / hospitality？（决定封面大字与配件包排序）

## 7. 协作约定（请每个 session 都遵守）

1. **一切以 `10_product/sku_master.csv` 为准**。图片和网页不许自己发明参数。
2. 每张图都要在 `40_images/slots.csv` 里有登记：属于哪个 SKU、哪种图型、用了哪张参考图、状态。
3. 未确认的信息一律标 `[待确认]`，不要写成事实。价格尤其不要猜。
4. 目录/网站文案默认**英文**（给客户看），内部注释用中文。
5. 每轮结束：`git commit` + `git push origin <本分支>`，并在 `session_history.md` 记三行：做了什么、下一步、还缺什么。

## 8. 目录结构

```
00_handoff/    HANDOFF.md (本文件) · assets_index.md (上传清单+送达方式) · session_history.md
10_product/    base_unit.md (唯一数据源) · accessories.csv (配件/兼容矩阵) · sku_master.csv (旧模板，待废)
20_audience/   ICP.md · objections.md
30_sales_assets/ dm_templates.md · 已发出的目录版本
40_images/     refs/ (真实参考图输入) · slots.csv (图位清单) · out/ (生成结果)
50_catalog/    catalog.html · catalog.pdf
60_website/    (Session 4 网站的延续)
90_archive/    各 session 原始导出，只读不改
```
