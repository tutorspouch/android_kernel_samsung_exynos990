# ArtisanKernel v0.0.3 for Exynos 990 devices

Based off ExtremeXT's [990_upstream_v2](https://github.com/ExtremeXT/990_upstream_v2)

And a huge thank you to Windblade-Furisode

## About Kernel
- Linux 4.19.325
- Name "People's Front"
- Display Version "4.19.325-ArtisanKRNL-v0.0.3+"


## Features
- Auto Builds in 45-50 minutes for all devices with Github Actions thanks to Windblade-Furisode
- OneUI 7.x support
- HyperOS 2.x support
- LineageOS 21.x support
- KernelSU Next support
- Fully open source with a clean commit history
## Issues
- OTG
- No susfs
## Supported devices:

- G980F - S20 4G - x1slte

- G981B - S20 5G - x1s

- G985F - S20+ 4G - y2slte

- G986B - S20+ 5G - y2s

- G988B - S20 Ultra (5G) - z3s

- G780F - S20 FE - r8s

- N980F - Note 20 4G - c1slte

- N981B - Note 20 5G - c1s

- N985F - Note 20 Ultra 4G - c2slte

- N986B - Note 20 Ultra 5G - c2s

## Build instructions:

1. Set up build environment as per Google documentation

https://source.android.com/docs/setup/start/requirements

* The `libarchive-tools` package is also necessary to patch the toolchain.
* The `ccache` package is necessary if you wish to build with CCache (Quicker subsequest builds)

2. Properly clone repository with submodules (KernelSU-Next and toolchains)

```git clone --recurse-submodules https://github.com/Android-Artisan/android_kernel_samsung_exynos990.git```

3. Build for your device without Recovery Kernel and with KSU-Next

```./build.sh -m x1slte -k y -r n```

4. Fetch the flashable zip of the kernel that was just compiled

```build/out/[your_device]/ArtisanKRNL...zip```

5. Flash it using a supported recovery like TWRP or PBRP (AOSP recovery does not work)

6. Enjoy!
