#!/bin/env bash

# grep state /proc/acpi/button/lid/LID0/state                                                                                          00:48
# grep -q open /proc/acpi/button/lid/LID0/state                                                                                          00:48
# swaymsg -t get_outputs | grep name                                                                                                   00:49

workspaces=( $(swaymsg -t get_workspaces | jq '.[] | select(.name|test("0-.")) | .name') )

close () {
    dunstify "Clamshell mode" "Laptop screen off"
    for i in ${workspaces[@]}; do
        swaymsg [workspace=$i] move workspace to output "DP-2"
    done
    swaymsg "output eDP-1 disable"
}

open () { dunstify "Clamshell mode" "Laptop screen on"
    swaymsg "output eDP-1 enable"
    for i in ${workspaces[@]}; do
        swaymsg [workspace=$i] move workspace to output "eDP-1"
    done
}

"$1"
