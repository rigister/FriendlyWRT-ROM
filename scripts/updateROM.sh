#!/bin/sh
cd /tmp/upload/
unzip /tmp/upload/Friendly*.zip
if [ -f /tmp/upload/Friendly*.img.gz ]; then
    echo -e '\e[92m开始刷机，请稍候...\e[0m'	
    pv /tmp/upload/*.img.gz | gunzip -dc > /dev/mmcblk0
    echo 1 > /proc/sys/kernel/sysrq
    echo -e '\e[92m刷机完毕，正在重启...\e[0m'	
    echo b > /proc/sysrq-trigger
else
    echo -e '\e[91m没有找到ROM，已退出\e[0m'
	exit 1
fi
