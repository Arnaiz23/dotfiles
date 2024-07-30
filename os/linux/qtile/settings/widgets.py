import psutil
from libqtile import widget, qtile
from .theme import colors

try:
    from qtile_extras.widget.decorations import BorderDecoration
except ModuleNotFoundError as e:
    print("qtile_extras module not found")

red_device, red_device_item = list(psutil.net_if_addrs().items())[1]
myTerm = "alacritty"

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

def base(fg='text', bg='dark'): 
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


# Uploads and wifi icons corner right
def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="", # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-3
    )


# Icons
def workspaces(): 
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font='UbuntuMono Nerd Font',
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=False,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors['urgent'],
            this_current_screen_border=colors['focus'],
            this_screen_border=colors['grey'],
            other_current_screen_border=colors['dark'],
            other_screen_border=colors['dark'],
            disable_drag=True
        ),
        separator(),
        # Name of the window in the right of the icons
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    # System icons
    widget.Systray(background=colors['dark'], padding=5),

    widget.TextBox(text=" ", background=colors["dark"]),

    widget.WidgetBox(
        start_opened=True,
        text_open="󱃥 ",
        text_closed="󱃦 ",
        background=colors["dark"],
        widgets=[
            widget.TextBox(text=" ", background=colors["dark"]),
            widget.TextBox(
                text=f"󰩠: {red_device_item[0][1]}",
                background=colors["dark"],
                foreground=colors["color2"],
            ),
            widget.TextBox(text=" ", background=colors["dark"]),
            widget.CapsNumLockIndicator(
                **base(fg="color7"),
            ),
        ],
    ),
    widget.TextBox(text=" ", background=colors["dark"]),

    # Updates
    # powerline('color3', 'dark'),

    icon(bg="dark", fg="color6", text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        background=colors['dark'],
        colour_have_updates=colors['color6'],
        colour_no_updates=colors['color6'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
    ),

    widget.TextBox(text=" ", background=colors["dark"]),

    # Network
    icon(bg="dark", fg='color6', text='󰓅 '),  # Icon: nf-md-speedometer
    
    widget.Net(**base(bg='dark', fg='color6'), format = '{down} {up}', interface = red_device, use_bits = 'true'),

    widget.TextBox(text=" ", background=colors["dark"]),

    # RAM
    # powerline('color1', 'color3'),

    icon(fg="color1", text=' '),  # Icon: nf-fa-save
    
    widget.Memory(**base(fg='color1') ),

    # CPU
    widget.TextBox(foreground=colors["color1"], background=colors['dark'], text=" "),

    widget.CPU(**base(fg="color1"),format='󰍛 CPU {load_percent}%'), # Icon: nf-md-memory

    widget.TextBox(text=" ", background=colors["dark"]),

    # Layout
    # powerline('color3', 'color1'),

    widget.CurrentLayoutIcon(**base(fg='color3'), scale=0.65),

    widget.CurrentLayout(**base(fg='color3'), padding=5),

    widget.TextBox(text=" ", background=colors["dark"]),

    # Calendar and clock
    # powerline('color1', 'color3'),

    icon(fg="color5", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(fg='color5'), format='%d/%m/%Y - %H:%M '),

    # System icons
    # powerline('text', 'color1'),
    widget.TextBox(text=" ", background=colors["dark"]),

    widget.TextBox(
        background=colors["dark"],
        foreground=colors["color6"],
        fontsize=16,
        text="⏻ ",
        padding=3,
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("power_rofi")},
    ),
    widget.TextBox(text=" ", background=colors["dark"]),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    icon(fg="color4", text=' '),  # Icon: nf-fa-feed

    widget.KeyboardLayout(
        foreground = colors["color4"],
        background = colors["dark"],
        fmt = 'Keyboard: {}',
        configured_keyboards = ['es', 'us']
   ),


    widget.TextBox(text=" ", background=colors[ "dark"]),

    icon(fg="color3", fontsize=17, text=' 󰖐 '), # Icon: nf-mdi-calendar_clock

    widget.OpenWeather(**base(fg='color3'), location="Madrid"),

    widget.TextBox(text=" ", background=colors["dark"]),

    widget.CapsNumLockIndicator(**base(fg="color6")),

    widget.TextBox(text=" ", background=colors["dark"]),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
