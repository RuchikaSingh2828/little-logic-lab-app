#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [[ -d "/Applications/Xcode.app" ]] && xcodebuild -version >/dev/null 2>&1; then
  exec flutter run "$@"
fi

echo "Xcode is not configured yet. Running on Chrome instead."
echo "For macOS/iOS builds, install Xcode and run: ./scripts/setup_xcode.sh"
echo ""
exec flutter run -d chrome "$@"
