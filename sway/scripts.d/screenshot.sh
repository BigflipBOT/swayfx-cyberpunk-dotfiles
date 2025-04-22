#!/bin/bash

tmpfile=$(mktemp)
grim -g "$(slurp)" $tmpfile
name=$(date +%d-%m-%Y_%H:%M:%S).png
fullpath="$HOME/Pictures/Screenshots/$name"

option=$(printf "󰋯  copy\n󰠘  save as $name\n󱇤  edit\n" | wofi --dmenu --normal-window -c ~/.config/wofi/screenshotmenu)

case $option in

  "󰋯  copy")
    wl-copy < "$tmpfile"
    ;;

  "󰠘  save as $name")
    cat $tmpfile > $fullpath
    ;;

  "󱇤  edit")
    satty -f $tmpfile -o $HOME/Pictures/Screenshots/$(date +%d-%m-%Y_%H:%M:%S).png
    ;;

  *)
    echo -n "no op"
    ;;
esac
