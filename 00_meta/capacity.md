# CAPACITY — 空间与容量红线（Arena + GitHub）

> 本页是**约束**，不是笔记。`00_meta/META.md` M6 引用它。自检脚本：`00_meta/scripts/capacity.sh`。

## 1. 硬限制（平台侧，不可调）

| 来源 | 限制 | 后果 |
|------|------|------|
| Arena 沙盒 | 只持久化 `/home/user` 下的文件；排除 `.cache .npm .local .venv node_modules dist out build .next .output __pycache__` 等目录 | 放外面的东西下个 session 消失 |
| Arena patchset | 每轮末快照 **累计约 128MB 或 10,000 文件**（尽力而为） | 超出后**交付可能被截断**，不是报错而是静默变少 |
| GitHub 单文件 | >50MB 警告，>100MB 拒收 | push 直接失败 |
| GitHub 仓库 | 建议 <1GB，>5GB 受限 | 变慢、被封推送 |
| GitHub API | `gh` 认证可用，限流 5000/h | 大文件走 `contents` API 有 1MB 上限 → 用 git 而非 API |
| 磁盘（实测） | 21G 总 / **19G 可用**（本沙盒） | 不是瓶颈；瓶颈是 patchset 与"是否持久化" |

**结论：真正的红线不是磁盘，而是 ①是否落在 `/home/user` ②是否进过 git ③是否把 patchset 128MB 预算烧在无意义二进制上。**

## 2. 本项目的自设预算（留余量）

