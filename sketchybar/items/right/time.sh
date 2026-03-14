#!/usr/bin/env sh

sketchybar --add item time right \
           --set time update_freq=1 \
                      icon.drawing=off \
                      script="$HOME/.config/sketchybar/plugins/time.sh" \
                      background.color=0xff3C3E4F \
                      background.padding_left=0 \
                      label.padding_left=4 \
                      label.padding_right=4

sketchybar --add item time_logo right \
           --set time_logo icon="󰥔" \
                           label.drawing=off \
                           icon.color=0xff121219 \
                           background.color=0xffF5E3B5 \
                           background.padding_left=10 \
                           icon.padding_left=6 \
                           icon.padding_right=6
