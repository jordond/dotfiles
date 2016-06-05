#!/bin/sh
xrandr --output DVI-I-1 --primary --mode 1680x1050 --pos 1920x80 --rotate normal --output HDMI-1 --mode 1920x1200 --pos 0x0 --rotate normal

sleep 1
sudo systemctl restart synergys@jordon.service

