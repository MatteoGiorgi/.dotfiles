#! /usr/bin/env bash

# -> This file launches some programs at startup, it is ment to be called at the end of config.py (Qtile config file).
# -> For Arch install use picom, for others like Ubuntu use compton (comment the unused).
# -> As bluetooth applet I use blueman-applet, but some other distros like Ubuntu use blueberry-tray.
# -> Remember to install xfce4-volumed too.
# -> Make sure you have the right path for xfce4-notifyd (comment the wrong one for your system).

compton -c & # picom -c &
~/.fehbg &
volumeicon &
mocicon &
nm-applet &
blueman-applet &
xfce4-power-manager &
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd & # /usr/lib/xfce4/notifyd/xfce4-notifyd &
kupfer --no-splash
