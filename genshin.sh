#!/usr/bin/bash

MYDIR=$(pwd)
DEVNAME=$(getprop ro.product.marketname)
BRAND=$(getprop ro.product.manufacturer)
MODEL=$(getprop ro.product.model)
DIR=/storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files
MODMODEL=$(find $MYDIR/files/hardware_model_config.json)
MODDATA=$(find $MYDIR/files/GenshinImpact_data/hardware_model_config.json)

def="\033[00m"
r="\033[31m"
g="\033[32m"
y="\033[33m"
b="\033[34m"
yb="\033[35m"
p="\033[36m"
w="\033[37m"
bld="\e[1m"
nml="\e[0m"

fpsstatus() {
    echo ""
    echo -e $y$bld" # FPS Throttling (Android 12+)"$def
    echo ""
    echo -e "  - value:$y 30$def,$y 45$def,$y 60$def,$y 90$def,$y 120$def"
    echo -e $y"    status$def for downscale & fps status"
    echo -e $y"  0.$def for exit"
    echo ""
    echo $def" status :\n$g $(device_config get game_overlay com.miHoYo.GenshinImpact)"$def
    echo ""
    sleep 4
    clear
    fpsthrottling
}

status=$(device_config get game_overlay com.miHoYo.GenshinImpact | sed -n 's/.*downscaleFactor=\(.*\),.*/\1/p' | cut -d ':' -f 1)

