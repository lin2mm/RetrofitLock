#!/usr/bin/env bash
# scratch.sh — .scratch 生命周期：取用→分析→留结论→删源（META M10）
# 用法:
#   bash 00_meta/scripts/scratch.sh status   # 看有多少临时物、会不会污染仓库
#   bash 00_meta/scripts/scratch.sh clean    # 删掉 .scratch 里的源文件（保留 .md/.txt 结论与 .sha256）
#   bash 00_meta/scripts/scratch.sh purge    # 全删（连结论也删；只有已把结论写进仓库 md 后才用）
set -uo pipefail
REPO="$(git rev-parse --show-toplevel 2>/dev/null || echo /home/user/RetrofitLock)"
D="$REPO/.scratch"; mkdir -p "$D"
cmd="${1:-status}"

size(){ du -sh "$1" 2>/dev/null | cut -f1; }
n(){ find "$1" -maxdepth 1 -type f ! -name '.gitkeep' 2>/dev/null | wc -l | tr -d ' '; }

case "$cmd" in
status)
  echo ".scratch = $D"
  echo "  文件 $(n "$D") 个, 合计 $(size "$D")"
  find "$D" -maxdepth 1 -type f ! -name '.gitkeep' -printf '  %10s  %p\n' 2>/dev/null | sort -k2 -h -r | head -15
  # 关键：证明这些没被跟踪
  tracked=$(git -C "$REPO" ls-files .scratch 90_archive/cad | wc -l | tr -d ' ')
  [[ "$tracked" == "0" ]] && echo "  ✅ git 未跟踪任何临时源（符合规则：二进制不入库）" \
                         || { echo "  ❌ 有 $tracked 个临时/二进制文件被跟踪 → 立刻 git rm --cached"; git -C "$REPO" ls-files .scratch 90_archive/cad | sed 's/^/     /'; }
  ;;
clean)
  before=$(n "$D")
  find "$D" -maxdepth 1 -type f ! -name '.gitkeep' ! -name '*.md' ! -name '*.txt' ! -name '*.sha256' -delete 2>/dev/null
  echo "已删源文件（$before → $(n "$D")），保留结论 md/txt 与 sha256。体积 $(size "$D")"
  echo "下一步：确认结论已写进 00_meta/ 或 10_product/ 的 md，然后 commit。"
  ;;
purge)
  find "$D" -maxdepth 1 -type f ! -name '.gitkeep' -delete 2>/dev/null
  echo ".scratch 已清空，体积 $(size "$D")。前提：结论 md 必须已在仓库里（否则你删掉了唯一副本）。"
  ;;
*) echo "用法: scratch.sh status|clean|purge"; exit 1;;
esac
