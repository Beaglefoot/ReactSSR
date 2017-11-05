SESSION_NAME="dev"
WINDOW_NAME="ReactSSR"
WORKING_DIR="$PWD"

tmux new-session -d -s $SESSION_NAME
tmux rename-window $WINDOW_NAME
tmux send-keys "cd $WORKING_DIR" C-m
tmux send-keys "npm run dev:server" C-m

tmux split-window -h
tmux send-keys "cd $WORKING_DIR" C-m
tmux send-keys "npm run dev:build-server" C-m

tmux split-window -v
tmux send-keys "cd $WORKING_DIR" C-m
tmux send-keys "npm run dev:build-client" C-m

tmux split-window -v -t {bottom}
tmux send-keys "cd $WORKING_DIR" C-m

tmux attach -t $SESSION_NAME
