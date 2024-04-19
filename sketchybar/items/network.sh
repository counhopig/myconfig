#!/bin/bash

network_down=(
	y_offset=-7
	label.font="Maple Mono NF CN:Bold:11.0"
	label.color="$TEXT"
	icon=􀄩
	icon.font="SF Pro:Bold:10.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
	script="$PLUGIN_DIR/network.sh"
)

network_up=(
	background.padding_right=-72
	y_offset=7
	label.font="Maple Mono NF CN:Bold:11.0"
	label.color="$TEXT"
	icon=􀄨
	icon.font="SF Pro:Bold:10.0"
	icon.color="$GREEN"
	icon.highlight_color="$BLUE"
	update_freq=1
)

sketchybar --add item network.down right \
	--set network.down "${network_down[@]}" \
	--add item network.up right \
	--set network.up "${network_up[@]}"
