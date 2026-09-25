# 收件待办 — 下一条消息给我这些就够（Drive 直链）

> 用法：Drive 里上传原文件 → 共享设「任何拥有链接的人 = 查看者」→ 把下面的 `<FILE_ID>` 换成真实 ID，
> 一行一条粘给我。我读到的内容会立刻存进 `00_meta/intake/` 并 commit，然后回你"实收到 N 份 + 还缺 M 项"。
> 格式：标准形式：`https://drive.google.com/uc?export=download?id=<FILE_ID>`
> 我读到的是登录页/JS 壳时会立刻回你一句换成哪种形式，不用你自己猜。

## 第一优先：企业资料（阻塞产品图与目录，4 项）
```
S3-C 配件/适配清单: https://drive.google.com/uc?export=download&id=<FILE_ID>
S3-J 规格表(尺寸/孔距/门厚/认证/MOQ/价): https://drive.google.com/uc?export=download&id=<FILE_ID>
S3-A 成品设计稿(PNG/JPG，≥1600px): https://drive.google.com/uc?export=download&id=<FILE_ID>
S3-B 实拍视频抽帧包(zip 或几张关键帧): https://drive.google.com/uc?export=download&id=<FILE_ID>
```
有就一起给（没有别硬凑，我按占位继续）：
```
S3-D 旧目录 PDF: ...
S3-E DM 话术 + 回复/索目录数据: ...
S3-F 客户异议原话(英文): ...
S2-A ICP 定义: ...
```

## 第二优先：S1 / S2 的 index（给我 3 行就够，别整理全文）
```
S1-index: 文件名 | 在哪(Drive/本地) | 一句话内容 | 要不要我读
S2-index: 同上
S4-index: 同上（网站大纲 + 是否已部署 URL + 定位一句）
```
我拿到 index 自己挑要不要读 —— 你不用判断哪份重要，那是我的活。

## 已收到（不用重传）
你给的 folder `1MHsQ5cQTBeUyh-eS3rv-qMfk4Bf8SnhT` 我用 `fetch_page` 枚举成功，4 份 md 已读并落库
（`00_meta/intake/_READ_LOG.md` + `00_meta/PRODUCT_TRUTH.md`）。那份 J07 的 md 也从 Drive 读到了 —— **沙盒没落文件也没关系，Drive 通道够用**。
所以之前那句"附件没落地"不再是阻塞，我把通道写死了。

## 现在唯一卡住「铝合金边框 + 电池盖正确出图」的 4 项
（都在 Canonical 文件夹 `14Enb5EiikE_EbIqReAp-oEqqPqg4EtSi` 里，但二进制我读不到正文，需要下面两种方式之一）
```
1) CAD-贴锁-设计-stl.zip            473KB   → 聊天附件优先；或 Drive 链接我按 folder 里已知 id 试文本(不行)
2) 装配-DB-4-成功.FCStd              17KB   → 同上（或你从 FreeCAD 导出 STL/OBJ/GLB 更省事）
3) 电池盖外观已由确认稿定稿。不再把三张装配截图当成现行依据
4) nuki like lock smallest size...mp4 1.3MB  → 我这边有 static ffmpeg，传进来就抽帧
```
**取源只要两条路径之一**（二进制我不会 push 到 GitHub，也不会留在工作区）：
- **A. 聊天附件**：CAD 压缩包 + 1 个 FCStd。电池盖外观不再等三张截图。分析后不把二进制留在工作区。
- **B. 你本机跑**（若附件不方便）：`bash 00_meta/scripts/fetch-drive.sh 1HlDJX0bcZY_ZbNKrUjoXj87Bp9M4inLN CAD-贴锁-设计-stl.zip`
  然后**把生成的 `.md` 结论**（不是 zip）留给我 —— 但注意我这边沙盒读不到你本机，所以 B 实际只适合"你本地自己看几眼再决定发哪几帧"。
→ 结论：**走 A**。Drive 里的 id 我已全部登记在 `00_meta/DRIVE_INDEX.md`，随时可按需重取，不必反复上传。
我收到后：SHA256 记进索引 → STL 进 trimesh →
出 6 个正交/等轴视图 + 尺寸 QA → **QA 不过就不给你看**（这就是不再返工的关键）。
