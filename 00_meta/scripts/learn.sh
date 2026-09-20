#!/usr/bin/env bash
# 把一条经验按 META M7 的四行格式追加进 methodology.md（保证格式统一、可被后续 session 引用）
# 用法: bash 00_meta/scripts/learn.sh <kebab-name> <板块A-D> "问题" "做法" "为什么" [状态]
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
f=00_meta/methodology.md
name="${1:?name}"; sec="${2:-X}"; q="${3:?问题}"; a="${4:?做法}"; w="${5:?为什么}"; st="${6:-待验证}"
grep -q "^### $name\$" "$f" && { echo "已存在：$name —— 要改就编辑 $f，别重复追加"; exit 1; }
{ printf '\n### %s\n问题：%s\n做法：%s\n为什么：%s\n出处：Session 5 — %s | 状态：%s\n' "$name" "$q" "$a" "$w" "$(date +%F)" "$st"; } >> "$f"
echo "已追加到 $f（板块 $sec）。记得 commit + push，否则下个 session 看不见。"
