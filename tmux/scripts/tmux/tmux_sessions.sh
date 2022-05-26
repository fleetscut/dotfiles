#!/usr/bin/env bash

SCRIPT_DIR=~/scripts/tmux/

source $SCRIPT_DIR/tmux-funcs.sh

if [[ $# -gt 0 ]]; then
    while [[ $# -gt 0 ]]; do
        case $1 in
            anitracker)
                setSession anitracker work ~/programming/projects/anitracker/ "echo test"
                createWindow anitracker client ~/programming/projects/anitracker/client "npm run serve"
                createWindow anitracker server ~/programming/projects/anitracker/server "npm run dev"
                shift
                ;;
            nvim)
                setSession nvim configs ~/.config/nvim "nvim"
                shift
                ;;
            dots)
                setSession dotfiles nvim ~/.dotfiles "nvim"
                shift
                ;;
            *)
                shift
                ;;
        esac
    done
else
    echo "Missing Arguments"
    exit 1
fi
