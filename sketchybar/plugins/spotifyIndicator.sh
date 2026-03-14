#!/usr/bin/env sh

CACHE_DIR="$TMPDIR/sketchybar_spotify"
FRAME_FILE="$CACHE_DIR/frame"
mkdir -p "$CACHE_DIR"

FRAMES='▁▄█ ▂▆▄ ▄█▂ ▆▄▁ █▂▄ ▄▁▆ ▂▄█ ▁▆▃'

RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
[ "$RUNNING" == "" ] && RUNNING=1

PLAYING=1
if [ "$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')" == "playing" ]; then
  PLAYING=0
  TRACK=$(osascript -e 'tell application "Spotify" to get name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to get artist of current track')
fi

if [ $RUNNING -eq 0 ] && [ $PLAYING -eq 0 ]; then
  FRAME=$(cat "$FRAME_FILE" 2>/dev/null || echo 0)
  ICON=$(echo $FRAMES | tr ' ' '\n' | sed -n "$((FRAME + 1))p")
  NEXT=$(( (FRAME + 1) % 8 ))
  echo $NEXT > "$FRAME_FILE"

  LABEL="$TRACK - $ARTIST"
  [ ${#LABEL} -gt 25 ] && LABEL="$(echo "$LABEL" | cut -c1-25)…"

  sketchybar --set $NAME icon="$ICON" icon.drawing=on label="$LABEL" --set '/spot.*/' drawing=on
else
  sketchybar --set '/spot.*/' drawing=off
fi
