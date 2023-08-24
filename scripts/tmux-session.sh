SESSION=$(tmux list-sessions -F \#S | gum filter --placeholder "Pick session...")

if [ -z "$SESSION" ]
then
    exit
else
    tmux switch-client -t $SESSION || tmux attach -t $SESSION
fi
