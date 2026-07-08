#!/usr/bin/env bash
set -euo pipefail

die() {
  printf '错误: %s\n' "$1" >&2
  exit 1
}

if [[ $# -ne 1 ]]; then
  die "用法: $0 \"vWorkTree.app 的路径\""
fi

APP_PATH="$1"
INFO_PLIST="$APP_PATH/Contents/Info.plist"

[[ -d "$APP_PATH" ]] || die "找不到 app 目录: $APP_PATH"
[[ -f "$INFO_PLIST" ]] || die "找不到 Info.plist: $INFO_PLIST"

VERSION="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$INFO_PLIST" 2>/dev/null || true)"
if [[ -z "$VERSION" ]]; then
  VERSION="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleVersion' "$INFO_PLIST" 2>/dev/null || true)"
fi
[[ -n "$VERSION" ]] || die "无法从 Info.plist 读取版本号"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK_FILE="$REPO_ROOT/Casks/v-work-tree.rb"
REL_DIR="$REPO_ROOT/releases/download/v${VERSION}"
ZIP_PATH="$REL_DIR/vWorkTree.zip"

[[ -f "$CASK_FILE" ]] || die "找不到 Cask 文件: $CASK_FILE"

mkdir -p "$REL_DIR"
rm -f "$ZIP_PATH"

# 使用 ditto 打包应用，保留 macOS 应用包的资源和目录结构。
ditto -c -k --sequesterRsrc --keepParent "$APP_PATH" "$ZIP_PATH"

SHA256="$(shasum -a 256 "$ZIP_PATH" | awk '{print $1}')"

# 只替换版本号和 sha256，其他 Cask 信息保持不变。
VERSION="$VERSION" SHA256="$SHA256" perl -0pi -e 's/^(\s*version ")[^"]*(")/$1$ENV{VERSION}$2/m; s/^(\s*sha256 ")[^"]*(")/$1$ENV{SHA256}$2/m;' "$CASK_FILE"

printf '已更新版本: %s\n' "$VERSION"
printf '已生成压缩包: %s\n' "$ZIP_PATH"
printf 'SHA256: %s\n' "$SHA256"
