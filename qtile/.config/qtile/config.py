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
color_black = '1E1F29'
color_gray = '3A3C4E'
color_blue = '626483'
color_cyan = '8BE9FD'
color_green = '50FA7B'
color_red = 'FF5555'
color_yellow = 'F1FA8C'
color_magenta = 'FF79C6'
color_purple = 'BD93F9'
color_lightblue = '6699FF'

color_whitegray = '97979a'
color_bluegray = '547aca'
color_purplegray = '9576c5'


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
    Key([mod], "x", lazy.spawn("xkill")),                    # Xkill
    Key([mod], "i", lazy.spawn("xterm")),                    # Terminal
    Key([mod], "u", lazy.spawn("xterm -T Shfm -e shfm")),    # Shfm
    Key([mod], "c", lazy.spawn("xterm -T Cmus -e cmus")),    # Cmus
    Key([mod], "m", lazy.spawn("xterm -T Mocp -e mocp")),    # Moc
    Key([mod], "n", lazy.spawn("xterm -T NeoVim -e nvim")),  # NeoVim
    Key([mod], "p", lazy.spawncmd(prompt='%')),              # Prompt

    # Volume solution 1
    # Key([], "XF86AudioRaiseVolume",
    #     lazy.spawn("amixer -q -D pulse sset Master 3%+")),
    # Key([], "XF86AudioLowerVolume",
    #     lazy.spawn("amixer -q -D pulse sset Master 3%-")),
    # Key([], "XF86AudioMute",
    #     lazy.spawn("amixer -q -D pulse sset Master toggle")),

    # Volume solution 2
    # Key([], "XF86AudioRaiseVolume",
    #     lazy.spawn("amixer -q sset Master 3%+")),
    # Key([], "XF86AudioLowerVolume",
    #     lazy.spawn("amixer -q sset Master 3%-")),
    # Key([], "XF86AudioMute",
    #     lazy.spawn("amixer -q sset Master toggle")),

    # Volume solution 3
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 3")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 3")),
    # Key([], "XF86AudioMute", lazy.spawn("pamixer -t")),

    # Volume solution 4
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +3%")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -3%")),
    Key([], "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
]

# Groups management (main solution)
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


# Groups management (alternative simple solution)
# groups = [Group(i, position=int(i)) for i in "123456789"]
# for i in groups:
#     keys.extend([
#         Key([mod], i.name, lazy.group[i.name].toscreen()),
#         Key([mod, "control"], i.name,
#             lazy.window.togroup(i.name, switch_group=True)),
#     ])


layout_theme = dict(
    border_width=2,
    margin=20,
    border_focus=color_white,
    border_normal=color_gray
)


