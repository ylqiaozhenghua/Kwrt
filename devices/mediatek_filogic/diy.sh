#!/bin/bash

shopt -s extglob
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

#bash $SHELL_FOLDER/../common/kernel_6.6.sh

sed -i '/bootargs-.* = ".*root=\/dev\/fit0 rootwait";/d' target/linux/mediatek/dts/*

find target/linux/mediatek/filogic/base-files/ -type f -exec sed -i "s/-stock//g" {} \;
find target/linux/mediatek/base-files/ -type f -exec sed -i "s/-stock//g" {} \;

sed -i "s/-stock//g" package/boot/uboot-envtools/files/mediatek_filogic

sed -i "s/openwrt-mediatek-filogic/kwrt-mediatek-filogic/g" target/linux/mediatek/image/filogic.mk
sed -i "s/ fitblk / /g" target/linux/mediatek/image/filogic.mk

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify flash size
sed -i 's/0x7280000/0x1cc00000/g' devices/mediatek_filogic/diy/target/linux/mediatek/dts/mt7986a-netcore-n60-pro.dts
sed -i 's/112640k/471040k/g' devices/mediatek_filogic/patches/22-netcore-n60-pro.patch

