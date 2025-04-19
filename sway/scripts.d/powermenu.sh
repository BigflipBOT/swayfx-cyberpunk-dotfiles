#!/bin/bash

option=$(printf "lock & hibernate\npoweroff\nreboot" | wofi --dmenu --normal-window -c ~/.config/wofi/powermenu)

case $option in

  "lock & hibernate")
    swaymsg reload # in case laptop monitor was turned off and while hibernation external one was unpluged
    ~/.config/sway/scripts.d/swaylock.sh
    systemctl hibernate
    ;;

  "poweroff")
    shutdown now
    ;;

  "reboot")
    reboot
    ;;

  *)
    echo -n "no op"
    ;;
esac
