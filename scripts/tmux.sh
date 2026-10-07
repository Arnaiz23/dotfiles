#!/bin/bash

# Solo si es interactivo, hay TTY real, y no estamos ya en tmux
if [ -t 1 ] && [ -z "$TMUX" ]; then
  if tmux has-session 2>/dev/null; then
    tmux attach
  else
    tmux new-session
  fi
fi
