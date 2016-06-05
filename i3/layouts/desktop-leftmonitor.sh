#!/bin/sh
xrandr --output DVI-I-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-1 --off

sleep 1
sudo systemctl restart synergys@jordon.service
