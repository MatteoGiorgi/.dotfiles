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
color_white = 'BFBFBF'
color_black = '1E1F29'  # '282A36'  # '282936'
color_gray = '3A3C4E'   # '4B5056'
color_blue = '626483'   # '6272A4'
color_cyan = '8BE9FD'
color_green = '50FA7B'
color_red = 'ff5555'
color_yellow = 'F1FA8C'
color_magenta = 'FF79C6'
color_purple = 'BD93F9'
color_undef = '626483'

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
    Key([mod, "control"], "r", lazy.restart()),   # Restart
    Key([mod, "control"], "e", lazy.shutdown()),  # Exit

    # Switch focus, chanage layout, kill window
    Key([mod], "space", lazy.layout.next()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),

    # Flip master/stack, toggle floating and move between groups
    Key([mod, "control"], "Return", lazy.window.toggle_floating()),
    Key([mod, "control"], "space", lazy.window.toggle_fullscreen()),
    Key([mod], "f", lazy.layout.flip()),
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

    # Shortcuts for Qtile-cmd, Rofi-menu, Settings, ...
    Key([mod], "Return", lazy.spawn("xterm")),               # Xterm
    Key([mod], "e", lazy.spawn("rofi-run -l")),              # Exit/Logout
    Key([mod], "w", lazy.spawn("rofi-run -w")),              # Windows
    Key([mod], "d", lazy.spawn("rofi-run -d")),              # Dmenu
    Key([mod], "s", lazy.spawn("rofi-run -s")),              # Settings
    Key([mod], "x", lazy.spawn("xkill")),                    # Xkill
    Key([mod], "i", lazy.spawn("xterm -T Ifm -e shfm")),     # Ifm
    Key([mod], "m", lazy.spawn("xterm -T Moc -e mocp")),     # Moc
    Key([mod], "p", lazy.spawncmd(prompt='%')),              # Prompt


    # Chanage the bloody volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q -D pulse sset Master 3%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q -D pulse sset Master 3%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse sset Master toggle")),

    # Alternatives? (re-check them)
    # +---------------------------------------------------------------------------+
    # | Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q sset Master 3%+")), |
    # | Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q sset Master 3%-")), |
    # | Key([], "XF86AudioMute", lazy.spawn("amixer -q sset Master toggle")),     |
    # |---------------------------------------------------------------------------|
    # | Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),              |
    # | Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5")),              |
    # | Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),                       |
    # +---------------------------------------------------------------------------+
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
        ("₉ ", 9)
]
groups = [Group(name, position=pos) for name, pos in group_names]
for i, (name, pos) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "control"], str(i), lazy.window.togroup(name)))

# Simple alternative
# +-------------------------------------------------------------------------+
# | groups = [Group(i, position=int(i)) for i in "123456789"]               |
# | for i in groups:                                                        |
# |     keys.extend([                                                       |
# |         # mod1 + letter of group = switch to group                      |
# |         Key([mod], i.name, lazy.group[i.name].toscreen()),              |
# |                                                                         |
# |         # mod1 + shift + letter of group = switch & move focused window |
# |         Key([mod, "control"], i.name,                                   |
# |             lazy.window.togroup(i.name, switch_group=True)),            |
# |     ])                                                                  |
# +-------------------------------------------------------------------------+

layout_theme = dict(
    border_width=2,
    margin=20,
    border_focus=color_white,
    border_normal=color_gray
)

