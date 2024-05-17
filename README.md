# Downloads

## Mobox
  - First you have to install Mobox (https://github.com/olegos2/mobox)
  - Copy this command and run it in Termux:
```
wget https://raw.githubusercontent.com/GabiAle97/mobox-updater/master/update-mobox && chmod +x update-mobox && . ~/update-mobox
```

## Horizon-Emu
  - First install all as default, and create a container (if you don't have one already)
  - Go to SETTINGS->TERMINAL, paste and run this command:
```
curl -OL https://raw.githubusercontent.com/GabiAle97/mobox-updater/master/mf-horizon && chmod +x mf-horizon && ./mf-horizon
```
  - Once it finshes, run the container desired, go to "D:/mediafoundation" and launch "install.bat".
  - FOR RE2, RUN THE CONTAINER WITH **DXVK 1.10.3 ASYNC**

# Mobox Updater
Script to update:
- libs (xcb, xproto)
- mango-hud (now it's usable and always active, so disable dxvkhud on mobox config)
- Environment Variables (new ones from box64)
  - BOX64_IGNOREINT3=0
  - BOX64_FUTEX_WAITV=1
  - BOX64_DYNAREC_DIV0=0
  - BOX64_CEFDISABLEGPUCOMPOSITOR=1
  - BOX64_CEFDISABLEGPU=1
  - BOX64_MALLOC_HACK=0
  - BOX64_RESERVE_HIGH=0
  - BOX64_SSE_FLUSHTO0=0
  - BOX64_SYNC_ROUNDING=0
  - BOX64_DYNAREC_WAIT=1
  - BOX64_X87_NO80BITS=0
- vkd3d to 2.12
- turnip to 24.2.0 (turnip v6.5 is installing this version now)
- dxvk to 2.3.1 (dxvk-dev is installing this version now)
- box64 to 20/MAY/24 build
- Wine 9.8 (Replaces Wine 9.3 installed by default)

# FUNCTIONALITY TEST

## Device
  - Motorola Edge 30 Fusion
  - root
  - 12GB RAM
  - SD 888+
  - Android 13 (NO CUSTOM ROM TESTED)
  - Mobox with custom wine 9.6
## Gameplay
  - Resident Evil Village:
  https://youtu.be/ZzCHjD8ZwOY?si=ztS1TATPL0RNKXRo
  
## Thanks to:
  - Ilya (https://github.com/Ilya114) for Box64 build
  - Airidosas (https://github.com/airidosas252) for Turnip and Wine 9.6
  - HansKristian (https://github.com/HansKristian-Work) for VKD3D
  - Doitsujin (https://github.com/doitsujin) for DXVK
  - A Z (https://github.com/ahmad1abbadi) for some ideas from DarkOS
  - Olegos (https://github.com/olegos2) for some ideas and for the basis