#!/bin/bash

# Run required programs
xfc4-power-manager
#gnome-settings-daemon &
nm-applet &
display-visor -f -l

# auto lock screen after 15 mins
xautolock -detectsleep \
  -time 1 -locker "i3-lock.sh" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'Screen will lock in 30 seconds'"

