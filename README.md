# Download
  - First you have to install Mobox (https://github.com/olegos2/mobox)
  - Copy this command and run it in Termux:
```
curl -s -o ~/x https://github.com/GabiAle97/mobox-updater/releases/download/mesa/installer.sh && chmod +x x && . ~/x
```

# Mobox Updater
Script to update:
- libs (xcb, xproto)
- mango-hud (now it's usable and always active, so disable dxvkhud on mobox config)
- Environment Variables (new ones from box64)
  - BOX64_IGNOREINT3=0
  - BOX64_FUTEX_WAITV=1
  - BOX64_DYNAREC_DIV0=1
  - BOX64_CEFDISABLEGPUCOMPOSITOR=1
  - BOX64_CEFDISABLEGPU=1
  - BOX64_MALLOC_HACK=1
  - BOX64_RESERVE_HIGH=1
  - BOX64_SSE_FLUSHTO0=1
  - BOX64_SYNC_ROUNDING=1
  - BOX64_DYNAREC_WAIT=1
  - BOX64_X87_NO80BITS=1
- vkd3d to 2.12
- turnip to 24.1.0 18/APRIL/24 build (turnip v6.5 is installing this version now)
- dxvk to 2.3.1 (dxvk-dev is installing this version now)
- box64 to 18/APRIL/24 build

# FUNCTIONALITY TEST

## Device
  - Motorola Edge 30 Fusion
  - root
  - 12GB RAM
  - SD 888+
  - Android 13 (NO CUSTOM ROM TESTED)
  - Mobox with default Wine 9.3
## Gameplay
  - Resident Evil Village:
  
## Thanks to:
  - Ilya (https://github.com/Ilya114) for Box64 build
  - Airidosas (https://github.com/airidosas252) for Turnip
  - HansKristian (https://github.com/HansKristian-Work) for VKD3D
  - Doitsujin (https://github.com/doitsujin) for DXVK
  - A Z (https://github.com/ahmad1abbadi) for some ideas from DarkOS
  - Olegos (https://github.com/olegos2) for some ideas and for the basis
