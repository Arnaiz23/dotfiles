from libqtile import widget, qtile
from .theme import colors

red_device = 'enp37s0'
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

    # Updates
    powerline('color3', 'dark'),

    icon(bg="color3", text=' '), # Icon: nf-fa-download
    
    widget.CheckUpdates(
        background=colors['color3'],
        colour_have_updates=colors['text'],
        colour_no_updates=colors['text'],
        no_update_string='0',
        display_format='{updates}',
        update_interval=1800,
        custom_command='checkupdates',
        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')}
    ),

    widget.TextBox(text=" ", background=colors["color3"]),

    # Network
    icon(bg="color3", text='󰓅 '),  # Icon: nf-md-speedometer
    
    widget.Net(**base(bg='color3'), format = '{down} {up}', interface = red_device, use_bits = 'true'),

    widget.TextBox(text=" ", background=colors["color3"]),

    # RAM
    powerline('color1', 'color3'),

    icon(bg="color1", text=' '),  # Icon: nf-fa-save
    
    widget.Memory(**base(bg='color1') ),

    # CPU
    widget.TextBox(background=colors["color1"],text=" "),

    widget.CPU(**base(bg="color1"),format='󰍛 CPU {load_percent}%'), # Icon: nf-md-memory

    widget.TextBox(text=" ", background=colors["color1"]),

    # Layout
    powerline('color3', 'color1'),

    widget.CurrentLayoutIcon(**base(bg='color3'), scale=0.65),

    widget.CurrentLayout(**base(bg='color3'), padding=5),

    widget.TextBox(text=" ", background=colors["color3"]),

    # Calendar and clock
    powerline('color1', 'color3'),

    icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    # System icons
    powerline('text', 'color1'),
]

secondary_widgets = [
    *workspaces(),

    separator(),

    powerline('color4', 'dark'),

    icon(bg="color4", text=' '),  # Icon: nf-fa-feed

    widget.Net(**base(bg='color4'), interface=red_device, prefix='M'),

    powerline('color3', 'color4'),

    widget.CurrentLayoutIcon(**base(bg='color3'), scale=0.65),

    widget.CurrentLayout(**base(bg='color3'), padding=5),

    powerline('color1', 'color3'),

    icon(bg="color1", fontsize=17, text=' '), # Icon: nf-mdi-calendar_clock

    widget.Clock(**base(bg='color1'), format='%d/%m/%Y - %H:%M '),

    powerline('dark', 'color1'),
]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
