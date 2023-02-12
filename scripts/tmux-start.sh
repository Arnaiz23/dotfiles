#!/bin/bash

session="ide"

tmux has-session -t $session
if [ "$?" -eq 0 ] ; then
	#tmux kill-ses -t$session
	tmux a -tide
else
	# Create a new session named "$session", and run command
	tmux new-session -d -s "$session"

	window=0
	tmux rename-window -t $session:$window 'editor'
	tmux send-keys -t $session:$window 'v' Enter

	window=1
	tmux new-window -t $session:$window -n 'zsh'
	tmux split-window -t $session:$window -h -p 90
	tmux select-pane -t $session:$window -t 0
	tmux split-window -t $session:$window -v

	tmux a -tide
fi

