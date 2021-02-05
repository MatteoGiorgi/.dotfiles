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
color_red = 'FF5555'
color_yellow = 'F1FA8C'
color_magenta = 'FF79C6'
color_purple = 'BD93F9'
color_lightblue = '6699FF'

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
    Key([mod, "control"], "q", lazy.shutdown()),  # Quit

    # Switch focus, chanage layout, kill window
    Key([mod], "space", lazy.layout.next()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "q", lazy.window.kill()),

    # Flip master/stack, toggle floating and move between groups
    Key([mod, "control"], "Return", lazy.window.toggle_floating()),
    Key([mod, "control"], "BackSpace", lazy.window.toggle_minimize()),
    Key([mod, "control"], "space", lazy.window.toggle_maximize()),
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
    Key([mod], "Return", lazy.spawn("rofi-run -r")),         # Menu
    Key([mod], "Escape", lazy.spawn("rofi-run -l")),         # Exit/Logout
    Key([mod], "w", lazy.spawn("rofi-run -w")),              # Windows
    Key([mod], "s", lazy.spawn("rofi-run -s")),              # Settings
    Key([mod], "i", lazy.spawn("xterm")),                    # Terminal
    Key([mod], "x", lazy.spawn("xkill")),                    # Xkill
    Key([mod], "u", lazy.spawn("xterm -T Shfm -e shfm")),    # Shfm
    Key([mod], "m", lazy.spawn("xterm -T Moc -e mocp")),     # Music
    Key([mod], "p", lazy.spawncmd(prompt='%')),              # Prompt

    # Volume solution 1
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q -D pulse sset Master 3%+")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q -D pulse sset Master 3%-")),
    # Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse sset Master toggle")),

    # Volume solution 2
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q sset Master 3%+")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q sset Master 3%-")),
    # Key([], "XF86AudioMute", lazy.spawn("amixer -q sset Master toggle")),

    # Volume solution 3
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 3")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 3")),
    # Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),

    # Volume solution 4
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +3%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -3%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
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
    layout.MonadTall(name='tall', **layout_theme),
    layout.MonadWide(name='wide', **layout_theme),
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
    font='mononoki Nerd Font',
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
        top=bar.Bar(
            [
                widget.GroupBox(
                    background=color_black,
                    highlight_method='text',
                    margin_y=2,
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
                    foreground=color_lightblue,
                    cursor=True,
                    prompt='{prompt} ',
                    cursor_color=color_lightblue,
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
                    background=color_black,
                    foreground=color_gray,
                    border=color_white,
                    borderwidth=0,
                    highlight_method='text',
                    rounded=False,
                    icon_size=0,
                    margin_y=2,
                    padding_y=0,
                    title_width_method='uniform',
                    txt_floating='* ',
                    txt_minimized='- ',
                    txt_maximized='+ '
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
                    background=color_black,
                    foreground=color_white,
                    max_chars=10,
                    play_color=color_lightblue,
                    noplay_color=color_gray
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_gray,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Systray(
                    background=color_gray,
                    foreground=color_white,
                    icon_size=16
                ),
                widget.Spacer(
                    background=color_gray,
                    length=8
                ),
                widget.TextBox(
                    background=color_gray,
                    foreground=color_white,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_white,
                    length=6
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_black,
                    text='',
                    padding=0
                ),
                widget.Battery(
                    background=color_white,
                    foreground=color_black,
                    format='{percent:2.0%}',
                    padding=4
                ),
                widget.Spacer(
                    background=color_white,
                    length=2
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_white,
                    length=6
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_black,
                    text='',
                    padding=0
                ),
                widget.PulseVolume(
                    background=color_white,
                    foreground=color_black,
                    padding=5
                ),
                widget.Spacer(
                    background=color_white,
                    length=1
                ),
                widget.TextBox(
                    background=color_white,
                    foreground=color_lightblue,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_lightblue,
                    length=7
                ),
                widget.TextBox(
                    background=color_lightblue,
                    foreground=color_black,
                    text=' ',
                    padding=0
                ),
                widget.CurrentLayout(
                    background=color_lightblue,
                    foreground=color_black,
                    padding=1
                ),
                widget.Spacer(
                    background=color_lightblue,
                    length=5
                ),
                widget.TextBox(
                    background=color_lightblue,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_lightblue,
                    length=7
                ),
                widget.TextBox(
                    background=color_lightblue,
                    foreground=color_black,
                    text=' ',
                    padding=0
                ),
                widget.KeyboardLayout(
                    background=color_lightblue,
                    foreground=color_black,
                    configured_keyboards=['it', 'us', 'gb'],
                    display_map={'it': 'it', 'us': 'us', 'gb': 'uk'},
                    option='caps:swapescape',
                    padding=2
                ),
                widget.Spacer(
                    background=color_lightblue,
                    length=4
                ),
                widget.TextBox(
                    background=color_lightblue,
                    foreground=color_purple,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Wallpaper(
                    background=color_purple,
                    foreground=color_black,
                    directory='~/Pictures/wallpapers/wallogo',
                    random_selection=True,
                    wallpaper_command=['feh', '--bg-fill'],
                    label=' chwp',
                    padding=8
                ),
                widget.TextBox(
                    background=color_purple,
                    foreground=color_black,
                    fontsize=17,
                    text='',
                    padding=0
                ),
                widget.Spacer(
                    background=color_purple,
                    length=8
                ),
                widget.TextBox(
                    background=color_purple,
                    foreground=color_black,
                    text=' ',
                    padding=0
                ),
                widget.Clock(
                    background=color_purple,
                    foreground=color_black,
                    padding=-1,
                    format='%H:%M',
                    mouse_callbacks={'Button1': toggle_calcurse}
                ),
                widget.Spacer(
                    background=color_purple,
                    length=9
                )
            ],
            20
        )
    ),
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    background=color_black,
                    highlight_method='text',
                    margin_y=2,
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
                widget.Spacer(
                    length=36
                ),
                widget.TaskList(
                    background=color_black,
                    foreground=color_gray,
                    border=color_white,
                    borderwidth=0,
                    highlight_method='text',
                    rounded=False,
                    icon_size=0,
                    margin_y=2,
                    padding_y=0,
                    title_width_method='uniform',
                    txt_floating='* ',
                    txt_minimized='- ',
                    txt_maximized='+ '
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
                widget.Spacer(
                    background=color_black,
                    length=7
                ),
                widget.TextBox(
                    background=color_black,
                    foreground=color_white,
                    text=' ',
                    padding=0
                ),
                widget.CurrentLayout(
                    background=color_black,
                    foreground=color_white,
                    padding=1
                ),
                widget.Spacer(
                    background=color_black,
                    length=5
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
    border_focus=color_lightblue,
    border_normal=color_white,
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
            (window.window.get_name() == 'Print Settings - localhost') or
            (window.window.get_name() == 'Appearance') or
            (window.window.get_name() == 'Display') or
            (window.window.get_name() == 'Keyboard') or
            (window.window.get_name() == 'Mouse and Touchpad') or
            (window.window.get_name() == 'Volume Control') or
            (window.window.get_name() == 'Power Manager') or
            (window.window.get_name() == 'sxiv') or
            (window.window.get_name() == 'calcurse') or
            (window.window.get_name() == 'Shfm') or
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
