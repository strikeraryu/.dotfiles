#!/bin/env/bash

pomo=(
  "${bracket_defaults[@]}"
  popup.align=center
  padding_left=0
  label.padding_right=10
  label.max_chars=38
  update_freq=1
  updates=on
  script="$PLUGIN_DIR/pomo.sh"                              
)

sketchybar                                 \
  --add item pomo right                 \
  --set pomo "${pomo[@]}"            \
  --subscribe pomo system_woke



