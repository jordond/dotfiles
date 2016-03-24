#!/bin/bash

BATTERY=0
BATTERY_INFO=$(acpi -b | grep "Battery ${BATTERY}")
BATTERY_STATE=$(echo "${BATTERY_INFO}" | grep -wo "Full\|Charging\|Discharging")
BATTERY_POWER=$(echo "${BATTERY_INFO}" | grep -o '[0-9]\+%' | tr -d '%')

REMAINING=$(acpi -b | awk '{print $5}' | cut -b -5)

URGENT_VALUE=5

icon=""

function getIcon() {
  if [[ "$BATTERY_STATE" = "Full" ]]; then
    icon=""
  elif [[ $BATTERY_POWER -lt 10 ]]; then
    icon=""
  elif [[ $BATTERY_POWER -lt 25 ]]; then
    icon=""
  elif [[ $BATTERY_POWER -lt 50 ]]; then
    icon=""
  elif [[ $BATTERY_POWER -lt 75 ]]; then
    icon=""
  elif [[ $BATTERY_POWER -lt 100 ]]; then
    icon=""
  fi
}

getIcon

if [[ "${BATTERY_STATE}" = "Charging" ]]; then
  echo "⚡ ${icon}  ${BATTERY_POWER}% (${REMAINING})"
  echo "+${BATTERY_POWER}%"
elif [[ "${BATTERY_STATE}" = "Discharging" ]]; then
  echo "${icon}  ${BATTERY_POWER}% (${REMAINING})"
  echo "${BATTERY_POWER}%"

  if [[ $BATTERY_POWER -lt 15 ]]; then
      echo "#E53935"
  elif [[ $BATTERY_POWER -lt 30 ]]; then
      echo "#F5AB35"
  fi

else
  echo "${icon} ${BATTERY_POWER}%"
  echo "${BATTERY_POWER}%"
fi

if [[ "${BATTERY_POWER}" -le "${URGENT_VALUE}" ]]; then
  exit 33
fi