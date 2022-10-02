#!/bin/bash

session="ide"

tmux has-session -t $session
if [ "$?" -eq 1 ] ; then

	# Create a new session named "$session", and run command
	tmux new-session -d -s "$session"

	window=0
	tmux rename-window -t $session:$window 'editor'
	tmux send-keys -t $session:$window 'v' Enter

	window=1
	tmux new-window -t $session:$window -n 'zsh'
	tmux split-window -t $session:$window -h
	tmux select-pane -t $session:$window -t 0
	tmux split-window -t $session:$window -v

	tmux select-window -t $session:0

fi

tmux a -tide
