#!/usr/bin/env sh

# Get bytes in/out from netstat
INTERFACE="en0"

IN=$(netstat -ib | grep -e "$INTERFACE" | grep -e "Link" | awk '{print $7}' | head -1)
OUT=$(netstat -ib | grep -e "$INTERFACE" | grep -e "Link" | awk '{print $10}' | head -1)

PREV_IN_FILE="/tmp/sketchybar_net_in"
PREV_OUT_FILE="/tmp/sketchybar_net_out"

if [ -f "$PREV_IN_FILE" ]; then
  PREV_IN=$(cat "$PREV_IN_FILE")
  PREV_OUT=$(cat "$PREV_OUT_FILE")

  DIFF_IN=$(( (IN - PREV_IN) / 1024 ))
  DIFF_OUT=$(( (OUT - PREV_OUT) / 1024 ))

  [ "$DIFF_IN" -lt 0 ] && DIFF_IN=0
  [ "$DIFF_OUT" -lt 0 ] && DIFF_OUT=0

  LABEL="${DIFF_IN}K"
else
  LABEL="..."
fi

echo "$IN" > "$PREV_IN_FILE"
echo "$OUT" > "$PREV_OUT_FILE"

sketchybar --set $NAME label="$LABEL"
