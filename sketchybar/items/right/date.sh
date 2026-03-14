#!/usr/bin/env sh

sketchybar --add item date right \
           --set date update_freq=1000 \
                      icon.drawing=off \
                      script="$PLUGIN_DIR/date.sh" \
                      background.color=0xff3C3E4F \
                      background.padding_left=0 \
                      label.padding_left=4 \
                      label.padding_right=4

sketchybar --add item clock_logo right \
           --set clock_logo icon="󰃭" \
                            icon.color=0xff121219 \
                            label.drawing=off \
                            background.color=0xff92B3F5 \
                            background.padding_left=10 \
                            icon.padding_left=6 \
                            icon.padding_right=6
