# This minimal Qtile config file should work out of the box, the only thing
# fancy is the Mononoki font (if it isn't installed sans will be used in its
# place). I kept all default shortcuts as they are, just added new stuff.
# Do NOT fuck it up too much with piles of bloated rubbish, KISS!


import os
import subprocess
from pathlib import Path

from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

mod = "mod4"
color_black = '282A36'         # #282A36
color_white = 'BFBFBF'         # #BFBFBF
color_graywhite = '999999'     # #999999
color_superwhite = 'F8F8F8'    # #F8F8F8
color_gray = '4B5056'          # #4B5056
color_blue = '6272A4'          # #6272A4
color_cyan = '8be9fd'          # #8be9fd
color_green = '50fa7b'         # #50fa7b
color_orange = 'ffb86c'        # #ffb86c
color_pink = 'ff79c6'          # #ff79c6
color_purple = 'bd93f9'        # #bd93f9
color_red = 'ff5555'           # #ff5555
color_lightred = 'ff7777'      # #ff7777
color_yellow = 'f1fa8c'        # #f1fa8c
color_lightyellow = 'f1fa8c'   # #f4f99d

# Spacegray palette
# color_black = '111314'     # black    (color0)
# color_white = 'B7BBB7'     # white    (color7)
# color_gray = '4B5056'      # black    (color8)

# Tango palette
# color_black = '2e3436'     # black    (color0)
# color_white = 'd3d7cf'     # white    (color7)
# color_gray = '555753'      # black    (color8)
# color_yellow = 'c4a000'    # yellow   (color3)
# color_blue = '3465a4'      # blue     (color12)
# color_green = '4e9a06'     # green    (color10)
# color_focus = '215578'
# color_normal = '2e3436'

keys = [
    # Restart and shutdown Qtile
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    # Switch focus, chanage layout, kill window
    Key([mod], "space", lazy.layout.next()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),

    # Flip master/stack, toggle floating and move between groups
    Key([mod, "control"], "space", lazy.layout.flip()),
    Key([mod, "control"], "Return", lazy.window.toggle_floating()),
    Key([mod], "h", lazy.screen.prev_group()),
    Key([mod], "l", lazy.screen.next_group()),

    # Move windows up or down in current stack
    Key([mod], "j", lazy.layout.shuffle_down()),
    Key([mod], "k", lazy.layout.shuffle_up()),

    # Change windows ratios manually
    Key([mod, "control"], "j", lazy.layout.shrink()),
    Key([mod, "control"], "k", lazy.layout.grow()),

    # Reset windows ratios
    Key([mod, "control"], "h", lazy.layout.normalize()),
    Key([mod, "control"], "l", lazy.layout.maximize()),

    # Shortcuts for Qtile-cmd, Alacritty, Rofi-menu, Settings, ...
    Key(["control"], "Return", lazy.spawncmd(prompt='%')),
    Key([mod, "control"], "Escape", lazy.spawn("betterlockscreen -l dim")),
    Key([mod], "Escape", lazy.spawn("rofi-run -l")),
    Key([mod], "Return", lazy.spawn("rofi-run -r")),
    Key([mod], "q", lazy.spawn("xkill")),
    Key([mod], "i", lazy.spawn("kitty")),
    Key([mod], "a", lazy.spawn("alacritty")),
    Key([mod], "t", lazy.spawn("termite")),
    Key([mod], "x", lazy.spawn("xterm")),
    Key([mod, "control"], "y", lazy.spawn("kitty -e tmux")),
    Key([mod, "control"], "a", lazy.spawn("alacritty -e tmux")),
    Key([mod, "control"], "t", lazy.spawn("termite -e tmux")),
    Key([mod, "control"], "x", lazy.spawn("xterm -e tmux")),
    Key([mod], "m", lazy.spawn("xterm -e mocp")),
    Key([mod], "s", lazy.spawn("xfce4-settings-manager")),


    # Chanage the bloody volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),
]

group_names = [
        ("₁ ", 1),
        ("₂ ", 2),
        ("₃ ", 3),
        ("₄ ", 4),
        ("₅ ", 5),
        ("₆ ", 6),
        ("₇ ", 7),
        ("₈ ", 8),
        ("₉ ", 9)
]
groups = [Group(name, position=pos) for name, pos in group_names]
for i, (name, pos) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "control"], str(i), lazy.window.togroup(name)))

# groups = [Group(i, position=int(i)) for i in "123456789"]
# for i in groups:
#     # prev_position = 9 if i.position == 1 else i.position-1
#     # next_position = 1 if i.position == 9 else i.position+1
#     keys.extend([
#         # mod1 + letter of group = switch to group
#         Key([mod], i.name, lazy.group[i.name].toscreen()),

