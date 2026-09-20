#!/usr/bin/env bash
# 00_meta/scripts/capacity.sh — 空间/容量自检 + 新沙盒一键恢复
# 用法: bash 00_meta/scripts/capacity.sh          # 只体检
#       bash 00_meta/scripts/capacity.sh --fix    # 体检 + 装缺失依赖 + 补 ffmpeg 抽帧
set -uo pipefail
cd "$(git rev-parse --show-toplevel 2>/dev/null || echo /home/user/RetrofitLock)"
FIX=0; [[ "${1:-}" == "--fix" ]] && FIX=1

hr(){ printf '%s\n' "--------------------------------------------------"; }
warn=0

echo "CAPACITY CHECK — $(date -u '+%F %TZ') — repo=$(basename "$PWD") branch=$(git rev-parse --abbrev-ref HEAD)"
hr

# 1. 磁盘
echo "[1] 磁盘 /home/user"
df -h /home/user | awk 'NR==2{printf "    总 %s  已用 %s(%s)  可用 %s\n",$2,$3,$5,$4}'
avail_kb=$(df -Pk /home/user | awk 'NR==2{print $4}')
[[ "$avail_kb" -lt 1048576 ]] && { echo "    ⚠️ 可用 <1GB，别再 npm i 大依赖"; warn=1; }

# 2. 仓库体积（Arena 快照 / patchset 关心的是这个）
echo "[2] 仓库体积（Arena patchset 上限约 128MB / 10,000 文件）"
repo_kb=$(du -sk . | cut -f1); git_kb=$(du -sk .git | cut -f1)
files=$(git ls-files | wc -l | tr -d ' ')
printf "    工作树 %sKB | .git %sKB | 跟踪文件 %s 个\n" "$repo_kb" "$git_kb" "$files"
[[ "$repo_kb" -gt 61440 ]] && { echo "    ⚠️ 超自设预算 60MB（预算见 00_meta/capacity.md）"; warn=1; }
[[ "$files" -gt 2000 ]] && echo "    ⚠️ 文件数偏多，检查是否误提交 node_modules"

# 3. 单文件红线（GitHub: >100MB 拒收，>50MB 警告）
echo "[3] 大文件（>25MB 不进 git；>100MB GitHub 直接拒）"
big=$(find . -path ./.git -prune -o -type f -size +25M -print 2>/dev/null | head -10)
if [[ -z "$big" ]]; then echo "    ✅ 无"; else echo "$big" | sed 's/^/    ⚠️ /'; warn=1; fi

# 4. 未提交改动（沙盒一销毁就丢）
echo "[4] 未提交改动（不 commit = 下个 session 看不见）"
dirty=$(git status --porcelain | wc -l | tr -d ' ')
[[ "$dirty" == "0" ]] && echo "    ✅ 干净" || { echo "    ⚠️ $dirty 个文件未提交"; warn=1; }

# 5. 与远端是否同步
echo "[5] 本地 vs 远端"
l=$(git rev-parse HEAD); r=$(git rev-parse -q --verify "refs/remotes/origin/$(git rev-parse --abbrev-ref HEAD)" || echo "-")
rr=$(git ls-remote origin "refs/heads/$(git rev-parse --abbrev-ref HEAD)" 2>/dev/null | cut -f1)
echo "    local=${l:0:8} remote=${rr:-?}" | sed 's/$/  /'
if [[ -z "$rr" ]]; then echo "    ⚠️ 远端无此分支 → 立即 push"; warn=1;
elif [[ "$l" != "$rr" ]]; then echo "    ⚠️ 未推送，成果不在 GitHub 上"; warn=1;
else echo "    ✅ 已同步"; fi

# 6. /tmp 里的临时物（不会被持久化）
echo "[6] 易失区（/tmp 与 ~/.local/.npm 不进快照）"
printf "    /tmp/chromium=%s  ~/.local=%sMB  ~/.npm=%sMB\n" \
  "$([[ -f /tmp/chromium ]] && du -h /tmp/chromium|cut -f1 || echo 缺失)" \
  "$(( $(du -sk /home/user/.local 2>/dev/null|cut -f1||echo 0) / 1024 ))" \
  "$(( $(du -sk /home/user/.npm 2>/dev/null|cut -f1||echo 0) / 1024 ))"
echo "    → 新 session 必须重跑: bash 00_meta/scripts/capacity.sh --fix"

# 7. 工具链是否齐
echo "[7] 工具链"
twarn=0
probe(){ if eval "$2" >/dev/null 2>&1; then echo "    ✅ $1"; else echo "    ❌ $1  (可选，--fix 会补)"; MISSING="$MISSING $1"; twarn=1; fi; }
MISSING=""
probe "Pillow"        "python3 -c 'import PIL'"
probe "fpdf2"         "python3 -c 'import fpdf'"
probe "fonttools"     "python3 -c 'import fontTools'"
probe "imageio-ffmpeg(抽帧)" "python3 -c 'import imageio_ffmpeg'"
probe "中文字体 @fontsource/noto-sans-sc" "test -d /home/user/.npm-fonts/node_modules/@fontsource/noto-sans-sc || npm ls -g @fontsource/noto-sans-sc"
probe "ImageMagick convert" "convert -version"
probe "playwright/puppeteer(缺 libnss3，可选)" "node -e 'require(\"puppeteer-core\")'"

hr
if [[ "$warn" == "0" && "$twarn" == "0" ]]; then echo "VERDICT: ✅ PASS — 空间、持久化、工具链都健康"
elif [[ "$warn" == "0" ]]; then echo "VERDICT: ✅ PASS（带提示）— 空间/持久化健康，仅工具链有可选项缺失，需要时跑 --fix"
else echo "VERDICT: ⚠️ BLOCK — 先处理未提交[4]/未推送[5]/超大文件[3]，再产出新东西"; fi

if [[ "$FIX" == "1" ]]; then
  hr; echo "FIX 模式：补齐缺失依赖"
  [[ "$MISSING" == *Pillow* ]] && python3 -m pip install -q --user --break-system-packages pillow fpdf2 fonttools imageio-ffmpeg 2>&1 | tail -2
  mkdir -p /home/user/.npm-fonts && cd /home/user/.npm-fonts
  [[ ! -d node_modules/@fontsource/noto-sans-sc ]] && timeout 120 npm i @fontsource/noto-sans-sc >/dev/null 2>&1 && echo "    noto-sans-sc 装到 /home/user/.npm-fonts"
  mkdir -p /home/user/RetrofitLock/40_images/video && python3 - <<'PY'
import os, imageio_ffmpeg
os.makedirs('/home/user/RetrofitLock/40_images/video', exist_ok=True)
open('/home/user/RetrofitLock/40_images/video/.ffmpeg_path','w').write(imageio_ffmpeg.get_ffmpeg_exe())
print("    ffmpeg:", imageio_ffmpeg.get_ffmpeg_exe())
PY
  echo "    重跑体检:"; echo "    bash 00_meta/scripts/capacity.sh"
fi
exit 0
