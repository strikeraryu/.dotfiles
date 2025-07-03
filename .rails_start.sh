#!/bin/bash

# Create a new tmux session named 'my_session'
tmux new-session -d -s my_session

# Rename the first window
tmux rename-window -t my_session:1 'MainWindow'

# Split the window into four panes
tmux split-window -h -t my_session:1
tmux split-window -v -t my_session:1.1
tmux split-window -v -t my_session:1.3

# Run specific commands in each pane
tmux send-keys -t my_session:1.1 'rails s' C-m
tmux send-keys -t my_session:1.2 'rails c' C-m
tmux send-keys -t my_session:1.3 'yarn run dev' C-m
tmux send-keys -t my_session:1.4 '' C-m

# Attach to the tmux session
tmux attach-session -t my_session

