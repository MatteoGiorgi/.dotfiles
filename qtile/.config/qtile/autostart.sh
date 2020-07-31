#! /usr/bin/env bash

# This file launches some programs at startup, it is ment to be called at the
# end of config.py (Qtile config file). Make shure you have the following:
#    feh                 to set and restore wallpaper
#    volumeicon          to launch volume systray icon
#    networkmanager      to launch networkmanager systray icon
#    blueman             to launch blueman systray icon
#    xfce4-power-manager to load power manager settings and launch systray icon

picom &
~/.fehbg &
volumeicon &
mocicon &
nm-applet &
blueman-applet &
xfce4-power-manager &
deadd-notification-center
