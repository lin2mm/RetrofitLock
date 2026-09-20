#!/usr/bin/env bash
# fetch-drive.sh — 在你自己电脑上跑（沙盒内 curl 被网络白名单挡死，实测 000），把文件拉到本仓库 .scratch/
# 用法: bash 00_meta/scripts/fetch-drive.sh <FILE_ID> <文件名>
#   例:  bash 00_meta/scripts/fetch-drive.sh 1HlDJX0bcZY_ZbNKrUjoXj87Bp9M4inLN CAD-贴锁-设计-stl.zip
# 纪律:  文件只进 .scratch/（gitignore 内，永不 push）；分析完跑 scratch.sh clean 删源，只保留结论 md。
set -uo pipefail
ID="${1:?需要 FILE_ID}"; NAME="${2:-file_$1.bin}"
REPO="$(git rev-parse --show-toplevel 2>/dev/null || echo /home/user/RetrofitLock)"
DEST="$REPO/.scratch"; mkdir -p "$DEST"
out="$DEST/$NAME"
echo "下载 → $out"
if command -v curl >/dev/null 2>&1; then
  curl -L --fail --retry 2 --max-time 300 \
    "https://drive.usercontent.google.com/download?id=$ID&export=download&confirm=t" \
    -o "$out" || { echo "❌ 失败：可能被病毒扫描确认页挡住。改用浏览器打开同链接手动下载，或用聊天附件。"; exit 1; }
else
  echo "❌ 没有 curl"; exit 1
fi
echo "--- 校验 ---"
sz=$(wc -c <"$out"); printf "size = %s bytes\n" "$sz"
if [[ "$sz" -lt 1024 ]]; then echo "⚠️ 太小，多半拿到的是 HTML 确认页而不是文件本体 → 试浏览器下载或附件上传"; fi
sha256sum "$out" | tee "$DEST/$NAME.sha256"
echo "完成。告诉 agent「已放到 .scratch/$NAME」，或直接把这个文件当聊天附件发过去。"
