# Adreno-Vulkan Termux Driver

---

## 🛠️ Requirements & Environment
* **Device:** Snapdragon SoC with Adreno GPU (Tested on Adreno 650)
* **OS:** Android (with MTE/Tagged Pointers active)
* **Environment:** Termux (Latest Version)

---

```
pkg update && pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install vulkan-loader-generic -y 
pkg install vulkan-headers -y
pkg install shaderc -y
pkg update && pkg upgrade -y
pkg install tur-repo -y
pkg install x11-repo -y
pkg install vkmark -y
pkg install ndk-sysroot -y
pkg install mesa-vulkan-icd-freedreno-dri3 -y
pkg install vulkan-tools -y
pkg install termux-elf-cleaner -y
pkg update && pkg upgrade -y
pkg install shaderc spirv-tools -y
pkg install spirv-tools -y
pkg install spirv-headers -y
pkg install switshader -y
pkg install mesa-vulkan-icd-swrast -y
pkg install tur-repo -y
pkg update
pkg install mesa-vulkan-icd-freedreno -y

find /system /vendor -name "*vk*.json" 2>/dev/null
export VK_ICD_FILENAMES=$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json
export ASAN_OPTIONS=allow_user_segv_handler=1
export EXECUTABLE_DISABLE_MTE=1

glslc --version
vulkaninfo --summary
```

---

*Expected Output:* `deviceName = Turnip Adreno (TM) XXX`.
