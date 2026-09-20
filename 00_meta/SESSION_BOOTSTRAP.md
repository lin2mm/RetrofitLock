# SESSION_BOOTSTRAP — 新 session 系统顶层（2026-09-20 R20 建档）

> 用户指令（R20）：**以后所有新开的 session 都要有系统顶层的 loop、空间、命名体系、限制编造**。
> 本页 = 新 session 的第一页。四要素：① Loop（§1）② 空间（§2）③ 命名体系（§3）④ 限制编造（§4）。

## 0. 开局五步（固定顺序，没走完不接活）
```
① 读本页（SESSION_BOOTSTRAP.md）
② 读 00_meta/META.md（M0–M10 顶层规则）+ 00_meta/LOOP_AUDIT.md（loop 全清单）
   + loop_ledger.md 最后 3 行（上一 session 干到哪了）
③ 读约束三件套：NO_INVENT.md（禁编造总集）→ PRODUCT_TRUTH.md §0+§7（产品铁律+红线）
   → CAD_LOG.md + KNOB_LOG.md（外观唯一来源）
④ bash 00_meta/scripts/capacity.sh（空间/工具链自检，10 秒；报 FAIL 加 --fix）
⑤ 以上齐了才接任务。任务与旧记录冲突 → 先查 REUSABLE.md + 干扰台账：
   命中 → 引用/更正；未命中 → 才新建并登记。不另起炉灶。
```

## 1. Loop（顶层循环：每条用户消息 = 一轮，一轮 = 一次完整沉淀）
**轮内节奏（M2 三件套 + 本 session 强化）**：
1. **接令**：先查旧记录（§0 ⑤）→ 任务分型（`SHORTPATH_IMAGES_CN_v1.md`：Tier 0 外观 / Tier 1 工程，禁止把 Tier 1 当前置闸门）
2. **做事**：出图/写稿前 → 过 `NO_INVENT.md` 相关类 + 单一来源 prompt（CAD_LOG §1–2 / KNOB_LOG §1）；引用前核对原文（无证据=不写）
3. **自检**：出图后 → O1–O9 逐条打钩 + 数字 QA（剪影 PIL 实测）；两轮不过 → 降级提问（不得循环）
4. **沉淀（每轮必做，M9）**：
   - `loop_ledger.md` 加一行（无增量也要写原因）
   - 新方法论 → `methodology.md`（learn.sh 追加，先查重）
   - 空间/计数快照 → `LOOP_AUDIT.md`
   - `commit + push`（没进 GitHub = 不存在，M0）
**闸门**：merge 默认答案=否（M3，用户永久指令）；阶段完成只报告不合并。

## 2. 空间（工作区纪律：什么放哪、什么不留）
| 位置 | 放什么 | 纪律 |
|---|---|---|
| 仓库 `.git` | 规则/方法论/台账/指针型 md、文本成果 | **只文本**；二进制永不入库（CAD/视频/图片/zip） |
| `.scratch/` | 本 session 工作面：分析裁剪、临时脚本、出图候选 | gitignore 永不 push；**只留最新版**（新版出=删旧版）；临时脚本用完即删（M10） |
| `/home/user/uploads/` | 聊天附件落点（若平台落地） | **临时件**：读 → 存结论进 md → 删；永不推 GitHub（R13） |
| inbox 通道 | 唯一字节级文件传输（`push-inbox.sh`/`pull-inbox.py`，≤1MB，sha256 校验） | 送完即删源；登记进 `DRIVE_INDEX.md` |
| Drive | 用户的长期原件（CAD/确认稿/编号 md） | 只读；文本我 `fetch_page` 直读；二进制登记 FILE_ID 待通道 |

**红线**：`capacity.sh` 报 [4][5] 告警 → 先 commit/push 再做别的；128MB patchset 上限，大数据集/视频不进仓库（binary-artifact-capacity-discipline）。

## 3. 命名体系（细则 `naming.md`，新增先登记，不自由发挥）
- **目录段（稳定不改名）**：`00_meta`(规则) · `00_handoff`(进度) · `10_product`(事实源) · `20_audience` · `30_sales_assets` · `40_images`(图) · `50_catalog`(目录) · `60_website`(站) · `90_archive`(只读原件)
- **文件**：`snake_case.md`；有阅读顺序的加编号前缀 `NN_topic.md`
- **图片**：`<资产ID>_<slot类型>_<场景>_v<版本><状态>.ext`（如 `GL-BASE-01_packshot_white_v3-CAND.png`）；状态码封闭词表（ready-to-generate/queued/generated-candidate/approved/final/blocked-*/deprecated/placeholder），**新词先登记**
- **单一来源文档（数字只存一处，别处只放指针）**：
  | 域 | 唯一来源 |
  |---|---|
  | 产品铁律/禁止 | `PRODUCT_TRUTH.md`（红线全集 → `NO_INVENT.md`） |
  | CAD 外形/外观尺寸 | `CAD_LOG.md` §1–2 |
  | 旋钮 | `KNOB_LOG.md` §1 |
  | 禁编造约束 | `NO_INVENT.md` |
  | 命名/状态词 | `naming.md` |
  | Drive 资产 | `DRIVE_INDEX.md` |
  | 复用清单 | `REUSABLE.md` |

## 4. 限制编造（三条铁律 + 唯一完整清单）
**三条铁律（每轮开工前默念）**：
1. **无证据 = 不写**（描述必须指到原文/用户原话/CAD 实体）
2. **未批准 = 不外发**（NoSend；hypothesis/placeholder 永不外发、永不当"正确"的证据）
3. **prompt 单源**（只引 `CAD_LOG §1–2` + `KNOB_LOG §1`；工程文字进 prompt = 违规）

**唯一完整清单 = [`NO_INVENT.md`](NO_INVENT.md)**（0 总纲 / 1 外形 / 2 数字 / 3 声称 / 4 流程 / 5 变更规则）。
发现"无证据链的事实" = 错误信息：**当轮删除或改正 + 记干扰台账**（`CAD_LOG §4` / `KNOB_LOG §2`）——错误信息在仓库里过夜 = 下一代的干扰源（R16–R19 四次实证）。
