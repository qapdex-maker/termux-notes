# Universal PyTorch Environment Setup

A universal Bash script designed to set up PyTorch, and the required build toolchain directly on Android via Termux environment.

This script automates the installation of system packages and Python modules, while configuring critical environment variables to prevent compilation errors often encountered with resource-heavy AI libraries.

## Features

* **Package Updates:** Automatically brings Termux repositories up to date.
* **Build Toolchain:** Installs essential tools including `clang`, `cmake`, `ninja`, and `golang`.
* **Python Environment:** Sets up `python-pip`, `wheel`, and fundamental math libraries (`numpy`).
* **Error Prevention:** Automatically injects necessary compiler flags (`LDFLAGS`, `CFLAGS`) to eliminate common Termux linker errors.
* **Universal Configuration:** Ready to be driven via environment variables without editing the code.

## 📋 Prerequisites

* Android device with **Termux** app installed.
* At least 2–4 GB of free storage space for compiling dependencies.
* A stable internet connection.

## 🛠️ Usage

### 1. Download the script and make it executable
```bash
curl -O https://github.com/qapdex-maker/termux-notes/scripts/satisfy-torch/satisfy_torch.sh
chmod +x satisfy_torch.sh
```

### 2. Run the script
Run the script to install the default configuration:
```bash
./satisfy_torch.sh
```

### 3. Universal Customization (Advanced)
The script is universally adaptable. You can override target versions or inject alternative installation flags dynamically using environment variables at runtime:

* **Specify an alternative Python version:**
  ```bash
  PYTHON_VERSION="3.11" ./satisfy_torch.sh
  ```
* **Enforce custom compiler optimizations:**
  ```bash
  CFLAGS="-O3 -march=native" ./satisfy_torch.sh
  ```

## 🔍 How It Works

The script executes the following phase-by-phase pipeline:

1. **`pkg update && pkg upgrade`**: Syncs package indexes to eliminate dependency version mismatches.
2. **Dependency Tree Installation**: Installs the native system packages required to compile C/C++ wheel extensions.
3. **Environment Setup**: Configures standard paths targeting Termux library directories (`/data/data/com.termux/files/usr/lib`) so compilers can locate dependencies seamlessly.
4. **Python Package Provisioning**: Upgrades `pip` and deploys `wheel` to allow direct local binary package builds.

## ⚠️ Important Notes

* **Compilation Overhead:** Some Python packages must be compiled directly from source on your phone. This can take anywhere from 10 to 30 minutes depending on your device's CPU.
* **Android Phantom Process Killer:** Android often terminates heavy background operations in Termux. To prevent this, pull down your Android notification shade, expand the Termux notification, and tap **"Acquire wakelock"** before running the script.

## 📄 License

This project is licensed under the MIT License – see the original repository files for details.
