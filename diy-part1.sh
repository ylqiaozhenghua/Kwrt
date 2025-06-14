#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Modify flash size
sed -i 's/0x7280000/0x1cc00000/g' devices/mediatek_filogic/diy/target/linux/mediatek/dts/mt7986a-netcore-n60-pro.dts
sed -i 's/112640k/471040k/g' devices/mediatek_filogic/patches/22-netcore-n60-pro.patch