| 项 | 预算 | 超限怎么办 |
|----|------|-----------|
| 工作树（git 跟踪） | ≤ **60MB** | 把大素材移出仓库，只留路径清单 + 缩略图 |
| 单文件进 git | ≤ **25MB** | 压图/抽帧/分卷，或走"源 session push 分支"通道 |
| 交付图（`40_images/out/`） | 单张 ≤ **400KB**（JPEG q82 / WebP） | `convert -quality 82 -resize 1600x1600\>` |
| 原始素材（`90_archive/`） | **不进 git**，只提交 `_manifest.md`（文件名、来源、哈希、用途） | 需要重看时让我重新要那一份 |
| 跟踪文件数 | ≤ **2,000** | 检查是否误提交 node_modules/字体包 |
| 视频/字体包/模型/**CAD（含 STL/FCStd/zip）** | 一律不进仓库（用户 2026-09-20 指令：CAD 是临时分析件） | 走 `.scratch/` 取用即焚，只留结论 md + `DRIVE_INDEX.md` 索引 |
| 临时取用区 | `.scratch/` 任意体积，**只本地存活** | `scratch.sh clean` 删源；`status` 自检是否误入 git |

## 3. 最新自检（脚本原样输出）

```
CAPACITY CHECK — 2026-09-20 (Session 5)
[1] 磁盘: 总 21G 已用 9% 可用 19G
[2] 工作树 705KB | .git 425KB | 跟踪文件 25 个            ← 距 60MB/2000 个极远，健康
[3] 大文件 >25MB: 无
[4] 未提交改动: 已处理（每轮末 commit+push）
[5] local == remote (arena/01a0bd80-retrofitlock)          ← 成果在 GitHub 上
[6] 易失区: /tmp/chromium 200M(不持久) ~/.local 129MB ~/.npm 236MB(均不持久)
[7] 工具链: Pillow ✅ fpdf2 ✅ fonttools ✅ imageio-ffmpeg ✅ ImageMagick ✅
    中文字体 ✅（已迁到 /home/user/.npm-fonts，76MB，1836 个 woff2，不进 git）
    puppeteer/chromium ❌ 缺 libnss3（沙盒内 page.pdf() 不可用，见方法论 sandbox-pdf-limitation-workaround）
VERDICT: PASS（除 [7] 的 PDF 引擎已知缺口）
```

## 4. 网络：沙盒与工具走的是两条不同网络（2026-09-20 更正，重要）

**同一域名会有两种结果，取决于用哪个工具。** 本 session 做过对照实验：

| 途径 | `example.com` | Google 域名 | 结论 |
|------|---------------|-------------|------|
| `bash` / `curl`（沙盒内） | **000 不通** | `drive.google.com` 000 不通 | 沙盒是白名单：只有 `github.com`/`api.github.com`/`codeload`/npm/PyPI |
| `fetch_page` / `web_search`（工具侧，沙盒外） | **可读** | `workspace.google.com` 可读 | **不是白名单，能上公网** → Drive 直链可读（见下） |

→ 两条收件通道都成立（**2026-09-20 实测跑通，非推测**）：
1. **Drive 直链（用户默认通道）** —— `fetch_page` 可读：
   · 列文件夹：`https://drive.google.com/drive/folders/<FOLDER_ID>` 或 `.../embeddedfolderview?id=<FID>#grid`
     → 得到**文件名、大小、每个文件的 33 位 file id**（两个 folder 我都枚举成功）
   · 读正文：`https://drive.google.com/uc?export=download&id=<FILE_ID>`（md/txt 返原文；PDF 可解析；`?usp=sharing` 预览页不行）
   · 读不到：Drive 里的二进制（zip / FCStd / mp4 / png）只返回文本页；**且不能写回**（无凭证、无同步、无监听）
   这与本项目自己写的纪律一致（`00_EXP1-DRIVE_SourceOfTruth_Registry` §2/§8）：
   **链接可读 ≠ 已校验**，只有进 workspace 并读成功才算 `Agent read`；不得因"已上传 Drive"就声称读过。
2. **git 通道**：源 session push 到 `main`/`inbox`，我 `git fetch`（成堆文件、源码、要保真度的东西）。

**渲染工具链实测（2026-09-20）**：`cadquery 2.8 + OCP` 已装但 `import` 失败 —— **缺 `libGL.so.1`**（无 mesa、apt 不通、无 root）
→ STEP 解析暂不可用。`trimesh` 已装，**读 STL/OBJ/GLB 不需要 OCP** → 拿到 STL 就能出精确 mesh。
`@napi-rs/canvas`（npm，2D 光栅可用）、`gl`/headless-gl 8.1.6（要编译+系统 GL，大概率不通）、
`@sparticuz/chromium`（二进制可解出，缺 libnss3）。→ 结论写进方法论 `cad-verified-render-pipeline`。

**沙盒内做不到的（真限制，别试）**：`curl`/pip 从 GitHub 之外抓文件、npm 从非官方源、
`apt`（无 root + 源不通）、chromium 的 CDN（`cdn.playwright.dev`/`storage.googleapis.com`）、
`raw.githubusercontent.com` 与 GitHub LFS —— **但 `gh api repos/.../contents/<path>` 可用，单文件 ≤1MB**。

### 4b. Drive 能力**按沙盒不同**（不是按链接形式）
| 沙盒 | 拉 Drive 二进制 | 证据 |
|---|---|---|
| 旧 session（EXP1 / Agent3） | ✅ 可以 | `J07 R15` + `D67`：沙盒内 curl 下载 `CAD-贴锁-设计-stl.zip` + 2 视频并读取；`00_EXP1-J09` 操作手册即沙盒 curl |
| 本 session（Session 5） | ❌ 不行 | `drive.google.com`/`drive.usercontent`/`workspace.google.com` 全 000，而 github/npm/PyPI=200；同 FILE_ID 用 `fetch_page` = HTTP 500（同工具读 md 成功） |
→ 结论：**能力必须每次探测**，不能记忆。探针：`bash 00_meta/scripts/probe-drive.sh [FILE_ID]`。

## 5. 回答"session 5 还需要空间提示吗"

**需要，但只剩三条**（其余我已在脚本里自动查了）：

1. **别把 `/tmp` 当仓库**：要留下的东西一律 `/home/user/...`；重装依赖用 `bash 00_meta/scripts/capacity.sh --fix`（不要手写安装命令，也不要记在脑子里）。
2. **图片进 git 前必须压**：交付图 ≤400KB。AI 出图原始尺寸常在 1–3MB，一次 30 张就吃掉 60MB 预算的一半，且**patchset 是累计的** —— 后半程（网站）才是真正需要余量的时候。这就是为什么压缩是**规则**而不是优化。
3. **网站阶段（④）注意**：`node_modules`、`dist`、`.next`、`.cache`、`out` 已被 `.gitignore`/Arena 排除，但**大字体与大图放 `60_website/public/` 会进 git**：字体一律走 `@fontsource` 的 CDN-less 本地引用或让 dev server 直接从 `/home/user/.npm-fonts` 复制；不要为了省事把 76MB 字包塞进仓库。

顺带：**当前用量离任何上限都很远**（工作树 705KB）。真正会爆的只有"把视频/源文件/字体包塞进仓库"这一种行为。

## 6. merge 闸门（与容量无关，但和 session 存活有关）

用户要求在一个 session 内连做 图→目录→网站，因此：阶段完成**不 merge**，只 push 到工作分支；
必须**征得用户明确同意**才 merge（详见 `META.md` M3）。理由：merge 会让本 session 对话结束。
