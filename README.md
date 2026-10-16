# Adreno v840 Vulkan driver (KernelSU / Magisk module)

Qualcomm's a7xx Vulkan driver v840 (built 07/21/25, compiler
E031.50.17.00, Vulkan 1.4) for ruan / dizi (Adreno 710), from
K11MCH1/AdrenoToolsDrivers. Stock on HyperOS OS3.0 is 05/02/25,
EV031.36.08.33.

- Replaces only `/vendor/lib64/hw/vulkan.adreno.so` and adds its own
  libraries as `not*.so` next to the stock ones. OpenGL ES stays stock.
- Nothing on /vendor is modified: remove the module and reboot to get
  the stock driver back.
- Boot guard: if Android doesn't finish booting three times in a row,
  the module disables itself. KernelSU safe mode (press Volume Down a
  few times during boot) also skips all modules.

## Install

Flash the zip from the [Releases](../../releases) page in KernelSU
Manager (or Magisk) and reboot.

Check it's active:

```
adb shell cmd gpu vkjson | grep -m1 driverInfo
```

should show `Date: 07/21/25`, `Compiler Version: E031.50.17.00`.

## Tested

Redmi Pad Pro 5G (ruan), AxionOS 2.9 (Android 16), KernelSU: Adreno
(TM) 710, Vulkan 1.3.295, driver 07/21/25.

## Credits

- Driver extracted by Hugo and StevenMX, packaged in
  [K11MCH1/AdrenoToolsDrivers](https://github.com/K11MCH1/AdrenoToolsDrivers)
  (release v840)
- The Adreno driver is Qualcomm's proprietary software
