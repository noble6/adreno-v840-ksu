# Installed by KernelSU / Magisk.
SKIPUNZIP=0

if [ "$ARCH" != "arm64" ] || [ "$API" -lt 35 ]; then
	abort "! Needs arm64 and Android 15 or newer"
fi
if ! grep -qiE 'adreno[^0-9]*7[0-9][0-9]' /sys/class/kgsl/kgsl-3d0/gpu_model 2>/dev/null; then
	ui_print "- GPU: $(cat /sys/class/kgsl/kgsl-3d0/gpu_model 2>/dev/null)"
	abort "! Not an Adreno 7xx GPU"
fi
ui_print "- GPU: $(cat /sys/class/kgsl/kgsl-3d0/gpu_model)"

# Same labels as the stock driver, or apps can't load it.
set_perm_recursive $MODPATH/system/vendor/lib64 0 0 0755 0644 u:object_r:same_process_hal_file:s0
rm -f $MODPATH/boot_count
ui_print "- Reboot to use the new driver"
ui_print "- Remove the module to go back to stock"
