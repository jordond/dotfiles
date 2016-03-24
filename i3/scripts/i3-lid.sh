#!/bin/bash

exec 1> >(logger -s -t "i3-lid") 2>&1

# Check if on battery power
ac_state=$(acpi -a | cut -d' ' -f3 | cut -d- -f1)
lid_state=$(cat /proc/acpi/button/lid/LID0/state 2>/dev/null | awk '{print $NF}')

if [ -z "$lid_state" -o "$lid_state" == "closed" ]; then
  echo "Lid has been closed"
  if [ "$ac_state" = "on" ]; then
    echo "Power is plugged in, do not suspend"
    exit 0
  else
    echo "On battery power it is time to suspend"
    systemctl suspend
  fi
else
  echo "Lid is open"
  exit 0
fi