fpsthrottling() {
    echo ""
    echo -e $y$bld" # FPS Throttling (Android 12+)"$def
    echo ""
    echo -e "  - value:$y 30$def,$y 45$def,$y 60$def,$y 90$def,$y 120$def"
    echo -e $y"    status$def for downscale & fps status"
    echo -e $y"  0.$def for exit"
    echo ""
    echo -e -n " option :$y "; read fps
    if [ $fps == "30" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,fps=30,downscaleFactor=$status:mode=3,fps=30,downscaleFactor=$status
    sleep 2
    echo ""
    echo -e $g" success!"$def
    echo ""
    sleep 2
    elif [ $fps == "45" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,fps=45,downscaleFactor=$status:mode=3,fps=45,downscaleFactor=$status
    sleep 2
    echo ""
    echo -e $g" success!"$def
    echo ""
    sleep 2
    elif [ $fps == "60" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,fps=60,downscaleFactor=$status:mode=3,fps=60,downscaleFactor=$status
    sleep 2
    echo ""
    echo -e $g" success!"$def
    echo ""
    sleep 2
    elif [ $fps == "90" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,fps=90,downscaleFactor=$status:mode=3,fps=90,downscaleFactor=$status
    sleep 2
    echo ""
    echo -e $g" success!"$def
    echo ""
    sleep 2
    elif [ $fps == "120" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,fps=120,downscaleFactor=$status:mode=3,fps=120,downscaleFactor=$status
    sleep 2
    echo ""
    echo -e $g" success!"$def
    echo ""
    sleep 2
    elif [ $fps == "status" ];then
    clear
    fpsstatus
    elif [ $fps == "0" ];then
    clear
    downscale
    else
    echo ""
    echo -e $r" wrong option!"$def
    echo ""
    sleep 1
    fi
    clear
    fpsthrottling
}

downscalestatus() {
    echo ""
    echo -e $y$bld" Downscale Resolution (Android 12+)"$def
    echo ""
    echo -e "  - Downscale value:$y 0.5 - 0.9"$def
    echo "    0.5 = 50% of 100% default resolution"
    echo -e $y"    disable$def for$r disable Downscale"$def
    echo -e $y"    fps$def for$b FPS Throttling$def configuration"
    echo -e $y"    status$def for downscale status"
    echo -e $y"  1.$def Android 12 bellow (optional)"
    echo -e $y"  0.$def exit"
    echo ""
    echo $def" status :\n$g $(device_config get game_overlay com.miHoYo.GenshinImpact)"$def
    echo ""
    sleep 4
    clear
    downscale
}

downscale() {
    echo ""
    echo -e $y$bld" Downscale Resolution (Android 12+)"$def
    echo ""
    echo -e "  - Downscale value:$y 0.5 - 0.9"$def
    echo "    0.5 = 50% of 100% default resolution"
    echo -e $y"    disable$def for$r disable Downscale"$def
    echo -e $y"    fps$def for$b FPS Throttling$def configuration"
    echo -e $y"    status$def for downscale status"
    echo -e $y"  1.$def Android 12 bellow (optional)"
    echo -e $y"  0.$def exit"
    echo ""
    dsc
}

dsc() {
    echo -e -n " option :$y "; read hw
    if [ $hw == "1" ];then
    clear
    downscale11
    elif [ $hw == "0" ];then 
    clear
    menu
    elif [ $hw == "disable" ];then
    device_config delete game_overlay com.miHoYo.GenshinImpact
    echo ""
    sleep 1
    echo -e $g" success!"$def
    sleep 2
    elif [ $hw == "status" ];then
    clear
    downscalestatus
    elif [ $hw == "0.5" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,downscaleFactor=0.5:mode=3,downscaleFactor=0.5
    echo ""
    sleep 1
    echo -e $g" success!"
    sleep 2
    elif [ $hw == "0.6" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,downscaleFactor=0.6:mode=3,downscaleFactor=0.6
    echo ""
    sleep 1
    echo -e $g" success!"
    sleep 2
    elif [ $hw == "0.7" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,downscaleFactor=0.7:mode=3,downscaleFactor=0.7
    echo ""
    sleep 1
    echo -e $g" success!"
    sleep 2
    elif [ $hw == "0.8" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,downscaleFactor=0.8:mode=3,downscaleFactor=0.8
    echo ""
    sleep 1
    echo -e $g" success!"
    sleep 2
    elif [ $hw == "0.9" ];then
    device_config put game_overlay com.miHoYo.GenshinImpact mode=2,downscaleFactor=0.9:mode=3,downscaleFactor=0.9
    echo ""
    sleep 1
    echo -e $g" success!"
    sleep 2
    elif [ $hw == "fps" ];then
    clear
    fpsthrottling
    else
    echo ""
    echo -e $r" wrong option!"$def
    echo ""
    sleep 1
    fi
    clear
    downscale
}

config() {
    echo ""
    echo -e $y$bld" # Config"$def
    echo ""
    echo -e $y"  1.$def Install"
    echo -e $y"  2.$def Uninstall"
    echo -e $y"  0.$def Exit"
    echo ""
    echo -e -n " option : $y"; read cfg
    if [ $cfg == "1" ];then
    clear
    install
    elif [ $cfg == "2" ];then
    clear
    uninstall
    elif [ $cfg == "0" ];then
    clear
    menu
    else
    echo -e $r" wrong option!"
    fi
}

install() {
    echo ""
    echo -e $bld" Genshin Impact config$y installing:"$def
    echo ""
    sleep 1
    echo " - enable config for this device.. "
    sleep 2
    echo ""
    echo "   config1:"
    if [ -z $MODMODEL ];then
    echo -e $r"   error, config files not found!"$def
    sleep 2
    else
    sed -i "s/\"hardwareModel\": \".*\"/\"hardwareModel\": \"$BRAND $MODEL\"/g" $MODMODEL
    sleep 1
    echo -e $g"   success!"$def
    sleep 2
    fi
    echo ""
    echo "   config2:"
    if [ -z $MODDATA ];then
    echo -e $r"   error, config file not found!"
    sleep 2
    else
    sed -i "s/\"hardwareModel\": \".*\"/\"hardwareModel\": \"$BRAND $MODEL\"/g" $MODDATA
    sleep 1
    echo -e $g"   success!"$def
    sleep 2
    fi
    echo ""
    echo " - patching files.."
    sleep 2
    cp -r $MYDIR/files/* $DIR
    echo ""
    echo -e $g"   success!"$def
    sleep 1
    echo ""
    echo "   All config script installed!"
    echo "   back to main menu in$r 3s.."$def
    sleep 3
    menu
}

uninstall() {
    echo ""
    echo -e $r$bld " Genshin Impact config uninstalling:"$def
    echo ""
    for CFG in $DIR; do
        for CFGS in CFG; do
        rm $CFGS/Config.ini
        rm $CFGS/GameOptions_saved.json
        rm $CFGS/graphics_settings.json
        rm $CFGS/hardware_model_config.json
        rm $CFGS/shader.cache
        done
        for SCR in $CFG/Assets/Script; do
        rm -r $SCR
        done
        for GID in $CFG/GenshinImpact_data; do
        rm $GID/boot.config
        rm $GID/GenshinImpactConfig.local
        rm $GID/hardware_model_config.json
        rm -r $GID/VideoSettings
        done
        for OSREL in $CFG/OSRELAndroid5.3.0_R30064194_S30048415_D30106004; do
        rm -r $OSREL
        done
        for E2 in $CFG/UnityShaderBin/e2; do
        rm $E2/e2b1ed6e3f7c63b2bde0d49e2f5d8139
        rm $E2/e2b388b73e243d53a3a376a09fce1ade
        rm $E2/e2ca2e23176ccb4322a8a43ea52810d4
        rm $E2/e2e6ed27ad51357da2ca2b40178cf031
        rm $E2/e2ee6010fb5d6a3eaf8e6dd67154c490
        rm $E2/e2f9a93da0bae48c27d6463050b22490
        rm $E2/e2fdf9bb96d60f4b9879888b5fc58a2f
        rm $E2/e20c3a51336f019cf56401bca8ab55bc
        rm $E2/e23eb3620f2f59428806bcab888d29da
        rm $E2/e25ad821a6fdbe2993d8e67ec34a9309
        rm $E2/e26fff5ed7a4554dda6a10f5ea5cacf6
        rm $E2/e27d7e1a901b69fd37e33d35e3226e4d
        rm $E2/e28a5e19c4a0ccada6fccff5c7185238
        rm $E2/e28ba5d2d81d69897c7c957b0ea2c7f4
        rm $E2/e262a940002d7f5acaa2d1846f853d8a
        rm $E2/e270aaff377228cdfa5943df8aa43685
        rm $E2/e299c2f726a93f095dcfcd763140ec06
        rm $E2/e2392a19cde1f8ba270201117a037990
        rm $E2/e2538b17827ecebec64510f559e7c6f3
        rm $E2/e2645782ad70f42ac7a9f2c419a27226
        rm $E2/e28424058695b1a35cb2642876f3b4e5
        rm $E2/ShaderIndex.shader
        done
        for FF in $CFG/UnityShaderBin/ff; do
        rm $FF/ff0adaa60d54a464faec9ecfbb10ab54
        rm $FF/ff0c4869d57e1fb1c84cc1e7d611756a
        rm $FF/ff3b6cf733798b7b34a5fdb4b57bcede
        rm $FF/ff5fe6bedf68bcdd668290f258cda1d0
        rm $FF/ff6d926b447665d4d572aa3a3c38cf2b
        rm $FF/ff7d8e1733a79bbdd1b05c129240956c
        rm $FF/ff8c9a938d434f487c41883bd159971a
        rm $FF/ff9c3b4be8fafc529aaee8afbdc2e16e
        rm $FF/ff9cb8b4caccc63e1b88f4a3d7af783b
        rm $FF/ff16e129a03cf34669249503b56152c5
        rm $FF/ff58ad85290de68991cfe97195cbf13e
        rm $FF/ff536f7ecf6c7a67dd7b53cc90a0c662
        rm $FF/ff671a8d00cc6b046df4e340dd9ffb69
        rm $FF/ffc3cc92303be539bbc00668a22e6a91
        rm $FF/fffb79de0055b9ae91fbec68d1d6c199
        rm $FF/ShaderIndex.bin
        rm $FF/ShaderIndex.shader
        done
    done
    clear
    echo ""
    echo -e $r"  uninstalling";sleep 1;clear;echo "";echo "";echo -e "  uninstalling.";sleep 1;clear;echo "";echo "";echo -e "  uninstalling.."$g;sleep 1;clear
    echo "";echo "";echo -e "  done!"$def;sleep 3;clear;echo ""
    clear
    menu
}

menu() {
    clear
    echo ""
    echo -e $b $bld" Genshin Impact: Script Configuration"
    echo -e $def ""
    echo -e $y"  1.$def Downscale Resolution"
    echo -e $y"  2.$def Config"
    echo -e $y"  3.$def Exit"
    echo ""
    mainmenu
}

mainmenu() {
    echo -e -n " option :$y "; read opt
    if [ $opt == "1" ];then
    clear
    downscale
    elif [ $opt == "2" ];then
    clear
    config
    elif [ $opt == "3" ];then
    echo ''
    echo -e $r" exit in 3s.." 
    echo -e $def""
    sleep 3
    clear
    exit
    else
    echo ""
    echo -e $r" wrong option!"$def
    echo ""
    sleep 1
    fi
    clear
    menu
}

menu