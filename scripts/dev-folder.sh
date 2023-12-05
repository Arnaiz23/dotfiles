directory=$(find ~/Dev -maxdepth 1 -type d | fzf-tmux -p --reverse)

tmux_session_name=$(basename $directory)

tmux has-session -t $tmux_session_name
if [ $? != 0 ]
then
    tmux new -s "$tmux_session_name" -c "$directory" -d
fi

tmux switch-client -t "$tmux_session_name"
