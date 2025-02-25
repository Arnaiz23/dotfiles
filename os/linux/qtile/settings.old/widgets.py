import psutil
from libqtile import widget, qtile
from .theme import colors

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
            margin_x=5,
            padding_y=2,
            padding_x=8,
            borderwidth=2,
            active=colors['active'],
            inactive=colors['inactive'],
            rounded=True,
            highlight_method='line',
            urgent_alert_method='text',
            urgent_text=colors['color1'],
            this_current_screen_border=colors['active'],
            this_screen_border=colors["inactive"],
            other_current_screen_border=colors["active"],
            other_screen_border=colors["inactive"],
            disable_drag=True,
            center_aligned=True
        ),
        separator(),
        # Name of the window in the right of the icons
        widget.WindowName(**base(fg='active'), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),

    separator(),

    # Right side

    ## Updates
    icon(bg="dark", fg="light", text=' '), # Icon: nf-fa-download
    widget.CheckUpdates(
        background=colors['dark'],
        colour_have_updates=colors['light'],
        colour_no_updates=colors['light'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
    ),
    separator(),
    separator(),

    ## RAM
    icon(fg="light", text=' '),  # Icon: nf-fa-save
    widget.Memory(**base(fg='light') ),
    separator(),
    separator(),

    ## CPU
    widget.CPU(**base(fg="light"),format='󰍛 CPU {load_percent}%'), # Icon: nf-md-memory
    separator(),
    separator(),

    ## Calendar and clock
    icon(fg="light", fontsize=16, text=' '), # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(fg='light'), format='%d/%m/%Y - %H:%M '),

    # Power options
    widget.TextBox(
        background=colors["dark"],
        foreground=colors["light"],
        fontsize=16,
        text="⏻ ",
        padding=3,
        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("power_rofi")},
    ),
    separator()
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
