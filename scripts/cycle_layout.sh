#!/bin/bash

# Get the current layout of the focused container
current_layout=$(swaymsg -t get_tree | jq -r '.. | select(.type? == "con" and .focused? == true) | .layout // empty')

# Cycle: stacking -> tabbed -> toggle split (horizontal/vertical) -> stacking
if [ "$current_layout" = "stacked" ]; then
    swaymsg layout tabbed
elif [ "$current_layout" = "tabbed" ]; then
    swaymsg layout toggle split
else
    swaymsg layout stacking
fi