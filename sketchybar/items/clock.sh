#!/bin/bash

sketchybar --add item clock right \
	--set clock label.font="Maple Mono NF CN:Bold:16.0" \
	--set clock update_freq=10 script="$PLUGIN_DIR/clock.sh"
