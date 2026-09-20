#!/usr/bin/env bash
# verify-upload.sh — 别信 UI 的 "successful"，只信沙盒里的文件
# 修正 v2（2026-09-20）：兜底扫描曾把仓库内自建模板误算成用户文件 → 加 -not -path */RetrofitLock/*；旧版把平台自己的临时物（/tmp/arena-workspace/coding.*、/tmp/*.mjs）当成"用户文件"，
#                     且 found>0 但 copied=0 时误报"都已入库" → 假阳性。现把**用户投递位置**与**平台噪声**分开计数。
# 用法:
#   bash 00_meta/scripts/verify-upload.sh            # 判断本轮附件是否真落地
#   bash 00_meta/scripts/verify-upload.sh --copy     # 找到就顺手复制进 .scratch/（M10：分析完删源）
set -uo pipefail
ROOT=/home/user/RetrofitLock
SCRATCH="$ROOT/.scratch"; COPY=0; [[ "${1:-}" == "--copy" ]] && COPY=1
mkdir -p "$SCRATCH"
hr(){ printf '%s\n' "--------------------------------------------------"; }

# 1) 真正可能投递用户文件的目录
USER_DIRS=(/home/user/uploads /home/user/.uploads /home/user/upload /home/user/files /home/user/attachments
           /home/user/.arena/uploads /home/user/.arena/files /home/user/.cache/uploads
           /workspace/uploads /code/uploads)
# 2) 平台噪声（明确排除，不算用户上传）
NOISE_RE='arena-workspace|coding\.(patch|diff|numstat)|/\.npm/|/\.local/|/\.cache/(?!uploads)|node_modules|/tmp/(chromtest|pwtest|fonttest|cq|ff|av|t\.tgz|chromium)'

user_hits=()
for d in "${USER_DIRS[@]}"; do
  [[ -d "$d" ]] || { printf '  (不存在) %s\n' "$d"; continue; }
  while IFS= read -r f; do user_hits+=("$f"); done < <(find "$d" -maxdepth 3 -type f 2>/dev/null)
  printf '  存在 %s  → %s 个文件\n' "$d" "$(find "$d" -maxdepth 3 -type f 2>/dev/null | wc -l | tr -d ' ')"
done
# 兜底：按扩展名扫近 3 小时，排除仓库/平台目录
while IFS= read -r f; do
  [[ -z "$f" ]] && continue
  echo "$f" | grep -qE "$NOISE_RE" && continue
  user_hits+=("$f")
done < <(find /home/user /workspace /code -xdev -type f -mmin -180 \
    \( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' -o -name '*.md' -o -name '*.txt' -o -name '*.pdf' -o -name '*.csv' -o -name '*.zip' -o -name '*.stl' -o -name '*.obj' \) \
    -not -path "*/RetrofitLock/*" \
    -not -path "*/.npm*" -not -path "*/.local/*" -not -path "*/node_modules/*" 2>/dev/null | head -30)

# 去重
mapfile -t uniq < <(printf '%s\n' "${user_hits[@]:-}" | sed '/^$/d' | sort -u)
hr
if [[ "${#uniq[@]}" -gt 0 ]]; then
  echo "疑似用户投递文件 ${#uniq[@]} 个："
  printf '  %10s  %s\n' "$(wc -c <"${uniq[0]}" 2>/dev/null)" "" >/dev/null
  for f in "${uniq[@]}"; do printf '  %9s B  %s\n' "$(wc -c <"$f" 2>/dev/null)" "$f"; done
  hr
  if [[ "$COPY" == "1" ]]; then
    for f in "${uniq[@]}"; do
      b=$(basename "$f"); cp -n "$f" "$SCRATCH/$b" && echo "  → .scratch/$b（分析完 scratch.sh clean 删源）"
    done
  fi
  echo "VERDICT: ✅ 已落地 ${#uniq[@]} 个 → 状态可升为 Workspace received / Agent read（读成功才算）"
  exit 0
fi
echo "❌ 沙盒内没有任何用户投递文件。"
echo "   注意：平台噪声目录（/tmp/arena-workspace/coding.*）不算，已从判定中排除。"
hr
echo "替代通道（按当前沙盒能力选，先跑 probe-drive.sh）："
echo "  A) 重新用聊天附件上传；发完再跑我确认（附件会静默失败，本项目已发生 2 次）"
echo "  B) 文件放 Drive → 给我 folder 或文件链接：**文本我能读；二进制要先跑 probe-drive.sh 看本沙盒能不能 curl**"
echo "  C) 你本机：git clone 本仓库 && bash 00_meta/scripts/fetch-drive.sh <FILE_ID> <名字>"
echo "  D) 只有图片且很小：直接在对话里贴，我能看见内容但没有像素文件 → 只能做描述/规则，**不出正式图**（D65/R-22）"
exit 1
