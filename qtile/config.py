import subprocess
from os import path
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from subprocess import Popen

#Qtile_extras
from qtile_extras import widget as extraWidget
# from qtile_extras.widget import GroupBox2
from qtile_extras.widget.decorations import RectDecoration, PowerLineDecoration

# Автостарт
autostart_sh = "/home/pivogirl/.config/qtile/autostart.sh"
@hook.subscribe.startup_once
def autostart():
    Popen([autostart_sh])

#Функція перемикання розкладки
@hook.subscribe.startup_once
def set_keyboard_layout():
    subprocess.run(["setxkbmap", "-layout", "us,ua", "-option", "grp:alt_shift_toggle"])

#Щоб вспливаючі вікна були плаваючі
# @hook.subscribe.client_new
# def floating_dialogs(window):
#     dialog = window.window.get_wm_type() == 'dialog'
#     transient = window.window.get_wm_transient_for()
#     if dialog or transient:
#         window.floating = True


mod = "mod4"
terminal = "alacritty"
browser = "vivaldi"
rofi = "rofi -show drun -show-icons"

active_color = "#efefef"
non_active_color = "#1f2223"

keys = [
    #Сполучення для керування вікнами
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.x
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"],"Return",lazy.layout.toggle_split(),desc="Toggle between split and unsplit",),

    #Сполучення для виклику програм
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod],"f",lazy.window.toggle_fullscreen(),desc="Toggle fullscreen on the focused window",),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "r", lazy.spawn(rofi), desc="Spawn rofi"),

    #Керування звуком
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +2%"), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -2%"), desc='volume down'),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='playerctl'),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='playerctl'),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='playerctl'),

    #Скіншот
    Key([], "Print", lazy.spawn("flameshot gui"), desc="Take screenshot"),

    #Зміна мови
    # Key(["mod1"], "Shift_L", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
    # Key(["shift"], "Alt_L", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout2."),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Bsp(
        border_focus = active_color,
        border_normal = non_active_color,
        fair = False,
        border_on_single = True,
        border_width = 2,
        margin = 5,
        grow_amount = 5,
    ),
    layout.Floating(
        border_focus = active_color,
        border_normal = non_active_color,
    ),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

#palette
blue = "293b51"
red = "783a3a"
red2 = "6e4341"
black = "131617"
gray = "2a2d2f"

powerline = {
    "decorations": [
        PowerLineDecoration(path="arrow_left", padding_y=0, )
    ]
}

decoration_group = {
    "decorations": [
        RectDecoration(colour=red, radius=10, filled=True, padding_y=3, padding_x = 0, group=True)
    ],  #                         закруглення заповненість відступ зв.  відступ збок.  хз
    "padding": 15, # відступ між цифрами
}

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Spacer(length = 5),
                widget.CurrentLayoutIcon(),
                extraWidget.GroupBox2(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.OpenWeather(
                    location="Taranivka",
                    language="ua",
                ),
                # відображення розкладки
                widget.GenPollText(
                    func=lambda: subprocess.check_output(["xkb-switch"]).decode("utf-8").strip().upper(),
                    update_interval=1,
                ),
                # widget.KeyboardLayout(configured_keyboards=['us', 'ua',],
                #                       update_interval=1,),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.TextBox("Volume:"),
                widget.PulseVolume(),
                widget.Systray(),
                widget.TextBox(text="󱥓", fontsize=18),
                widget.Clock(format="%d.%m.%Y %a %I:%M %p"),
                widget.QuickExit(default_text=' ', countdown_format='{} ', fontsize = 20),
                widget.Spacer(length = 5),
            ],
            30,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["ff00ff", "ff00ff", "ff00ff", "ff00ff"]  # Borders are magenta
            margin = 5,
            background = black
        ),

        wallpaper = "~/Картинки/wallpapers/wall1.png",
        wallpaper_mode = "fill",
        # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
        # By default we handle these events delayed to already improve performance, however your system might still be struggling
        # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
        x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_width = 2,
    border_focus = active_color,
    border_normal = non_active_color,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = False

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = "Yaru"
wl_xcursor_size = 24

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
