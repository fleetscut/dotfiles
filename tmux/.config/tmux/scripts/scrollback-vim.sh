#!/bin/bash

SCROLLBACK_FILE=$(mktemp)
SCROLLBACK_SIZE=32768
SCROLLBACK_NAME="edit"

tmux capture-pane -pS $SCROLLBACK_SIZE > $SCROLLBACK_FILE
tmux new-window -n $SCROLLBACK_NAME "nvim '+ normal G' $SCROLLBACK_FILE"
