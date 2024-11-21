#!/bin/env sh

CURRENT_SESSION=$(tmux display-message -p -F "#{session_name}")
POPUP_SESSION=${CURRENT_SESSION}_popup
if [[ $CURRENT_SESSION =~ popup$ ]]; then
    tmux detach-client
else
    tmux popup -E "tmux attach -t $POPUP_SESSION || tmux new -s $POPUP_SESSION"
fi
