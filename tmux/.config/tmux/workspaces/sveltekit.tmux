#!/bin/bash
SESSION="sveltekit"

tmux has-session -t $SESSION 2>/dev/null
if [ $? != 0 ]; then
	tmux new-session -d -s $SESSION -n editor
	tmux send-keys -t $SESSION 'cd ~/dev/my-sveltekit-app && nvim .' C-m

	tmux new-window -t $SESSION -n server
	tmux send-keys -t $SESSION 'cd ~/dev/my-sveltekit-app && npm run dev' C-m

	tmux new-window -t $SESSION -n git
	tmux send-keys -t $SESSION 'cd ~/dev/my-sveltekit-app && lazygit' C-m
fi

tmux attach -t $SESSION

