# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Qtile keybindings

from libqtile.config import Key
from libqtile.command import lazy


mod = "mod4"

terminal = "alacritty"
browser = "firefox"
secondary_browser = "brave"
explorer = "thunar"
notes = "inkdrop"
music = "spotify"
#lock_command = "dm-tool lock"
lock_command = "slock"
menu = "rofi -show drun"
screenshot = "flameshot gui"
emoji_launcher = "emoji-picker"
# emoji_launcher = "rofi -show emoji -modi emoji"
power_launcher = "power_rofi"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod, "shift"], "c", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # Screen lock
    ([mod, "control"], "l", lazy.spawn(lock_command)),

    # ------------ App Configs ------------

    # Menu
    ([mod, "shift"], "Return", lazy.spawn(menu)),

    # DMenu
    ([mod], "m", lazy.spawn("dmenu_run")),

    # Window Nav
    ([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Browser
    ([mod], "b", lazy.spawn(browser)),
    ([mod], "c", lazy.spawn(secondary_browser)),

    # File Explorer
    ([mod], "e", lazy.spawn(explorer)),

    # Terminal
    ([mod], "Return", lazy.spawn(terminal)),

    # Redshift
    ([mod], "r", lazy.spawn("redshift -O 2400")),
    ([mod, "shift"], "r", lazy.spawn("redshift -x")),

    # Screenshot
    ([mod], "s", lazy.spawn(screenshot)),
    #([mod, "shift"], "s", lazy.spawn("scrot -s")),

    # Emojis
    ([mod], "g", lazy.spawn(emoji_launcher)),

    # inkdrop
    ([mod], "i", lazy.spawn(notes)),

    # power launcher
    ([mod, "shift"], "q", lazy.spawn(power_launcher)),

    ([mod], "p", lazy.spawn(music)),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
