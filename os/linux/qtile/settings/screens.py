# Antonio Sarosi
# https://youtube.com/c/antoniosarosi
# https://github.com/antoniosarosi/dotfiles

# Multimonitor support

from libqtile.config import Screen
from libqtile import bar
from libqtile.log_utils import logger
import subprocess

from .widgets import primary_widgets

# Function that create the status_bar. (widgets, size)
def status_bar(widgets):
    return bar.Bar(widgets, size=40, opacity=0.92)

def create_screen():
    return Screen(top=status_bar(primary_widgets))

# top -> position of the status_bar (top, bottom)
screens = [create_screen()]

xrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"

command = subprocess.run(
    xrandr,
    shell=True,
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if command.returncode != 0:
    error = command.stderr.decode("UTF-8")
    logger.error(f"Failed counting monitors using {xrandr}:\n{error}")
    connected_monitors = 1
else:
    connected_monitors = int(command.stdout.decode("UTF-8"))

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(create_screen())
