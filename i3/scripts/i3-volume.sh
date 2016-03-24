#!/bin/bash

ACTION=$1

maxVolume=115
sinks=$(pactl list sinks | grep -e 'Sink' | sed 's/Sink #//')

function current() {
	current=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
}

function increase() {
	if [ "$current" -lt "$maxVolume"  ]; then
		for sink in $sinks
		do
			pactl set-sink-volume "$sink" +5%
			echo "[increase] Increased volume of sink #$sink by 5%"
		done
	else
		echo "[increase] Reached volume limit of $maxVolume"
	fi

	isMuted=$(pactl list sinks | grep "Mute: yes")
	if [[ -n "$isMuted" ]]; then
		echo "[increase] Unmuting sinks"
		mute
	fi
}

function decrease() {
	for sink in $sinks
	do
		pactl set-sink-volume "$sink" -5%
		echo "[decrease] Decreased volume of sink #$sink by 5%"
	done
}

isMuted="no"
function mute() {
	for sink in $sinks
	do
		pactl set-sink-mute "$sink" toggle
		echo "[mute] Toggling mute status of sink #$sink"
	done
	isMuted=$(pactl list sinks | grep -m 1 'Mute: ' | awk '{print $2}')
	echo "[mute] Is muted: $isMuted"
}

# Init, get current percent
exec 1> >(logger -s -t "i3-volume") 2>&1
current

case $ACTION in
	"-i" | "--increase")
				increase
				#notify-send 'Volume' "Current volume is $current%"
				;;
	"-d" | "--decrease")
				decrease
				#notify-send 'Volume' "Current volume is $current%"
				;;
	"-m" | "--mute")
				mute
				if [[ "$isMuted" = "yes" ]]; then
					notify-send 'Volume' "Muted"
				else
					notify-send 'Volume' "Unmuted"
				fi
				exit 0
				;;
	*)
	  echo "No action was provided"
	  echo "Usage:
       -i, --increase: Increase the volume (max: $maxVolume).
       -d, --decrease: Decrease the volume (min: 0).
       -m, --mute: Toggle the mute status"
	  exit 1;;
esac

echo "Volume is at $current%"
exit 0
