#!/usr/bin/env python3
"""
pull-inbox.py — 从 GitHub 收件分支把文件**取进沙盒**（本沙盒唯一可靠的二进制通道）

为什么存在：沙盒 curl 拉不到 Drive（drive.*=000，实测），聊天附件会静默失败（本项目已 3 次）。
但 `api.github.com` 在沙盒白名单内 → **旧 session 或你把文件 push 到 `inbox` 分支，我就能按字节取回来**。
已实测：png 取回后 sha256 与原件一致。

用法:
  python3 00_meta/scripts/pull-inbox.py                       # 列出 inbox 里的文件（名字/大小/是否≤1MB）
  python3 00_meta/scripts/pull-inbox.py --get inbox/文件名        # 注意路径带 inbox/ 前缀；取到 .scratch/（M10：用完 scratch.sh clean 删源）
  python3 00_meta/scripts/pull-inbox.py --get 文件名 --dest 40_images/refs/design
限制:
  - contents API 只返回 ≤1MB 的文件；>1MB 请拆分或用聊天附件
  - 取回后自动 sha256 打印，请与 Drive/源 session 的 manifest 比对
"""
import base64, hashlib, json, os, subprocess, sys, urllib.request

REPO = "lin2mm/RetrofitLock"
BRANCH = os.environ.get("INBOX_BRANCH", "inbox")
ROOT = subprocess.run(["git", "rev-parse", "--show-toplevel"], capture_output=True, text=True).stdout.strip()

def api(path, raw=False):
    req = urllib.request.Request("https://api.github.com/" + path)
    req.add_header("Accept", "application/vnd.github.raw+json" if raw else "application/vnd.github+json")
    try:
        with urllib.request.urlopen(req, timeout=45) as r:
            data = r.read()
        return data if raw else json.loads(data or b"{}")
    except Exception as e:
        sys.exit(f"❌ api 失败 {path}: {e}")

def listing(path="", acc=None):
    items = api(f"repos/{REPO}/contents/{path}?ref={BRANCH}")
    if isinstance(items, dict):
        items = [items]
    for it in items:
        if it["type"] == "dir":
            listing((path + "/" + it["name"]).strip("/"), acc)
        elif acc is not None:
            acc.append(it)

def main():
    args = sys.argv[1:]
    if args and args[0] == "--get":
        name = args[1]
        dest = ".scratch"
        if "--dest" in args:
            dest = args[args.index("--dest") + 1]
        d = os.path.join(ROOT, dest)
        os.makedirs(d, exist_ok=True)
        blob = api(f"repos/{REPO}/contents/{name}?ref={BRANCH}", raw=True)
        out = os.path.join(d, os.path.basename(name))
        with open(out, "wb") as f:
            f.write(blob)
        print(f"✅ 取回 {len(blob)} bytes → {out}")
        print("   sha256:", hashlib.sha256(blob).hexdigest())
        print("   下一步：分析完跑 bash 00_meta/scripts/scratch.sh clean（源不留）")
        return
    files = []
    listing("", files)
    if not files:
        print(f"(inbox 分支为空或无文件)  当前分支 {BRANCH}")
        return
    print(f"inbox@{BRANCH} 共 {len(files)} 个文件：")
    for f in sorted(files, key=lambda x: x["path"]):
        ok = "可取" if f.get("size", 0) <= 1_048_576 else "❌>1MB 需拆分"
        print(f"  {f['size']:>10} B  {f['path']}   [{ok}]")
    print("\n取用：python3 00_meta/scripts/pull-inbox.py --get <path>")

main()
