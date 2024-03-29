#!/usr/bin/env bash
swaymsg -t get_tree |
 jq -r '.nodes[].nodes[] | if .nodes then [recurse(.nodes[])] else [] end + .floating_nodes | .[] | select(.nodes==[]) | ((.id | tostring) + " " + .name)' |
 wofi --show dmenu | {
   read -r id name
    echo $id
   swaymsg "[con_id=$id]" focus
}

