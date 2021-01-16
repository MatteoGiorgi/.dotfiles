#! /usr/bin/env bash

# -> This file launches some programs at startup, it is ment to be called at the end of config.py (Qtile config file).
# -> For Arch install use `picom -c`, for others like Ubuntu use `compton -c`(I use this fork of picom: `https://github.com/jonaburg/picom`).
# -> As bluetooth applet I use `blueman-applet`, but some other distros like Ubuntu use `blueberry-tray`.
# -> Remember to install xfce4-volumed too.
# -> To use Music on Console from the systray, use `mocicon`.
# -> Make sure you have the right path for xfce4-notifyd:
#        `/usr/lib/xfce4/notifyd/xfce4-notifyd` for Arch
#        `/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd` for Ubuntu

~/.fehbg &
xfce4-volumed &
nm-applet &
blueman-applet &
xfce4-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd
