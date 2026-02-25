#!/usr/bin/env bash
# waybar-swap.sh
# Prints swap usage in percent and MB. Icon: 
read total used < <(awk '/SwapTotal/ {t=$2} /SwapFree/ {f=$2} END{print t, t-f}' /proc/meminfo)
if [ "$total" -eq 0 ]; then
  echo " N/A"
else
  percent=$(( 100 * used / total ))
  used_mb=$(awk "BEGIN{printf \"%.1f\", $used/1024}")
  total_mb=$(awk "BEGIN{printf \"%.1f\", $total/1024}")
  echo " $percent% $used_mb/$total_mb MiB"
fi
