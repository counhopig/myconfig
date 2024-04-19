#!/usr/bin/env bash

UPDOWN=$(ifstat -i "en0" 0.1 1 | tail -n1)
DOWN=$(echo "$UPDOWN" | awk "{ print \$1 }" | cut -f1 -d "." | awk '{ print $1 }') # 转换为kB/s
UP=$(echo "$UPDOWN" | awk "{ print \$2 }" | cut -f1 -d "." | awk '{ print $1 }')   # 转换为kB/s

DOWN_FORMAT=""
if [ "$DOWN" -gt "999" ]; then
	DOWN_FORMAT=$(echo "$DOWN" | awk '{ printf "%03.0f MB/s", $1 / 1000}') # 转换为MB/s，保留两位小数
else
	DOWN_FORMAT=$(echo "$DOWN" | awk '{ printf "%03.0f kB/s", $1}') # 以kB/s显示
fi

UP_FORMAT=""
if [ "$UP" -gt "999" ]; then
	UP_FORMAT=$(echo "$UP" | awk '{ printf "%03.0f MB/s", $1 / 1000}') # 转换为MB/s，保留两位小数
else
	UP_FORMAT=$(echo "$UP" | awk '{ printf "%03.0f kB/s", $1}') # 以kB/s显示
fi

sketchybar -m --set network.down label="$DOWN_FORMAT" icon.highlight=$(if [ "$DOWN" -gt "0" ]; then echo "on"; else echo "off"; fi) \
	--set network.up label="$UP_FORMAT" icon.highlight=$(if [ "$UP" -gt "0" ]; then echo "on"; else echo "off"; fi)
