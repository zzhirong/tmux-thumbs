#!/usr/bin/env bash

CURRENT_PANE_ID=$(tmux list-panes -F "#{pane_id}:#{?pane_active,active,nope}" | grep active | cut -d: -f1)
COMMAND="/home/ubuntu/dev/tmux-thumbs/target/debug/tmux-thumbs -a qwerty -r -u --tmux-pane ${CURRENT_PANE_ID}"

tmux new-window -d -n "[thumbs]" ${COMMAND}

NEW_PANE_ID=$(tmux list-panes -a | grep 0:3.1 | grep -o '%[0-9]\+')

tmux swap-pane -t ${NEW_PANE_ID}
