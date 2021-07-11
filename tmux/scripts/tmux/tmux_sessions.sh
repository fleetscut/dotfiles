#!/usr/bin/env bash

setSession(){
    local session=$1
    local name=$2
    local workdir=$3
    local command=$4

    local hasSession=''

    tmux has -t=$session > /dev/null 2>&1
    if [[ $? -eq 1 ]]; then
        tmux new -d -c $workdir -s $session -n $name

        if [[ -n $command ]]; then
            echo $command
        fi
    fi

    tmux switchc -t $session
}

createWindow(){
    local session=$1
    local name=$2
    local workdir=$3
    local command=$4

    tmux lsw -t $session | grep $name > /dev/null 2>&1
    if [[ $? -eq 1 ]]; then
        tmux neww -d -c $workdir -t $session -n $name

        if [[ -n $command ]]; then
            tmux send -t $session:$name "$command" Enter
        fi
    fi
}

if [[ $# -gt 0 ]]; then
    while [[ $# -gt 0 ]]; do
        case $1 in
            anitracker)
                setSession anitracker work ~/programming/projects/anitracker/
                createWindow anitracker client ~/programming/projects/anitracker/client "npm run serve"
                createWindow anitracker server ~/programming/projects/anitracker/server "npm run dev"
                shift
                ;;
            test)
                declare -A arr
                arr["work"]="nvim"
                arr["client"]="run client"
                arr["server"]="run server"

                for workspace in ${!arr[@]}; do
                    echo $workspace ${arr[$workspace]}
                done

                shift
                ;;
        esac
    done
else
    echo "Missing Arguments"
    exit 1
fi
