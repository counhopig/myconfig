#!/bin/bash

WIFI_STATUS=$(networksetup -getairportpower en0 | grep -o 'On\|Off')
WIFI_CONNECTION=$(networksetup -getairportnetwork en0 | awk '{print $4}')
echo $WIFI_CONNECTION
if [ "$WIFI_STATUS" = "Off" ]; then
    SKETCHYBAR_ICON=􀙈
elif [ "$WIFI_STATUS" = "On" ]; then
    if [ "$WIFI_CONNECTION" = "associated" ]; then
        SKETCHYBAR_ICON=􀙥 
    else
        SKETCHYBAR_ICON=􀙇
    fi
fi

sketchybar --set wifi icon="$SKETCHYBAR_ICON"

# render_popup() {
#
#   weather_details=(
# 		label.padding_left=80
# 		click_script="sketchybar --set $NAME popup.drawing=off"
# 		position=popup.wifi
# 		drawing=on
# 	)
#
#   COUNTER=0
#
#   sketchybar --clone wifi.select."$COUNTER" wifi.select
#   sketchybar --set wifi.select."$COUNTER" "${weather_details[@]}"
#
#   CURRENT_WIFI=$(networksetup -getairportnetwork en0 | cut -d ":" -f2 | sed -e 's/^ //')
#
#   AVAILABLE_WIFIS=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s | awk '{if(NR>1)print $1}')
#
#   for wifi in $AVAILABLE_WIFIS;
#     do
#       if [ "$wifi" = "$CURRENT_WIFI" ]; then
#         ICON="􀣋"
#       else
#         ICON="􀙇"
#       fi
#
#       ITEM_ID="wifi.popup.$COUNTER"
#       sketchybar --add item "$ITEM_ID" popup.wifi
#       sketchybar --set "$ITEM_ID" icon="$ICON" label="$wifi"
#
#       COUNTER=$((COUNTER + 1))
#     done
# }
#
# # update() {
# #   render_popup
# # }
#
# popup() {
#   if [ "$1" = "on" ]; then
#     render_popup
#   elif [ "$1" = "off" ]; then
#     sketchybar --remove '/wifi.popup.\.*/'
#   fi
# 	sketchybar --set "$NAME" popup.drawing="$1"
# }
#
# case "$SENDER" in
# # "routine" | "forced")
# # 	update
# # 	;;
# "mouse.entered")
# 	popup on
# 	;;
# "mouse.exited" | "mouse.exited.global")
# 	popup off
# 	;;
# "mouse.clicked")
# 	popup toggle
# 	;;
# esac
#
