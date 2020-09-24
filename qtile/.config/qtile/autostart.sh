#! /usr/bin/env bash

# -> This file launches some programs at startup, it is ment to be called at the
#    end of config.py (Qtile config file).
# -> For Arch install use picom, for Ubuntu use compton (comment th unused).
# -> Some Ubuntu distros use blueberry-tray, otherwise launch blueman-applet
#    (uncomment the right one).
# -> Remember to install xfce4-volumed too.
# -> Make sure you have the right path for xfce4-notifyd.

# picom -c &
compton -c &
~/.fehbg &
volumeicon &
mocicon &
nm-applet &
# blueman-applet &
blueberry-tray &
xfce4-power-manager &
# /usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/x86_64-linux-gnu/xfce4/notifyd/xfce4-notifyd &
kupfer --no-splash
