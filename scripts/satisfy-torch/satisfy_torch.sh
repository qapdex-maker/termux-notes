#!/bin/bash

# ==============================================================================
# Universal Termux PyTorch Environment Setup Script
# Configurable via environment variables at runtime.
# ==============================================================================

set -e # Exit immediately if a command exits with a non-zero status

# --- Default Configurations (Overridable via Env Variables) ---
export REPO_UPGRADE=${REPO_UPGRADE:-"true"}
export PYTHON_VERSION=${PYTHON_VERSION:-"python"} # Defaults to system default python
export EXTRA_PKGS=${EXTRA_PKGS:-""}               # Add extra pkg packages here
export EXTRA_PIP_PKGS=${EXTRA_PIP_PKGS:-""}       # Add extra pip packages here

# --- System-wide Compiler Flags for Termux Compatibility ---
export CFLAGS=${CFLAGS:-"-O2 -pipe"}
export LDFLAGS=${LDFLAGS:-"-L/data/data/com.termux/files/usr/lib"}

echo "=================================================="
echo "💻 Starting Universal Pytorch Setup for Termux"
echo "=================================================="
echo "Python Command:  $PYTHON_VERSION"
echo "Compiler CFLAGS: $CFLAGS"
echo "Linker LDFLAGS:  $LDFLAGS"
echo "=================================================="

# 1. Sync and Upgrade Repositories if enabled
if [ "$REPO_UPGRADE" = "true" ]; then
    echo "🔄 Updating Termux repositories..."
    pkg update -y && pkg upgrade -y
fi

# 2. Install Core Build Dependencies
echo "📦 Installing build toolchain and system libraries..."
pkg install -y \
    clang \
    cmake \
    ninja \
    golang \
    git \
    binutils \
    libffi \
    openssl \
    libjpeg-turbo \
    libpng \
    $EXTRA_PKGS

# 3. Ensure Python and Pip are ready
echo "🐍 Ensuring Python core environment..."
pkg install -y "$PYTHON_VERSION"

# 4. Bootstrap Python Package Manager and Build Tools
echo "⚙️ Upgrading pip, setuptools, and wheel..."
"$PYTHON_VERSION" -m pip install --upgrade pip setuptools wheel

# 5. Install Required Math & Framework Core Dependencies
echo "📊 Installing foundational Python packages..."
"$PYTHON_VERSION" -m pip install --upgrade \
    numpy \
    pyyaml \
    typing-extensions \
    $EXTRA_PIP_PKGS

echo "=================================================="
echo "✅ Environment preparation complete!"
echo "💡 You can now proceed to with PyTorch."
echo "=================================================="
