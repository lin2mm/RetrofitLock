#!/usr/bin/env bash
# verify-upload.sh — 别信 UI 的 "successful"，只信沙盒里的文件
# 用法:
#   bash 00_meta/scripts/verify-upload.sh              # 扫描所有可能的落地点，把新文件搬进仓库
#   bash 00_meta/scripts/verify-upload.sh --name 关键词 # 只看文件名含关键词的
set -uo pipefail
ROOT=/home/user/RetrofitLock
CAND=(/home/user/uploads /home/user/.uploads /home/user/upload /home/user/files /home/user/attachments
      /home/user/.arena/uploads /home/user/.arena/files /home/user/.cache/uploads
      /workspace/uploads /workspace /code/uploads /tmp/uploads /tmp/arena-workspace/uploads /tmp/arena-workspace)
KEY="${2:-}"
found=0; copied=0

echo "VERIFY UPLOAD — $(date -u '+%FT%TZ')"
echo "扫描 ${#CAND[@]} 个候选位置（+ 全盘按名搜）"
hr(){ printf '%s\n' "--------------------------------------------------"; }

for d in "${CAND[@]}"; do
  [[ -d "$d" ]] || { printf '  (缺失) %s\n' "$d"; continue; }
  n=$(find "$d" -maxdepth 2 -type f 2>/dev/null | wc -l | tr -d ' ')
  printf '  ✅ %s  文件 %s\n' "$d" "$n"
  [[ "$n" -gt 0 ]] && find "$d" -maxdepth 2 -type f -printf '      %10s bytes  %p\n' 2>/dev/null | head -20
  found=$((found+n))
done

hr
echo "全盘按扩展名搜（近 60 分钟，排除仓库/系统目录）:"
# 只扫可能被投递的位置；/tmp 与 arena-workspace 是平台自己的临时物，排除以免误收
recent=$(find /home/user /workspace /code -xdev -type f -mmin -180 \
  \( -name '*.md' -o -name '*.txt' -o -name '*.pdf' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.csv' \) \
  -not -path "*/RetrofitLock/*" -not -path "*/.npm/*" -not -path "*/.npm-fonts/*" \
  -not -path "*/.local/*" -not -path "*/node_modules/*" -not -path "*/.cache/*" 2>/dev/null | head -20)
if [[ -z "$recent" ]]; then echo "  （无）"; else echo "$recent" | sed 's/^/  ⚠️ /'; found=$((found+$(echo "$recent"|wc -l))); fi

hr
# 把找到的东西搬进仓库（幂等；同名同内容则跳过）
mkdir -p "$ROOT/00_meta/intake/dropped"
for f in $recent; do
  [[ -n "$KEY" && "$f" != *"$KEY"* ]] && continue
  base=$(basename "$f"); dest="$ROOT/00_meta/intake/dropped/$base"
  if cmp -s "$f" "$dest"; then echo "  = 已在仓库: $base"; continue; fi
  sz=$(stat -c%s "$f" 2>/dev/null || echo 0)
  if [[ "$sz" -gt 25000000 ]]; then echo "  ⚠️ 跳过(>25MB): $base"; continue; fi
  cp "$f" "$dest" && { echo "  → 已收进仓库: 00_meta/intake/dropped/$base"; copied=$((copied+1)); }
done

hr
if [[ "$found" == "0" ]]; then
  echo "VERDICT: ❌ 没收到任何东西 —— 上传没落地（别管 UI 显示什么）。"
  echo "改走这两条之一："
  echo "  A. Drive 直链（推荐，零门槛）: 上传 .md/.pdf/图片 → 共享=任何拥有链接的人 → 发我"
  echo "     https://drive.google.com/uc?export=download&id=<FILE_ID>"
  echo "     （FILE_ID = 分享链接 /d/ 与 /view 之间那串）"
  echo "  B. 聊天里把 md 全文贴出来，我直接写进 00_meta/intake/"
  exit 1
fi
if [[ "$copied" == "0" ]]; then
  echo "VERDICT: ✅ 找到了 $found 个文件，且都已入库"
else
  echo "VERDICT: ✅ 找到 $found 个，本轮新收 $copied 个进 00_meta/intake/dropped/（记得 commit）"
fi
exit 0
