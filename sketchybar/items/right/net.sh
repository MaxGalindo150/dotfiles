#!/usr/bin/env sh

sketchybar --add item net right \
           --set net script="$HOME/.config/sketchybar/plugins/net.sh" \
                     icon.drawing=off \
                     background.color=0xff3C3E4F \
                     background.padding_left=0 \
                     label.padding_left=4 \
                     label.padding_right=4 \
                     update_freq=2

sketchybar --add item net_logo right \
           --set net_logo icon="󰤨" \
                     icon.color=0xff121219 \
                     label.drawing=off \
                     background.color=0xffE0A3AD \
                     background.padding_left=10 \
                     icon.padding_left=6 \
                     icon.padding_right=6
