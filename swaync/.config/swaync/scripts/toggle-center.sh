#!/usr/bin/bash
# Toggle center and clear all if already open
if pgrep -x swaync >/dev/null; then
  swaync-client -t
  sleep 0.2
  swaync-client -c
else
  swaync-client -t
fi
