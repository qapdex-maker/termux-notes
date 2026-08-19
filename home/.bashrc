which glslc
vulkaninfo --summary
fastfetch
export PATH=~/.npm-global/bin:$PATH
export PATH=$PATH:$HOME/shaderc/build/glslc/
# --- Android API-Level ---
if command -v getprop >/dev/null 2>&1; then
    export ANDROID_API_LEVEL="$(getprop ro.build.version.sdk)"
# --- Android Api-Level export
# --- System Scan ---
  PLATFORM="termux"
else
  PLATFORM="linux"
fi

echo "System: $PLATFORM"
# ---
# --- pnpm ---
export PNPM_HOME="/data/data/com.termux/files/home/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- pnpm
# --- uv ---
export UV_PYTHON_PREFERENCE="only-system"
export CRYPTOGRAPHY_DONT_BUILD_RUST=1
export CARGO_BUILD_TARGET="$(uname -m)-linux-android"
export UV_CONCURRENCY=1
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
# --- uv export

# --- bun ---
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# --- bun export

# --- tmp dir ---
export TMPDIR="$PREFIX/tmp"
export TEMP="$PREFIX/tmp"
export TMP="$PREFIX/tmp"
# --- tmp export

# --- KMP Affinity ---
export KMP_AFFINITY="disabled"
# --- KMP export

# --- Adreno Vulkan ---
export VK_ICD_FILENAMES="$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json"
export GGML_VK_COMPUTE_OCCUPANCY_PRIORITY=high
export GGML_VK_PREFER_HOST_MEMORY=true
# export DISPLAY=:1
GALLIUM_DRIVER=zink
export MESA_NO_ERROR=1
export vblank_mode=0
export MESA_GLSL_CACHE_DISABLE=false
export MESA_SHADER_CACHE_DISABLE=false
export MESA_SHADER_CACHE_MAX_SIZE=1G
export mesa_glthread=true
export ZINK_DESCRIPTORS=lazy
# export MESA_VK_WSI_PRESENT_MODE=mailbox
export MESA_VK_WSI_PRESENT_MODE=immediate
export MESA_SPIRV_LOG_LEVEL=warn
  echo $MESA_VK_WSI_PRESENT_MODE
echo
# --- Adreno Vulkan export
echo "Done"
#
echo
export PATH="$HOME/bin:$PATH"
echo "====={☆}=====" 
ulimit 
