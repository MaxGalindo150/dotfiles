#!/usr/bin/env sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

if [ -n "$PERCENTAGE" ]; then
  sketchybar --add item battery right \
             --set battery update_freq=3 \
                           icon.drawing=off \
                           script="$PLUGIN_DIR/power.sh" \
                           background.color=0xff3C3E4F \
                           background.padding_left=0 \
                           label.padding_left=4 \
                           label.padding_right=4

  sketchybar --add item power_logo right \
             --set power_logo icon= \
                   icon.color=0xff121219 \
                   label.drawing=off \
                   background.color=0xffB3E1A7 \
                   background.padding_left=10 \
                   icon.padding_left=6 \
                   icon.padding_right=6 \
                   update_freq=90
fi