layouts = [
    layout.MonadWide(name='wide', **layout_theme),
    layout.MonadTall(name='tall', **layout_theme),
    layout.Floating(name='float', **layout_theme),
    layout.Max(name='max'),

    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
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
    if os.path.exists(home+'/.local/share/calcurse/.calcurse.pid') or os.path.exists(home+'/.calcurse/.calcurse.pid'):
        os.system('killall calcurse')  # os.remove(home+"/.local/share/calcurse/.calcurse.pid")
    else:
        qtile.cmd_spawn('xterm -e calcurse')


screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox(
                    text='',
                    background=color_white,
                    foreground=color_black,
                    mouse_callbacks={
                        'Button1':
                        lambda qtile: qtile.cmd_spawn('rofi-run -r')
                    },
                    padding=10
                ),

                # widget.TextBox(
                #     background='87878a',
                #     foreground=color_white,
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='56575e',
                #     foreground='87878a',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background=color_black,
                #     foreground='56575e',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),

                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),

                widget.GroupBox(
                    font='mononoki Nerd Font Bold',
                    background=color_black,
                    highlight_method='text',
                    margin_y=3,
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
                widget.Spacer(
                    background=color_black,
                    length=6
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Prompt(
                    background=color_black,
                    foreground=color_yellow,
                    cursor=True,
                    prompt='{prompt} ',
                    cursor_color=color_yellow,
                    cursorblink=0.5
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    length=36
                ),
                widget.TaskList(
                    # font='mononoki Nerd Font Bold',
                    background=color_black,
                    foreground=color_white,
                    border=color_yellow,
                    borderwidth=0,
                    highlight_method='text',
                    rounded=False,
                    icon_size=0,
                    margin_y=2,
                    padding_y=0,
                    title_width_method='uniform',
                    txt_floating=' ',
                    txt_minimized=' ',
                    txt_maximized='  '
                ),
                widget.Spacer(
                    length=36
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Moc(
                    font='mononoki Nerd Font Bold',
                    background=color_black,
                    foreground=color_white,
                    max_chars=10,
                    play_color=color_yellow,
                    noplay_color=color_gray
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Wallpaper(
                    background=color_white,
                    foreground=color_black,
                    directory='~/Pictures/wallpapers',
                    random_selection=True,
                    wallpaper_command=['feh', '--bg-fill'],
                    label='',
                    padding=8
                ),
                widget.Spacer(
                    background=color_white,
                    length=8
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.CurrentLayout(
                    font='mononoki Nerd Font Bold',
                    background=color_white,
                    foreground=color_black,
                ),

                # widget.TextBox(
                #     background=color_white,
                #     foreground='9e9faa',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='9e9faa',
                #     foreground='838498',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='838498',
                #     foreground=color_undef,
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),

                widget.TextBox(
                    background=color_white,
                    foreground=color_undef,
                    fontsize=17,
                    text='',
                    padding=0
                ),

                widget.Systray(
                    background=color_undef,
                    foreground=color_white,
                    icon_size=16
                ),
                widget.Spacer(
                    background=color_undef,
                    length=8
                ),

                # widget.TextBox(
                #     background=color_undef,
                #     foreground='8274ac',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='8274ac',
                #     foreground='9d83d0',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='9d83d0',
                #     foreground=color_purple,
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),

                widget.TextBox(
                    background=color_undef,
                    foreground=color_purple,
                    fontsize=17,
                    text='',
                    padding=0
                ),

                widget.KeyboardLayout(
                    font='mononoki Nerd Font Bold',
                    background=color_purple,
                    foreground=color_black,
                    configured_keyboards=['it', 'us', 'gb'],
                    display_map={'it': 'it', 'us': 'us', 'gb': 'uk'},
                    option='caps:swapescape',
                ),
                widget.TextBox(
                    background=color_purple,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Clock(
                    font='mononoki Nerd Font Bold',
                    background=color_purple,
                    foreground=color_black,
                    padding=8,
                    format=' %H:%M',
                    mouse_callbacks={'Button1': toggle_calcurse}
                )
            ],
            20
        )
    ),
    Screen(
        bottom=bar.Bar(
            [
                widget.TextBox(
                    text='',
                    background=color_white,
                    foreground=color_black,
                    mouse_callbacks={
                        'Button1':
                        lambda qtile: qtile.cmd_spawn('rofi-run -r')
                    },
                    padding=10
                ),

                # widget.TextBox(
                #     background='87878a',
                #     foreground=color_white,
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='56575e',
                #     foreground='87878a',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background=color_black,
                #     foreground='56575e',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),

                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),

                widget.Spacer(
                    length=36
                ),
                widget.TaskList(
                    # font='mononoki Nerd Font Bold',
                    background=color_black,
                    foreground=color_white,
                    border=color_yellow,
                    borderwidth=0,
                    highlight_method='text',
                    rounded=False,
                    icon_size=0,
                    margin_y=2,
                    padding_y=0,
                    title_width_method='uniform',
                    txt_floating=' ',
                    txt_minimized=' ',
                    txt_maximized='  '
                ),
                widget.Spacer(
                    length=36
                ),

                # widget.TextBox(
                #     background=color_black,
                #     foreground='564872',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='564872',
                #     foreground='856ab0',
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),
                # widget.TextBox(
                #     background='856ab0',
                #     foreground=color_purple,
                #     fontsize=17,
                #     text='',
                #     padding=0
                # ),

                widget.TextBox(
                    background=color_black,
                    foreground=color_purple,
                    fontsize=17,
                    text='',
                    padding=0
                ),

                widget.CurrentLayout(
                    font='mononoki Nerd Font Bold',
                    background=color_purple,
                    foreground=color_black,
                ),
            ],
            20
        )
    )
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


@hook.subscribe.client_new
def idle_dialogues(window):
    if((window.window.get_name() == 'Network Connections') or
            (window.window.get_name() == 'Bluetooth Devices') or
            (window.window.get_name() == 'Printers - localhost') or
            (window.window.get_name() == 'Customize Look and Feel') or
            (window.window.get_name() == 'Volume Control') or
            (window.window.get_name() == 'Nitrogen') or
            (window.window.get_name() == 'calcurse') or
            (window.window.get_name() == 'Ifm') or
            (window.window.get_name() == 'Moc') or
            (window.window.get_name() == 'Conf')):
        window.floating = True


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
