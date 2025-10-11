#!/bin/bash

picom --daemon --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/bin/wired &
eval $(gnome-keyring-daemon --start)
nm-applet &
xset r rate 400 40

# Monitor Configuration
MONITOR_4K="DP-0"
MONITOR_1080="HDMI-1"
xrandr --output $MONITOR_1080 --below $MONITOR_4K
xrandr --output $MONITOR_1080 --pos 960x2160
