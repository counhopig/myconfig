#!/bin/bash

#
# --add item wifi.select popup.wifi     \
# --set wifi.select "${wifi_select[@]}" \
# --subscribe wifi mouse.entered 	     \
 # 								mouse.exited 			   \
 # 								mouse.exited.global  \
 # 								mouse.clicked

wifi=(
  update_freq=10
	script="$PLUGIN_DIR/wifi.sh"
	popup.align=right
	popup.height=20
	popup.background.color=0x99000000
	popup.background.border_color=0xff9dd274
)

wifi_select=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
	icon.font="SF Pro:Bold:14.0"
	icon.background.height=2
	icon.background.y_offset=-12
)

sketchybar --add item wifi right   \
           --set wifi "${wifi[@]}" \
