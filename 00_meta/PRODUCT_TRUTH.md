# 项目真相源（继承自 EXP1 长期记忆，2026-09-20 由 Session 5 从 Drive 读取并落库）

> 来源：Drive 文件夹 `20260920-LockSession5`（folder id `1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT`）中
> `00_GTM_CAD_LongTermMemory_StartHere_v1_2026-09-19.md` 与 `00_EXP1-DRIVE_SourceOfTruth_Registry_CN_v1.md`。
> 读取时间 2026-09-20，`fetch_page` 成功，内容已原文存档于 `00_meta/intake/`（见 `_READ_LOG.md`）。
> **本页优先级高于 `base_unit.md` 里任何 `[待确认]` 占位。**

## 1. 产品冻结事实（不可改；改它 = 停止点，必须先问用户）
| 项 | 冻结值 | 状态 |
|----|--------|------|
| 品类 | 紧凑 retrofit 智能锁模组（Nuki 式），三层产品线：compact retrofit / 电子 deadbolt 模组 / 成品锁 | `Verified input` |
| 外壳 | **CNC 铝合金**，喷砂 + 氧化，灰/黑双冻结色 | `Verified input` |
| 外形包络 | **39.800 W × 22.500 D × 90.500 H mm**（固定尺寸，来自 `sx-db-4.stp`） | `Verified input` |
| 底部角 | **R 角**（v8 直角版曾被用户纠正 → v9 FINAL） | `Verified input` |
| 面盖（闭合盖） | **普通塑料**，棕/红棕**细密纹理**，`not real wood`（不是真木）；未确认塑料牌号与工艺 | `User-confirmed visual` |
| 旋钮 | **近直角矩形长条**；普通塑料；**无**金属套/装饰环/胶囊端/额外间隙；位置·比例·方向按确认稿 | `User-confirmed visual` |
| 底部电池盖 | **仅以用户 2026-09-20 新传的 3 张装配截图为准**；旧的底部塑料件推断链、错误配件识别、旧 CAD 输出**已删除，不得引用** | `User-confirmed`（图待取） |
| 品牌/UI | **无 logo、无可读 UI** | `Verified input` |
| 合规话术 | **不夸大** HomeKit / Matter / BHMA / ANSI | 硬约束 |

## 2. 母件与文件（CAD source of truth）
```
drive_imports/CAD_贴锁_设计_stl/                                    ← 唯一 CAD 真源
drive_imports/FreeCAD_assembly/装配-DB-4-成功.FCStd                  ← 成功装配（17KB）
drive_imports/CAD_贴锁_设计_stl/CAD-贴锁-设计-stl/铝合金CNC喷砂氧化高光/sx-db-4.stp  ← 铝合金外壳母件
```
Drive 里对应实物（我列过清单，尚未取得本地副本）：
`CAD-贴锁-设计-stl.zip` 473KB · `装配- DB-4-DC-4-成功-3个FCStd`（子文件夹）· `装配-DB-4-成功.FCStd` 17KB ·
`nuki like lock smallest size all over world.mp4` 1.3MB（= 当前产品/样机）· `nuki like lock with mortise.mp4` 356KB（= 外部安装参考）

面盖确认源：`uploads/01_SL-B03_Visual_ConfirmedClosedCover_DesignerFinal_Hero_Source_v1.png`
（其优先级**高于**此前 31/33 provisional 闭合外观图与历史派生 Hero 图）

## 3. 禁止事项（上一线踩出来的，逐条照抄）
- 不从原始塑料 STEP 自行推导外部可见性
- 不生成任何底部塑料件或内部配件的 CAD 预览
- 不引用已删除的 71–93 底部塑料记录
- 不把旧 provisional 装配或旧图写成工程事实
- **不从面盖视觉稿反推外壳厚度、尺寸或 R 角**
- 不得因"用户说已上传 Drive"就声称已读取/校验/同步；只有文件进 workspace 且读成功才算 `Agent read`
- 不得把已删除的本地路径称为当前可读取文件（当前状态是 `Drive source indexed / local copy deleted / refetch on demand`）

## 4. 状态词表（**采纳他们的，弃我自己那套**，映射见 `naming.md`）
`Drive pointer stored` → `User-reported` → `Workspace received` → `Agent read` → `Verified input`
→ `Angle hypothesis`(AI 推测，**非产品事实**) / `CAD verified angle`(经 CAD+QA) → `Approved asset`(可对外) ；`NoSend` 贯穿始终。

## 5. 视觉目录结构（沿用 EXP1 §4，本仓库对应）
```
01_ProductTruth ← 10_product/       05_Angle_Renders ← 40_images/out/（必须再分 Hypothesis_Not_ProductTruth / CAD_Verified / QA）
02_CAD          ← 90_archive/cad/    06_Scene_Images  ← 40_images/out/ 场景类
03_Video        ← 40_images/video/   07_GTM_Assets    ← 50_catalog/ + 60_website/
04_Frozen_Visual← 40_images/refs/frozen/{silver,black}/ + Visual_QA
99_Archive      ← 90_archive/
```
关键：**图必须分进 `Hypothesis_Not_ProductTruth/` 还是 `CAD_Verified/`**，两者混放就是之前反复返工的机制原因。

## 6. 交换协议（他们的，直接用）
用户上传后发：
```
DriveSource:
Package: <名字>
Contents: <几个视频/几个CAD>
Uploaded to workspace: yes/no
Requested check: <要检查什么>
```
我回传：
```
Input status: received / readable / partially readable / failed
Files read: ...
CAD type and units: ...
Video coverage: ...
Frozen visual match: ...
Open discrepancies: ...
Next gate: ...
```
每轮拉取后：diff 上一版 → 用户版存档到 `90_archive/user_uploads/` → 台账记一行。
