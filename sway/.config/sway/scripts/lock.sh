#!/usr/bin/env bash

# original_dir="$(pwd)"
#
# cd "$(dirname '$0')" || exit
#
# rm screen.png
# rm logo-ed_screen.png
# grim -t jpg screen.jpg
# image="$HOME/icons/tux.png"
# # ffmpeg -i screen.png -vf \
# #   "[in] gblur=sigma=$1  [blurred]; movie=$image [logo];
# #   [blurred][logo] overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2 [out]" \
# #   logo-ed_screen.png
# source "$HOME/.cache/wal/colors.sh"
kitty -c "" -T ss1 tmatrix &
pid1=$!
kitty -c "" -T ss2 tmatrix &
pid2=$!
kitty -c "" -T ss3 tmatrix &
pid3=$!

swaylock \
  --color 00000000 \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  # --key-hl-color "$color1" \
  # --bs-hl-color "$color2" \
  # --ring-color "$background" \
  # --ring-clear-color "$color2" \
  # --ring-wrong-color "$color5" \
  # --ring-ver-color "$color3" \
  --line-uses-ring \
  --line-color 00000000 \
  # --font 'NotoSans Nerd Font Mono:style=Thin,Regular 40' \
  --text-color 00000000 \
  --text-clear-color 00000000 \
  --text-wrong-color 00000000 \
  --text-ver-color 00000000 \
  --separator-color 00000000 \
  # --image "~/.config/sway/scripts/screen.png" \
  --daemonize

kill $pid1 & kill $pid2 & kill $pid3
