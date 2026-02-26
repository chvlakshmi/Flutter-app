# Flutter + Android Setup Guide (macOS)

Follow these steps to run Flutter Android apps on your Mac.

---

## Step 1: Install Flutter SDK

### Option A: Quick install (recommended)

From your terminal, run:

```bash
bash /Users/shipsy/Downloads/flutter/install_flutter.sh
```

Then **close and reopen your terminal**, or run:

```bash
source ~/.zprofile
```

### Option B: Manual install

1. **Xcode Command Line Tools** (if not already installed):

   ```bash
   xcode-select --install
   ```

2. **Clone Flutter** (e.g. into your home directory):

   ```bash
   git clone https://github.com/flutter/flutter.git -b stable ~/flutter
   ```

3. **Add Flutter to PATH** — add this line to `~/.zprofile` (create the file if it doesn’t exist):

   ```bash
   export PATH="$HOME/flutter/bin:$PATH"
   ```

4. Reload your shell: `source ~/.zprofile`

### Verify Flutter

```bash
flutter --version
flutter doctor
```

---

## Step 2: Install Android Studio & Android SDK

1. **Download Android Studio**  
   https://developer.android.com/studio  
   Download the Mac version and install it (drag to Applications).

2. **First launch**  
   Open Android Studio and complete the setup wizard. It will install the Android SDK.

3. **Open SDK Manager**  
   - **Welcome screen:** More Actions → **SDK Manager**  
   - **With a project open:** **Tools → SDK Manager**

4. **SDK Platforms tab**  
   - Select **API Level 36** (or the latest stable).  
   - If it shows “Update available” or “Not installed”, check it and click **Apply**.

5. **SDK Tools tab**  
   Ensure these are installed (check and click **Apply** for any missing):

   | Component | Required |
   |-----------|----------|
   | Android SDK Build-Tools | Yes |
   | Android SDK Command-line Tools | Yes |
   | Android SDK Platform-Tools | Yes |
   | Android Emulator | Yes (for emulator) |
   | NDK (Side by side) | Yes |
   | CMake | Yes |

6. Click **Apply** and wait for downloads to finish, then **Finish**.

---

## Step 3: Accept Android licenses

In a terminal (with Flutter on your PATH):

```bash
flutter doctor --android-licenses
```

Type `y` and Enter for each license until you see:

```text
All SDK package licenses accepted.
```

---

## Step 4: Validate setup

```bash
flutter doctor -v
```

Fix any issues it reports. When Android is ready you should see something like:

- **Android toolchain** – no errors  
- **Android Studio** – version found  

---

## Step 5: Run a Flutter app on Android

### Using an emulator

1. In Android Studio: **Tools → Device Manager** (or **More Actions → Virtual Device Manager** on the welcome screen).
2. Click **Create Device** (+), pick a phone (e.g. Pixel 6), click **Next**.
3. Download a system image (e.g. API 34 or 35), select it, click **Next**, then **Finish**.
4. In Device Manager, click the **Run** (play) button next to the AVD to start the emulator.
5. In your project folder:

   ```bash
   flutter run
   ```

   Flutter will use the running emulator.

### Using a physical device

1. On the phone: **Settings → About phone** → tap **Build number** 7 times to enable Developer options.
2. **Settings → Developer options** → enable **USB debugging**.
3. Connect the phone via USB. Allow USB debugging when prompted.
4. In the project folder:

   ```bash
   flutter devices
   flutter run
   ```

---

## Quick reference

| Command | Purpose |
|--------|--------|
| `flutter doctor -v` | Check Flutter and Android setup |
| `flutter doctor --android-licenses` | Accept Android SDK licenses |
| `flutter devices` | List connected devices and emulators |
| `flutter emulators` | List available emulators |
| `flutter run` | Run app on a selected device/emulator |

---

## Troubleshooting

- **“flutter: command not found”**  
  Ensure `PATH` includes Flutter’s `bin` and that you’ve run `source ~/.zprofile` (or reopened the terminal).

- **Android licenses fail**  
  Make sure Android Studio and SDK are installed, then run `flutter doctor --android-licenses` again.

- **No devices found**  
  Start an emulator from Android Studio’s Device Manager, or connect a physical device with USB debugging enabled.

- More help: https://docs.flutter.dev/install/troubleshoot#android-setup
