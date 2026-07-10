#!/usr/bin/env bash
set -euo pipefail

XCODE_APP="/Applications/Xcode.app"

if [[ ! -d "$XCODE_APP" ]]; then
  echo "Xcode is not installed."
  echo "Install it from the App Store, then run this script again:"
  echo "  open 'macappstore://apps.apple.com/app/xcode/id497799835'"
  exit 1
fi

echo "Configuring Xcode for Flutter..."
sudo xcode-select --switch "$XCODE_APP/Contents/Developer"
sudo xcodebuild -runFirstLaunch
sudo xcodebuild -license accept

if ! command -v pod >/dev/null 2>&1; then
  echo "Installing CocoaPods via Homebrew..."
  brew install cocoapods
fi

echo ""
echo "Checking iOS Simulator runtime..."
if ! xcrun simctl list runtimes 2>/dev/null | grep -q "iOS"; then
  echo "Downloading iOS Simulator runtime (requires ~8.5 GB free disk space)..."
  if ! xcodebuild -downloadPlatform iOS; then
    echo ""
    echo "Simulator download failed. Free at least 9 GB of disk space, then run:"
    echo "  xcodebuild -downloadPlatform iOS"
    echo ""
    echo "Or install it in Xcode: Settings > Components > iOS Simulator"
  fi
fi

echo ""
echo "Verifying setup..."
xcodebuild -version
flutter doctor

echo ""
echo "Done. You can now run: flutter run -d macos"
