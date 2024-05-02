import psutil
from libqtile import widget, qtile
from .theme import colors

from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration

# red_device = 'enp37s0'
red_device = list(psutil.net_if_addrs().keys())[1]
myTerm = "alacritty"

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


# Uploads and wifi icons corner right
def icon(fg="text", bg="dark", fontsize=16, text="?", bordercolor="dark"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3,
        decorations=[
            BorderDecoration(
                border_width=[0, 0, 2, 0],
                colour=colors[bordercolor],
                padding_x=None,
                padding_y=None,
            )
        ],
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg), text="", fontsize=37, padding=-3  # Icon: nf-oct-triangle_left
    )


# Icons
def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="UbuntuMono Nerd Font",
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            highlight_method="block",
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        # Name of the window in the right of the icons
        widget.WindowName(**base(fg="focus"), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    # System icons
    widget.Systray(background=colors["dark"], padding=5),
    widget.TextBox(text=" ", background=colors["dark"]),
    widget.WidgetBox(
        start_opened=True,
        text_open="󱃥 ",
        text_closed="󱃦 ",
        background=colors["dark"],
        widgets=[
            widget.TextBox(text=" ", background=colors["dark"]),
            widget.TextBox(
                text=f"󰩠: {psutil.net_if_addrs()[red_device][0][1]}",
                background=colors["dark"],
                foreground=colors["color2"],
                decorations=[
                    BorderDecoration(
                        colour=colors["color2"],
                        border_width=[0, 0, 2, 0],
                    )
                ],
            ),
            widget.TextBox(text=" ", background=colors["dark"]),
            widget.CapsNumLockIndicator(
                **base(fg="color7"),
                decorations=[
                    BorderDecoration(
                        colour=colors["color7"],
                        border_width=[0, 0, 2, 0],
                    )
                ],
            ),
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    # Updates
    icon(
        bg="dark", fg="color6", text=" ", bordercolor="color6"
    ),  # Icon: nf-fa-download
    widget.CheckUpdates(
        background=colors["dark"],
        colour_have_updates=colors["color6"],
        colour_no_updates=colors["color6"],
        no_update_string="0",
        display_format="{updates}",
        update_interval=1800,
        # custom_command="checkupdates",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(myTerm + " -e sudo pacman -Syu")
        },
        distro="Arch",
        decorations=[
            BorderDecoration(
                border_width=[0, 0, 2, 0],
                colour=colors["color6"],
            )
        ],
    ),
    widget.TextBox(
        text=" ",
        background=colors["dark"],
        decorations=[
            BorderDecoration(border_width=[0, 0, 2, 0], colour=colors["color6"])
        ],
    ),
    # Network
    icon(
        bg="dark", text="󰓅 ", fg="color6", bordercolor="color6"
    ),  # Icon: nf-md-speedometer
    widget.Net(
        **base(bg="dark", fg="color6"),
        format="{down} {up}",
        interface=red_device,
        use_bits="true",
        decorations=[
            BorderDecoration(border_width=[0, 0, 2, 0], colour=colors["color6"])
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    # RAM
    icon(fg="color1", text=" ", bordercolor="color1"),  # Icon: nf-fa-save
    widget.Memory(
        **base(fg="color1"),
        measure_mem="G",
        decorations=[
            BorderDecoration(colour=colors["color1"], border_width=[0, 0, 2, 0])
        ],
    ),
    # CPU
    widget.TextBox(
        background=colors["dark"],
        text=" ",
        decorations=[
            BorderDecoration(colour=colors["color1"], border_width=[0, 0, 2, 0])
        ],
    ),
    widget.CPU(
        **base(fg="color1"),
        format="󰍛 CPU {load_percent}%",
        decorations=[
            BorderDecoration(colour=colors["color1"], border_width=[0, 0, 2, 0])
        ],
    ),  # Icon: nf-md-memory
    widget.TextBox(text=" ", background=colors["dark"]),
    # Layout
    widget.CurrentLayoutIcon(
        **base(fg="color3"),
        scale=0.65,
        decorations=[
            BorderDecoration(colour=colors["color3"], border_width=[0, 0, 2, 0])
        ],
    ),
    widget.CurrentLayout(
        **base(fg="color3"),
        padding=5,
        decorations=[
            BorderDecoration(colour=colors["color3"], border_width=[0, 0, 2, 0])
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    # Calendar and clock
    icon(
        fg="color5", fontsize=17, text=" ", bordercolor="color5"
    ),  # Icon: nf-mdi-calendar_clock
    widget.Clock(
        **base(fg="color5"),
        format="%d/%m/%Y - %H:%M ",
        decorations=[
            BorderDecoration(colour=colors["color5"], border_width=[0, 0, 2, 0])
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    # icon(bg="dark",fg="color6", text='⏻ ', bordercolor="color6"), # Icon: nf-fa-download
    widget.TextBox(
        background=colors["dark"],
        foreground=colors["color6"],
        fontsize=16,
        text="⏻ ",
        padding=3,
        decorations=[
            BorderDecoration(
                border_width=[0, 0, 2, 0],
                colour=colors["color6"],
                padding_x=None,
                padding_y=None,
            )
        ],
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("power_rofi")},
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    icon(fg="color4", text=" ", bordercolor="color4"),  # Icon: nf-fa-feed
    widget.KeyboardLayout(
        foreground=colors["color4"],
        background=colors["dark"],
        fmt="Keyboard: {}",
        decorations=[
            BorderDecoration(
                colour=colors["color4"],
                border_width=[0, 0, 2, 0],
            )
        ],
        configured_keyboards=["es", "us"],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    icon(
        fg="color3", fontsize=17, text=" 󰖐 ", bordercolor="color3"
    ),  # Icon: nf-mdi-calendar_clock
    widget.OpenWeather(
        **base(fg="color3"),
        location="Madrid",
        decorations=[
            BorderDecoration(
                colour=colors["color3"],
                border_width=[0, 0, 2, 0],
            )
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
    widget.CapsNumLockIndicator(
        **base(fg="color6"),
        decorations=[
            BorderDecoration(
                colour=colors["color6"],
                border_width=[0, 0, 2, 0],
            )
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
