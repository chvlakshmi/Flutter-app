#!/usr/bin/env bash
# Install Flutter SDK and add to PATH for zsh (macOS).
# Run: bash install_flutter.sh

set -e

FLUTTER_DIR="${FLUTTER_DIR:-$HOME/flutter}"
PROFILE="${HOME}/.zprofile"

echo "=== Flutter SDK installer ==="
echo "Install location: $FLUTTER_DIR"
echo ""

# 1. Xcode Command Line Tools (required for git)
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
  echo "After the installer finishes, run this script again."
  exit 0
fi

# 2. Clone or update Flutter
if [[ -d "$FLUTTER_DIR/.git" ]]; then
  echo "Flutter already cloned at $FLUTTER_DIR. Updating..."
  git -C "$FLUTTER_DIR" fetch
  git -C "$FLUTTER_DIR" checkout stable
  git -C "$FLUTTER_DIR" pull
else
  echo "Cloning Flutter (stable) into $FLUTTER_DIR ..."
  git clone https://github.com/flutter/flutter.git -b stable "$FLUTTER_DIR"
fi

# 3. Add to PATH in .zprofile
PATH_LINE="export PATH=\"${FLUTTER_DIR}/bin:\$PATH\""
if grep -q "flutter/bin" "$PROFILE" 2>/dev/null; then
  echo "Flutter PATH already set in $PROFILE"
else
  echo "" >> "$PROFILE"
  echo "# Flutter SDK" >> "$PROFILE"
  echo "$PATH_LINE" >> "$PROFILE"
  echo "Added Flutter to $PROFILE"
fi

echo ""
echo "Done. Next steps:"
echo "  1. Reload your shell:  source $PROFILE"
echo "  2. Install Android Studio and SDK (see ANDROID_SETUP.md)"
echo "  3. Run:  flutter doctor --android-licenses"
echo "  4. Run:  flutter doctor -v"
