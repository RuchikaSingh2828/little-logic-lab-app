#!/usr/bin/env bash
set -euo pipefail

export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"

if ! command -v sdkmanager >/dev/null 2>&1; then
  echo "Installing Android SDK tools..."
  brew install openjdk@17 android-commandlinetools android-platform-tools
fi

if [ ! -e "$ANDROID_HOME/platform-tools" ]; then
  ln -sf "/opt/homebrew/Caskroom/android-platform-tools/37.0.0/platform-tools" "$ANDROID_HOME/platform-tools"
fi

echo "Installing Android SDK components..."
yes | sdkmanager --sdk_root="$ANDROID_HOME" --licenses >/dev/null
sdkmanager --sdk_root="$ANDROID_HOME" "platform-tools" "platforms;android-36" "build-tools;36.0.0"

flutter config --android-sdk "$ANDROID_HOME"
yes | flutter doctor --android-licenses >/dev/null

echo ""
flutter doctor
