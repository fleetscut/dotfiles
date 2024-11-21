#!/bin/env sh

CURRENT_SESSION=$(tmux display-message -p -F '#{session_name}')

if [[ ! $CURRENT_SESSION =~ popup$ ]]; then
    sesh connect "$(
        sesh list -i | grep -vE _popup$ |
        fzf-tmux -p 55%,60% \
            --no-sort --border-label ' sesh ' --prompt '⚡  ' \
            --header '  ^a all | ^t tmux | ^p popups | ^x zoxide | ^f find' \
            --bind 'tab:down,btab:up' \
            --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list | grep -vE popup$)' \
            --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t | grep -vE popup$)' \
            --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z)' \
            --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)'\
            --bind 'ctrl-p:change-prompt(🔎  )+reload(sesh list -t | grep -E popup$)'
    )"
fi
