#! /usr/bin/env bash

# This is just the xinitrc file to use as argument for startx if you don't have
# a login manager. It only launches Qtile becouse all the startup programs are
# taken care in autorun.sh. Anyway, you need to have
#    xorg-xrdb   to load Xresources
#    xfsettingsd to launch xsettings demon

xrdb -load ~/.Xresources &
xfsettingsd &
exec qtile
