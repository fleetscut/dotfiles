#!/usr/bin/env bash

setSession(){
    local session=$1
    local name=$2
    local workdir=$3
    local command=$4

    # Create session if it doesnt exist
    if  ! tmux has -t=$session > /dev/null 2>&1; then
        tmux new -d -c $workdir -s $session -n $name

        if [[ -n $command ]]; then
            sleep 0.1
            tmux send -t $session:$name "$command" Enter
        fi
    fi

    tmux switchc -t $session
}

createWindow(){
    local session=$1
    local name=$2
    local workdir=$3
    local command=$4

    # Create window if it doesnt exist
    if ! tmux lsw -t $session | grep $name > /dev/null 2>&1; then
        tmux neww -d -c $workdir -t $session -n $name

        if [[ -n $command ]]; then
            sleep 0.1
            tmux send -t $session:$name "$command" Enter
        fi
    fi
}
