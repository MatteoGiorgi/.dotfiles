#! /usr/bin/env bash

# This is just the xinitrc file to use as argument for startx if you don't have
# a login manager. It only launches Qtile becouse all the startup programs are
# taken care in autorun.sh. Anyway, you need to have
#    xorg-xrdb   to load Xresources
#    xfsettingsd to launch xsettings demon

xrdb -load ~/.Xresources &
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap &
xfsettingsd &
exec qtile

# To be able to launch this file from a login manager (such as lightdm), create
# the file "/usr/shared/xsessions/qtile.desktop" with the following content:
#
#     [Desktop Entry]
#     Version=1.0
#     Name=Qtile Session
#     Comment=Use this session to run Qtile as your window manager
#     Exec=/home/geoteo/.xinitrc
#     Icon=
#     Type=Application
#     DesktopNames=QTILE
