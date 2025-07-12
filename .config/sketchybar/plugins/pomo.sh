#!/bin/bash

TIME=$($HOME/.scripts/pomo)


if [ "$TIME" = "" ]; then
	sketchybar --set $NAME drawing=off label="$TIME" 
else
	sketchybar --set $NAME drawing=on label="$TIME" 
fi
