# This will lock your screen after 300 seconds of inactivity, then turn off
# your displays after another 300 seconds, and turn your screens back on when
# resumed. It will also lock your screen before your computer goes to sleep.
#
swayidle -w \
          timeout 300 "~/.config/sway/scripts/lock.sh" \
          timeout 600 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
          before-sleep "~/.config/sway/scripts/lock.sh" &