layouts = [
    layout.Max(name='Max'),
    layout.MonadTall(name='Tall', **layout_theme),
    layout.MonadWide(name='Wide', **layout_theme),
    layout.Floating(name='Float', **layout_theme),
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
    if os.path.exists(home+'/.local/share/calcurse/.calcurse.pid') or\
            os.path.exists(home+'/.calcurse/.calcurse.pid'):
        os.system('killall calcurse')  # os.remove(home+"...")
    else:
        qtile.cmd_spawn('xterm -e calcurse')


# Widgets list on primary screen bar
widgets_primary_display = [
    widget.GroupBox(
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

    widget.Spacer(length=6),

    widget.Prompt(
        foreground=color_lightblue,
        cursor_color=color_lightblue,
        prompt='{prompt} ',
        cursor=True,
        cursorblink=0.5
    ),

    widget.TextBox(foreground=color_gray, fontsize=10, text='', padding=0),

    widget.Spacer(length=36),

    widget.TaskList(
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

    widget.Spacer(length=36),

    widget.TextBox(foreground=color_gray, fontsize=10, text='', padding=0),

    widget.Cmus(
        max_chars=10,
        play_color=color_lightblue,
        noplay_color=color_gray
    ),

    widget.Moc(
        max_chars=10,
        play_color=color_lightblue,
        noplay_color=color_gray
    ),

    widget.Systray(icon_size=16),

    widget.Spacer(length=8),

    widget.Spacer(background='262730', length=1),
    widget.Spacer(background='2e2f38', length=1),
    widget.Spacer(background='363740', length=1),
    widget.Spacer(background='3e3f47', length=1),
    widget.Spacer(background='46474e', length=1),
    widget.Spacer(background='4e4f56', length=1),
    widget.Spacer(background='56575e', length=1),
    widget.Spacer(background='5e5f65', length=1),
    widget.Spacer(background='66676c', length=1),
    widget.Spacer(background='6e6f74', length=1),
    widget.Spacer(background='77777c', length=1),
    widget.Spacer(background='7f7f83', length=1),
    widget.Spacer(background='87878a', length=1),
    widget.Spacer(background='8f8f92', length=1),
    widget.Spacer(background='97979a', length=1),
    widget.Spacer(background='9f9fa1', length=1),
    widget.Spacer(background='a7a7a8', length=1),
    widget.Spacer(background='afafb0', length=1),
    widget.Spacer(background='b7b7b8', length=1),

    widget.Spacer(background=color_white, length=6),  # +0

    widget.TextBox(
        background=color_white,
        foreground=color_black,
        text='',
        padding=0
    ),

    widget.Spacer(background=color_white, length=0),  # +4

    widget.Battery(
        background=color_white,
        foreground=color_black,
        format='{percent:2.0%}',
        padding=4
    ),

    widget.Spacer(background=color_white, length=2),  # +4

    widget.TextBox(
        background=color_white,
        foreground=color_whitegray,
        fontsize=10,
        text='',
        padding=0
    ),

    widget.Spacer(background=color_white, length=6),  # +0

    widget.TextBox(
        background=color_white,
        foreground=color_black,
        text='',
        padding=0
    ),

    widget.Spacer(background=color_white, length=1),  # +5

    widget.PulseVolume(
        background=color_white,
        foreground=color_black,
        padding=5
    ),

    widget.Spacer(background=color_white, length=1),  # +5

    widget.Spacer(background='bbbdc2', length=1),
    widget.Spacer(background='b6bbc5', length=1),
    widget.Spacer(background='b2b9c9', length=1),
    widget.Spacer(background='adb7cc', length=1),
    widget.Spacer(background='a9b6cf', length=1),
    widget.Spacer(background='a4b4d2', length=1),
    widget.Spacer(background='a0b2d5', length=1),
    widget.Spacer(background='9bb0d9', length=1),
    widget.Spacer(background='97aedc', length=1),
    widget.Spacer(background='92acdf', length=1),
    widget.Spacer(background='8eaae2', length=1),
    widget.Spacer(background='8aa8e5', length=1),
    widget.Spacer(background='85a6e9', length=1),
    widget.Spacer(background='81a4ec', length=1),
    widget.Spacer(background='7ca2ef', length=1),
    widget.Spacer(background='78a1f2', length=1),
    widget.Spacer(background='739ff5', length=1),
    widget.Spacer(background='6f9df9', length=1),
    widget.Spacer(background='6a9bfc', length=1),

    widget.Spacer(background=color_lightblue, length=6),  # +0

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

    widget.Spacer(background=color_lightblue, length=5),  # +1

    widget.TextBox(
        background=color_lightblue,
        foreground=color_bluegray,
        fontsize=10,
        text='',
        padding=0
    ),

    widget.Spacer(background=color_lightblue, length=6),  # +0

    widget.TextBox(
        background=color_lightblue,
        foreground=color_black,
        text=' ',
        padding=0
    ),

    widget.Spacer(background=color_lightblue, length=3),  # +0

    widget.KeyboardLayout(
        background=color_lightblue,
        foreground=color_black,
        configured_keyboards=['it', 'us', 'gb'],
        display_map={'it': 'Ita', 'us': 'Usa', 'gb': 'Gbr'},
        option='caps:swapescape',
        padding=0
    ),

    widget.Spacer(background=color_lightblue, length=3),  # +0

    widget.Spacer(background='6a99ff', length=1),
    widget.Spacer(background='6f98fe', length=1),
    widget.Spacer(background='7398fe', length=1),
    widget.Spacer(background='7798fe', length=1),
    widget.Spacer(background='7c98fe', length=1),
    widget.Spacer(background='8097fd', length=1),
    widget.Spacer(background='8497fd', length=1),
    widget.Spacer(background='8997fd', length=1),
    widget.Spacer(background='8d96fc', length=1),
    widget.Spacer(background='9296fc', length=1),
    widget.Spacer(background='9696fc', length=1),
    widget.Spacer(background='9a95fb', length=1),
    widget.Spacer(background='9f95fb', length=1),
    widget.Spacer(background='a395fb', length=1),
    widget.Spacer(background='a794fa', length=1),
    widget.Spacer(background='ac94fa', length=1),
    widget.Spacer(background='b094fa', length=1),
    widget.Spacer(background='b494fa', length=1),
    widget.Spacer(background='b993f9', length=1),

    widget.Spacer(background=color_purple, length=4),

    widget.Wallpaper(
        background=color_purple,
        foreground=color_black,
        directory='~/Pictures/wallpapers/wallogo',
        random_selection=True,
        wallpaper_command=['feh', '--bg-fill'],
        label=' Chwp'
    ),

    widget.TextBox(
        background=color_purple,
        foreground=color_purplegray,
        fontsize=10,
        text='',
        padding=0
    ),

    widget.Spacer(background=color_purple, length=6),

    widget.TextBox(
        background=color_purple,
        foreground=color_black,
        text=' ',
        padding=0
    ),

    widget.Clock(
        background=color_purple,
        foreground=color_black,
        padding=0,
        format='%H:%M',
        mouse_callbacks={'Button1': toggle_calcurse}
    ),

    widget.Spacer(background=color_purple, length=9)
]


# Widgets list on secondary screen bar
widgets_secondary_display = [
    widget.GroupBox(
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

    widget.Spacer(length=6),

    widget.TextBox(fontsize=10, text='┃', padding=0),

    widget.Spacer(length=36),

    widget.TaskList(
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

    widget.Spacer(length=36),

    widget.TextBox(fontsize=10, text='┃', padding=0),

    widget.Spacer(length=5),

    widget.TextBox(text=' ', padding=0),

    widget.CurrentLayout(padding=1),

    widget.Spacer(length=5)
]


screens = [
    Screen(bar.Bar(widgets_primary_display, 20)),
    Screen(bar.Bar(widgets_secondary_display, 20)),
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
            (window.window.get_name() == 'Cmus') or
            (window.window.get_name() == 'Mocp') or
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
