#!/usr/bin/env sh

sketchybar --add item github right \
           --set github script="$HOME/.config/sketchybar/plugins/github.sh" \
                        icon.drawing=off \
                        background.color=0xff3C3E4F \
                        background.padding_left=0 \
                        label.padding_left=4 \
                        label.padding_right=4 \
                        update_freq=60 \
                        click_script="open -na Ghostty.app --args -e 'gh dash'"

sketchybar --add item github_logo right \
           --set github_logo icon="󰊤" \
                        icon.color=0xff121219 \
                        label.drawing=off \
                        background.color=0xffB3A9F5 \
                        background.padding_left=10 \
                        icon.padding_left=6 \
                        icon.padding_right=6