#         # switch & move focused window to prev/next group (doesn't work)
#         # Key([mod, "control"], "h",
#         #     lazy.window.togroup(str(prev_position), switch_group=True)),
#         # Key([mod, "control"], "l",
#         #     lazy.window.togroup(str(next_position), switch_group=True)),

#         # mod1 + shift + letter of group = switch & move focused window
#         Key([mod, "control"], i.name,
#             lazy.window.togroup(i.name, switch_group=True)),
#         # Or, use below if you prefer not to switch to that group.
#         # # mod1 + shift + letter of group = move focused window to group
#         # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
#     ])

layout_theme = dict(
    border_width=2,
    margin=20,
    border_focus=color_white,
    border_normal=color_gray
)

layouts = [
    layout.MonadTall(name='Tall', **layout_theme),
    layout.MonadWide(name='Wide', **layout_theme),
    layout.Max(name='Maxi'),

    # layout.MonadTall(name='ﱽ', **layout_theme),
    # layout.MonadWide(name='ﱹ', **layout_theme),
    # layout.Max(name='ﱻ'),

    # layout.MonadTall(name='者', **layout_theme),
    # layout.MonadWide(name='署', **layout_theme),
    # layout.Max(name='謹'),

    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Floating(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Stack(num_stacks=2),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='mononoki nerd font',
    fontsize=14,
    padding=6,
    background=color_black,
    foreground=color_white
)
extension_defaults = widget_defaults.copy()


# Custom callbacks
def toggle_calcurse(qtile):
    home = str(Path.home())
    if os.path.exists(home+'/.local/share/calcurse/.calcurse.pid'):
        os.system('killall calcurse')
        # os.remove(home+"/.local/share/calcurse/.calcurse.pid")
    else:
        qtile.cmd_spawn('xterm -e calcurse')


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    font='mononoki nerd font Bold',
                    highlight_method='text',
                    borderwidth=0,
                    active=color_gray,
                    inactive=color_gray,
                    hide_unused=True,
                    this_current_screen_border=color_white,
                    this_screen_border=color_blue,
                    other_current_screen_border=color_white,
                    other_screen_border=color_blue,
                    disable_drag=True
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                ),
                widget.WindowName(
                    font='mononoki nerd font Bold',
                    fmt='{:.60}',
                    for_current_screen=True,
                    show_state=False,
                    mouse_callbacks={
                        'Button1':
                        lambda qtile: qtile.cmd_spawn('rofi-run -w')
                    }
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Prompt(
                    font='mononoki nerd font Bold',
                    background=color_black,
                    foreground=color_white,
                    cursor=True,
                    prompt='{prompt} ',
                    cursor_color=color_white,
                    cursorblink=0.5
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_blue,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.TextBox(
                    text='',
                    background=color_blue,
                    foreground=color_white,
                    mouse_callbacks={
                        'Button1':
                        lambda qtile: qtile.cmd_spawn('rofi-run -r'),
                        'Button3':
                        lambda qtile: qtile.cmd_spawn('rofi-run -l')
                    },
                    padding=10
                ),
                widget.TextBox(
                    background=color_blue,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=3
                ),
                widget.KeyboardLayout(
                    font='mononoki nerd font Bold',
                    background=color_blue,
                    foreground=color_white,
                    configured_keyboards=['it', 'us'],
                    display_map={'it': 'Ita', 'us': 'Usa'}
                ),
                widget.TextBox(
                    background=color_blue,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Systray(
                    background=color_white,
                    foreground=color_black,
                    icon_size=14
                ),
                widget.Spacer(
                    background=color_white,
                    length=6
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_lightred,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_lightred,
                    length=6
                ),
                widget.CurrentLayout(
                    font='mononoki nerd font Bold',
                    background=color_lightred,
                    foreground=color_black
                ),
                widget.TextBox(
                    background=color_lightred,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Clock(
                    font='mononoki nerd font Bold',
                    background=color_lightred,
                    foreground=color_black,
                    padding=8,
                    format=' %H:%M',
                    mouse_callbacks={'Button1': toggle_calcurse}
                ),
            ],
            20
        )
    ),
    Screen()
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus=color_white,
    border_normal=color_gray,
    border_width=2,
    float_rules=[
        # Run utility of `xprop` to see the wm class and name of an X client.
        {'wmclass': 'confirm'},
        {'wmclass': 'dialog'},
        {'wmclass': 'download'},
        {'wmclass': 'error'},
        {'wmclass': 'file_progress'},
        {'wmclass': 'notification'},
        {'wmclass': 'splash'},
        {'wmclass': 'toolbar'},
        {'wmclass': 'confirmreset'},  # gitk
        {'wmclass': 'makebranch'},    # gitk
        {'wmclass': 'maketag'},       # gitk
        {'wname': 'branchdialog'},    # gitk
        {'wname': 'pinentry'},        # GPG key password entry
        {'wmclass': 'ssh-askpass'},   # ssh-askpass
    ])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.


wmname = "LG3D"
