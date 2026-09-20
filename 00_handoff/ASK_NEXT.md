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

## 那份 md（`00_MTH-J07_Agent3_Start_Summary_Plan_CN_v2.md`）
沙盒里确实不存在（`/home/user/uploads` 无此目录、全盘 find 无匹配），跟你说的一致：mark successful 点错了。
**别重传** —— 直接把它放进 Drive 发我第一条链接，我们顺便验证 Drive 通道是否真的可用。
