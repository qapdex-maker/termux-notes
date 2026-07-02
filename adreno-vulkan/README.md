# Adreno-Vulkan (Turnip Adreno/Mesa) Termux Driver

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
pkg update -y
pkg install mesa-vulkan-icd-freedreno -y

find /system /vendor -name "*vk*.json" 2>/dev/null
export VK_ICD_FILENAMES=$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json
export ASAN_OPTIONS=allow_user_segv_handler=1
export EXECUTABLE_DISABLE_MTE=1

glslc --version
vulkaninfo --summary
```

---

```
# --- Adreno Vulkan ---
export VK_ICD_FILENAMES="$PREFIX/share/vulkan/icd.d/freedreno_icd.aarch64.json"
export GGML_VK_COMPUTE_OCCUPANCY_PRIORITY=high
export GGML_VK_PREFER_HOST_MEMORY=1
export DISPLAY=:1
export GALLIUM_DRIVER=zink
export MESA_NO_ERROR=1
export vblank_mode=0
export MESA_GLSL_CACHE_DISABLE=0
export MESA_SHADER_CACHE_DISABLE=0
export MESA_SHADER_CACHE_MAX_SIZE=2G
export mesa_glthread=true
export ZINK_DESCRIPTORS=lazy
# export MESA_VK_WSI_PRESENT_MODE=mailbox
export MESA_VK_WSI_PRESENT_MODE=immediate
export MESA_SPIRV_LOG_LEVEL=info
export ASAN_OPTIONS=allow_user_segv_handler=1
# --- Adreno Vulkan export
```
*Expected Output:* `deviceName = Turnip Adreno (TM) XXX`.
```
==========
VULKANINFO
==========

Vulkan Instance Version: 1.4.355


Instance Extensions: count = 25
-------------------------------
VK_EXT_acquire_drm_display             : extension revision 1
VK_EXT_acquire_xlib_display            : extension revision 1
VK_EXT_debug_report                    : extension revision 10
VK_EXT_debug_utils                     : extension revision 2
VK_EXT_direct_mode_display             : extension revision 1
VK_EXT_display_surface_counter         : extension revision 1
VK_EXT_headless_surface                : extension revision 1
VK_EXT_surface_maintenance1            : extension revision 1
VK_EXT_swapchain_colorspace            : extension revision 5
VK_KHR_device_group_creation           : extension revision 1
VK_KHR_display                         : extension revision 23
VK_KHR_external_fence_capabilities     : extension revision 1
VK_KHR_external_memory_capabilities    : extension revision 1
VK_KHR_external_semaphore_capabilities : extension revision 1
VK_KHR_get_display_properties2         : extension revision 1
VK_KHR_get_physical_device_properties2 : extension revision 2
VK_KHR_get_surface_capabilities2       : extension revision 1
VK_KHR_portability_enumeration         : extension revision 1
VK_KHR_surface                         : extension revision 25
VK_KHR_surface_maintenance1            : extension revision 1
VK_KHR_surface_protected_capabilities  : extension revision 1
VK_KHR_wayland_surface                 : extension revision 6
VK_KHR_xcb_surface                     : extension revision 6
VK_KHR_xlib_surface                    : extension revision 6
VK_LUNARG_direct_driver_loading        : extension revision 1
```
Instance Layers:
----------------
```
Devices:
========
GPU0:
        apiVersion         = 1.3.335
        driverVersion      = 26.0.6
        vendorID           = 0x5143
        deviceID           = 0x6050002
        deviceType         = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
        deviceName         = Turnip Adreno (TM) 650
        driverID           = DRIVER_ID_MESA_TURNIP
        driverName         = turnip Mesa driver
        driverInfo         = Mesa 26.0.6
        conformanceVersion = 1.2.7.1
        deviceUUID         = 91d356f6-9667-d5ab-ba50-f1ef4a6826ce
        driverUUID         = 9f34bcc0-96d4-b6c4-5010-ea16c686a97b
```
