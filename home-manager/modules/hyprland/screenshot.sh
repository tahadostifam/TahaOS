#!/usr/bin/bash
grim -c -g "$(slurp)" - | wl-copy
notify-send "Screenshot copied to clipboard" -a "ss"