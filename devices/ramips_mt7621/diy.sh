#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))


sed -i "s/DEVICE_MODEL := HC5962$/DEVICE_MODEL := HC5962 \/ B70/" target/linux/ramips/image/mt7621.mk


sed -i '/# start dockerd/,/# end dockerd/d' .config

sed -i "s/--max-leb-cnt=96/--max-leb-cnt=128/g" target/linux/ramips/image/mt7621.mk

sed -i "s/0xfb0000/0x1fb0000/g" target/linux/ramips/dst/mt7621_thunder_timecloud.mk

sed -i "s/16064k/32448k/g" target/linux/ramips/image/mt7621.mk
