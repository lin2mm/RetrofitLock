# INTAKE — 前序 session 蒸馏稿的收件箱

这个目录只有一个用途：**别的 session 把"我做了什么"写成一份 md，push 到本仓库**，我从这里取。
这样我不用你复述、不用 Drive、也不会丢信息。

## 期望的文件名
```
00_meta/intake/session1_market.md
00_meta/intake/session2_icp.md
00_meta/intake/session3_dm_catalog.md
00_meta/intake/session4_globallocksummary.md
```
一份 < 500 行的 markdown 就够。**不要**在这里放大图/视频（用聊天附件或同一次 push 放 `90_archive/`）。

## 我收到后做什么（每个 session 不用管）
1. `git fetch origin && git log --oneline origin/main -5` 找到 push 的 commit，作为出处记录。
2. 读蒸馏稿 → 把**方法论**合进 `00_meta/methodology.md`（改 `待验证` 为 `有效` 或标 `已废弃+原因`）。
3. 把**资产清单**合进 `00_meta/index_sessions1-4.md`（状态从 `❓待你上传` 改成 `✅已入库(路径)` 或 `⚪不用给`）。
4. 把**事实类内容**（ICP、话术、规格）落到 `10_product/`、`20_audience/`、`30_sales_assets/`。
5. 回你一句：这份蒸馏让我**省掉了哪几步**、还缺什么。
