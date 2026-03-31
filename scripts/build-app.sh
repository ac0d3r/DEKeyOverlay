#!/bin/zsh
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
APP_NAME="DEKeyOverlay"
BUILD_DIR="$ROOT_DIR/.build/release"
DIST_DIR="$ROOT_DIR/dist"
APP_DIR="$DIST_DIR/$APP_NAME.app"
CONTENTS_DIR="$APP_DIR/Contents"
MACOS_DIR="$CONTENTS_DIR/MacOS"
RESOURCES_DIR="$CONTENTS_DIR/Resources"
ICON_FILE="$ROOT_DIR/DEKeyOverlay/AppIcon.icns"

cd "$ROOT_DIR"
swift build -c release

rm -rf "$APP_DIR"
mkdir -p "$MACOS_DIR"
mkdir -p "$RESOURCES_DIR"

cp "$ROOT_DIR/DEKeyOverlay/Info.plist" "$CONTENTS_DIR/Info.plist"
cp "$BUILD_DIR/$APP_NAME" "$MACOS_DIR/$APP_NAME"
chmod +x "$MACOS_DIR/$APP_NAME"

if [[ -f "$ICON_FILE" ]]; then
    cp "$ICON_FILE" "$RESOURCES_DIR/AppIcon.icns"
fi

if command -v codesign >/dev/null 2>&1; then
    codesign --force --deep --options runtime --timestamp=none --sign - "$APP_DIR"
fi

echo "Built $APP_DIR"
