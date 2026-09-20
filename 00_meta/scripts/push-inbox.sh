#!/usr/bin/env bash
# push-inbox.sh — 把文件送进 `inbox` 收件分支（**不碰 main、不碰会话分支**，所以不影响 session 存活）
# 你在任何有 GitHub 写权限的地方跑（本 session / 旧 session / 你本机）：
#   bash 00_meta/scripts/push-inbox.sh 文件1 文件2 ...
# 然后回来说一句"已 push inbox"，我在沙盒里跑 pull-inbox.py 按字节取回（已实测 sha256 一致）。
# 限制：单文件 ≤1MB（contents API）；更大的用聊天附件，或 zip 分卷：
#   zip -s 900k big.zip --split-out part_ && bash 00_meta/scripts/push-inbox.sh part_z01 part_z02 ...
set -euo pipefail
export GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-inbox}" GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-inbox@arena.local}" \
        GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME" GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
[[ $# -ge 1 ]] || { echo "用法: push-inbox.sh 文件..."; exit 1; }
REPO_URL="https://github.com/lin2mm/RetrofitLock"
TMP=$(mktemp -d); trap 'rm -rf "$TMP"' EXIT
git clone -q --depth 1 --branch inbox "$REPO_URL" "$TMP/r" 2>/dev/null || {
  git clone -q "$REPO_URL" "$TMP/r"; cd "$TMP/r"; git checkout -q -b inbox 2>/dev/null || git checkout -q inbox; cd ..; }
cd "$TMP/r"
mkdir -p inbox
for f in "$@"; do
  sz=$(wc -c <"$f")
  if [[ "$sz" -gt 1048576 ]]; then echo "⚠️ 跳过 >1MB: $f ($sz)"; continue; fi
  cp "$f" "inbox/$(basename "$f")"; echo "  + inbox/$(basename "$f") ($sz B)  sha256=$(sha256sum "$f" | cut -c1-16)"
done
git add -A
git commit -q -m "inbox: $(date -u +%FT%TZ) $*" || { echo "无变化"; exit 0; }
git push -q origin HEAD:refs/heads/inbox
echo "✅ 已 push 到 inbox（未动 main / 未动会话分支）。告诉 Agent「已 push inbox」即可。"
