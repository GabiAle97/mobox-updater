#!/bin/sh

apt update -y
apt install glibc-repo -y
apt install mangohud-glibc -y 
apt install libxcb* -y
apt install xorgproto* -y

mkdir backups

cp $PREFIX/etc/termux-login.sh ~/backups

echo "export MANGOHUD=1" >> $PREFIX/etc/termux-login.sh
echo "export MANGOHUD_CONFIG=engine_version,ram,vulkan_driver" >> $PREFIX/etc/termux-login.sh
echo "su -c setenforce 0 &>/dev/null" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_IGNOREINT3=0" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_FUTEX_WAITV=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_DYNAREC_DIV0=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_CEFDISABLEGPUCOMPOSITOR=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_CEFDISABLEGPU=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_MALLOC_HACK=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_RESERVE_HIGH=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_SSE_FLUSHTO0=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_SYNC_ROUNDING=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_DYNAREC_WAIT=1" >> $PREFIX/etc/termux-login.sh
echo "export BOX64_X87_NO80BITS=1" >> $PREFIX/etc/termux-login.sh

wget https://github.com/HansKristian-Work/vkd3d-proton/releases/download/v2.12/vkd3d-proton-2.12.tar.zst -O vkd3d.tar.zst
tar xf vkd3d.tar.zst
cd vkd3d-proton-2.12/
mv x64 system32
mv x86 syswow64
7z a vkd3d.7z sys*
cp $PREFIX/glibc/opt/libs/d3d/vkd3d.7z ~/backups
cp vkd3d.7z $PREFIX/glibc/opt/libs/d3d/vkd3d.7z

wget https://github.com/GabiAle97/mobox-updater/releases/download/mesa/mesa-24.1.0-180424-airidosas.7z -O turnip-v6.5.7z
cp $PREFIX/glibc/opt/libs/mesa/turnip-v6.5.7z ~/backups
cp turnip-v6.5.7z $PREFIX/glibc/opt/libs/mesa/turnip-v6.5.7z

wget https://github.com/doitsujin/dxvk/releases/download/v2.3.1/dxvk-2.3.1.tar.gz -O dxvk-dev.tar.gz
tar xf dxvk-dev.tar.gz
cd dxvk-2.3.1
mv x64 system32
mv x86 syswow64
7z a dxvk-dev.7z sys*
cp $PREFIX/glibc/opt/libs/d3d/dxvk-dev.7z ~/backups
cp dxvk-dev.7z $PREFIX/glibc/opt/libs/d3d/dxvk-dev.7z

wget https://github.com/GabiAle97/mobox-updater/releases/download/mesa/box64-180424 -O box64
cp $PREFIX/glibc/bin/box64 ~/backups
cp box64 $PREFIX/glibc/bin/box64

wget https://github.com/Ilya114/Box64Droid/releases/download/alpha/wine-9.6-amd64-wow64.tar.xz -O wine.tar.xz
mkdir wine
tar xf wine.tar.xz -C wine
mv wine/* wine/wine-9.3-vanilla-wow64
mv $PREFIX/glibc/wine-9.3-vanilla-wow64 ~/backups/
mv wine/wine-9.3-vanilla-wow64 $PREFIX/glibc/

cd
rm -rf vkd3d.tar.zst vkd3d-proton-2.12

function undo_updater_changes(){
        cd ~/backups
        cp ~/backups/termux-login.sh $PREFIX/etc/termux-login.sh
        cp ~/backups/vkd3d.7z $PREFIX/glibc/opt/libs/d3d/vkd3d.7z
        cp ~/backups/turnip-v6.5.7z $PREFIX/glibc/opt/libs/mesa/turnip-v6.5.7z
        cp ~/backups/dxvk-dev.7z $PREFIX/glibc/opt/libs/d3d/dxvk-dev.7z
        cp ~/backups/box64 $PREFIX/glibc/bin/box64
}

if [ ! -f storage/downloads/already-seen ]; then
        clear
        echo -e "Hola! Soy EmuTesting, o GabiAle97, como prefieras \xF0\x9F\x98\x80"
        sleep 4
        echo "Soy el creador de este script..."
        sleep 4
        echo "Esto es sumamente EXPERIMENTAL, y si algo sale mal..."
        sleep 4
        echo -e "Es posible que tengas que eliminar todos los datos de termux \xF0\x9F\x98\xA2"
        sleep 4
        echo "..."
        sleep 2
        echo "..."
        sleep 2
        echo -e "\U1F923 Debiste ver tu cara! \U1F923"
        sleep 4
        echo "Si es experimental, por supuesto"
        sleep 4
        echo -e "Peeeero hice un backup con los archivos originales para que puedas restaurarlos \xF0\x9F\x98\x80"
        sleep 4
        echo -e "Corriendo \e[1mundo_updater_changes\e[0m debería volver todo a la normalidad"
        sleep 4
        echo -e "De todos modos, puedes avisarme en \e]8;;https://github.com/GabiAle97/mobox-updater/issues\aesta página\e]8;;\a para que pueda tomar acciones \xF0\x9F\x98\x80"
        sleep 4
        echo -e "Ahora deberías salir de termux con \e[1mexit\e[0m y volver a entrar para que las variables se carguen" 
        sleep 4
        echo -e "Me despido! Pero antes, te propongo un trato..." 
        sleep 4
        echo -e "Si este script hace que tus juegos funcionen mejor, ve a \e]8;;https://youtube.com/@EmuTesting?si=-PW83qSOo2b_VFZH\ami canal de YouTube\e]8;;\a y hazmelo saber suscribiendote \U1F911"
        sleep 4
        echo -e "De hecho, tengo un video jugando a Resident Evil Village usando este script, claro. Si quieres verlo, está acá"
        sleep 4
        echo -e "Eso es todo! Adios! \U1FAE1"
        touch storage/downloads/already-seen
        sleep 4
        echo -e "Este mensaje se autodestruirá! CORRE! \U1F4A3"
fi

