#!/usr/bin/env bash
# probe-drive.sh — 每次 session 开局跑一次：**本沙盒**能不能直接从 Drive 拉文件
# 为什么要这个脚本：沙盒网络策略**每个 session 可能不同**，所以能力必须"探测"，不能"记忆"。
#   证据：旧 session 能（J07 R15 / D67：下载 CAD zip + 2 视频并读通；`00_EXP1-J09` 操作手册=沙盒内 curl）
#         本沙盒不能（下列域名全 000，连 github 是 200）→ 差异在沙盒出网策略，不在链接形式。
set -uo pipefail
ID="${1:-}"; OUT="${2:-$PWD/.scratch}"
mkdir -p "$OUT"
echo "=== 1) 域名可达性（沙盒内 curl，10s 超时）==="
for u in drive.google.com drive.usercontent.google.com lh3.googleusercontent.com github.com registry.npmjs.org pypi.org; do
  c=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "https://$u" 2>/dev/null); [[ -z "$c" ]] && c=000
  printf "  %s  %s\n" "$c" "$u"
done
ok=0; [[ "$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 https://drive.google.com 2>/dev/null)" != "000" ]] && ok=1

echo
echo "=== 2) 工具侧 fetch_page 是异步的，本脚本测不到 → 见下面建议 ==="
echo
if [[ "$ok" == "1" ]]; then
  echo "VERDICT: 本沙盒 **可直接拉 Drive**（沙盒出网未被限白名单）。"
  [[ -n "$ID" ]] && { echo "试拉 $ID →"; curl -sL --max-time 180 -o "$OUT/$ID.bin" \
      "https://drive.usercontent.google.com/download?id=$ID&export=download&confirm=t" \
      && echo "落地 $(wc -c <"$OUT/$ID.bin") bytes"; sha256sum "$OUT/$ID.bin" 2>/dev/null; }
  echo "推荐：A 沙盒 curl（就在本脚本里）→ 用后按 M10 删除源"
else
  echo "VERDICT: 本沙盒 **不能**拉 Drive（drive=000 而 github=200 → 白名单只放行少数域名）。"
  echo "按顺序改走："
  echo "  A) 聊天附件（本项目唯一保证落到沙盒的通道）"
  echo "     ⚠️ 附件也可能静默失败：发完让我跑 verify-upload.sh 才算数"
  echo "  B) fetch_page 读**文本类**（md/txt 成功；zip/stl/FCStd/mp4/png 失败：HTTP 500 或返回 HTML 壳）"
  echo "  C) 你本机拉好再分析：git clone https://github.com/lin2mm/RetrofitLock"
  echo "     bash 00_meta/scripts/fetch-drive.sh <FILE_ID> <文件名>   # 会落到 .scratch/，不进 git"
  echo "  D) 我 push 到仓库 inbox（但二进制不许进 git → 只适合推 <25MB 的文本/小 md）"
fi
echo
echo "提示：换一个 session 结果可能不同 —— 每次都跑这个，不要引用别处的结论。"
