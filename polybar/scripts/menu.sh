#!/bin/bash

# Menu controller

POLYBAR_TOP_ID=/tmp/polybar-top-pid
POLYBAR_MENU_ITEM_COUNT=14
POLYBAR_MENU_ITEM_IDS=/tmp/polybar-menu-item-pids
POLYBAR_MENU_LOG=/tmp/polybar-menu.log

is_open() {
  [ -f $POLYBAR_MENU_ITEM_IDS ]
}

open() {
  is_open && return

  for i in $(seq 1 $POLYBAR_MENU_ITEM_COUNT); do
    polybar menu_item_$i >>$POLYBAR_MENU_LOG 2>&1 &
    echo $! >> $POLYBAR_MENU_ITEM_IDS
  done
}

close() {
  ! is_open && return

  while read item_pid; do
    polybar-msg -p $item_pid cmd quit >> $POLYBAR_MENU_LOG 2>&1
  done < $POLYBAR_MENU_ITEM_IDS

  rm $POLYBAR_MENU_ITEM_IDS
}

toggle() {
  ! is_open && open || close

  polybar-msg -p $(cat $POLYBAR_TOP_ID) hook menu 1
}

icon() {
  local color_base="%{F#ffffff}"
  local color_end="%{F-}"
  local ikon=" "

  is_open && ikon=" "
  echo "$color_base $ikon $color_end"
}

case "$1" in
  open)
    open;;
  close)
    close;;
  toggle)
    toggle;;
  icon)
    icon;;
  *)
    echo "Unknown option $1"
    echo "menu.sh <open|close|toggle|icon>"
esac
