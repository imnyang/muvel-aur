#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
pkgbuild="$repo_root/PKGBUILD"
sources_url="https://raw.githubusercontent.com/imnyang/muvel-nix/refs/heads/main/sources.json"

tmpfile="$(mktemp)"
trap 'rm -f "$tmpfile"' EXIT

curl -fsSL "$sources_url" -o "$tmpfile"

python3 - "$tmpfile" "$pkgbuild" <<'PY'
import json
import re
import sys
from pathlib import Path

sources_path = Path(sys.argv[1])
pkgbuild_path = Path(sys.argv[2])

with sources_path.open(encoding="utf-8") as handle:
    data = json.load(handle)

version = data["version"]
linux = data["linux"]["x86_64"]
source_url = linux["url"]
hash_value = linux["hash"]
if hash_value.startswith("sha256-"):
    hash_value = hash_value[len("sha256-"):]

pkgbuild = pkgbuild_path.read_text(encoding="utf-8")
updated_pkgbuild = re.sub(r'(?m)^pkgver=.*$', f'pkgver={version}', pkgbuild, count=1)
updated_pkgbuild = re.sub(
    r'(?m)^source_x86_64=\(.*\)$',
    f'source_x86_64=("{source_url}")',
    updated_pkgbuild,
    count=1,
)
updated_pkgbuild = re.sub(
    r'(?m)^sha256sums_x86_64=\(.*\)$',
    f'sha256sums_x86_64=("{hash_value}")',
    updated_pkgbuild,
    count=1,
)

if updated_pkgbuild != pkgbuild:
    pkgbuild_path.write_text(updated_pkgbuild, encoding="utf-8")
    print(f"Updated PKGBUILD to version {version}")
else:
    print(f"PKGBUILD already up to date for version {version}")
PY
