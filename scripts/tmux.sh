#!/bin/bash

EXISTS_SESSION=$(tmux ls)

if [ "$EXISTS_SESSION" -eq 0 ]; then
  tmux
else
  tmux a
fi
