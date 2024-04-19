#!/bin/bash

battery=(
	label.font="Maple Mono NF CN:Reguler:14"
	label.padding_left=0
	label.padding_right=0
	icon.padding_left=0
	icon.padding_right=5
	update_freq=120
	script="$PLUGIN_DIR/battery.sh"
)

sketchybar --add item battery right \
	--set battery "${battery[@]}" \
	--subscribe battery system_woke power_source_change
