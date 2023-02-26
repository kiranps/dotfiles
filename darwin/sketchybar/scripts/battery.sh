#!/bin/bash

get_battery() {
  local battery status
  battery="$(pmset -g batt)"
  BATTERY_LABEL="${battery%\%*}"
  BATTERY_LABEL="${BATTERY_LABEL##*	}"
  read -r _ _ _ status _ <<< "$battery"
  if [ "$status" = "AC" ]; then
    BATTERY_ICON="󰁽"
  else
    if [ "$battery_percentage" -gt 80 ]; then
    BATTERY_ICON="󰂁"
    elif [ "$battery_percentage" -gt 60 ]; then
    BATTERY_ICON="󰁿"
    elif [ "$battery_percentage" -gt 40 ]; then
    BATTERY_ICON="󰁽"
    elif [ "$battery_percentage" -gt 20 ]; then
    BATTERY_ICON="󰁽"
    else
    BATTERY_ICON="󰁽"
    fi
  fi
}

get_battery

sketchybar -m --set battery icon="$BATTERY_ICON" label="${BATTERY_LABEL}%"
