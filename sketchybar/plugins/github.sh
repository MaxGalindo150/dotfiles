#!/usr/bin/env sh

COUNT=$(gh api notifications --paginate --jq '[.[] | select(.unread == true)] | length' 2>/dev/null)

if [ -z "$COUNT" ] || [ "$COUNT" = "0" ]; then
  LABEL="0"
else
  LABEL="$COUNT"
fi

sketchybar --set $NAME label="$LABEL"
