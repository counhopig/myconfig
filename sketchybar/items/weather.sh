#!/bin/bash

weather_temp=(
	label="temp"
	update_freq=60
	popup.align=right
	popup.height=20
	popup.background.color=0xff9dd274
	popup.background.border_color=0xff9dd274
	script="$PLUGIN_DIR/weather.sh"
)

weather_details=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
	icon.font="SF Pro:Bold:14.0"
	icon.background.height=2
	icon.background.y_offset=-12
)

sketchybar  --add item weather.temp right 								\
	          --set weather.temp "${weather_temp[@]}" 			\
						--add item weather.details popup.weather.temp \
						--set weather.details "${weather_details[@]}" \
						--subscribe weather.temp mouse.entered 				\
																		 mouse.exited 				\
																		 mouse.exited.global  \
																		 mouse.clicked
