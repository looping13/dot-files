#!/usr/bin/bash

listPackage=$(/usr/bin/checkupdates | awk -F" " '{print $1,$3,$4}' | sort)
nbPackage=$(printf "%s" "$listPackage" | grep -c "^")
TIME=$(date +%T)
# the genmon
if [ $nbPackage -eq 0 ]
then
  echo "<txt><span fgcolor='Yellow'>󰮯</span><span fgcolor='Green'>󰊠</span></txt>"
  echo "<tool>Last checked at $TIME"
  echo "No package update available</tool>"
elif [ $nbPackage -eq 1 ]
then
  echo "<txt><span fgcolor='Yellow'>󰮯</span><span fgcolor='Red'>󰊠 </span><span weight='Bold'> $nbPackage </span></txt>"
  echo "<tool>Last checked at $TIME"
  echo "$nbPackage package update available"
  echo "$listPackage</tool>"
elif [ $nbPackage -gt 1 ]
then
  echo "<txt><span fgcolor='Yellow'>󰮯</span><span fgcolor='Red'>󰊠 </span><span weight='Bold'> $nbPackage </span></txt>"
  echo "<tool>Last checked at $TIME"
  echo "$nbPackage packages update available"
  echo "$listPackage</tool>"
fi
 echo "<txtclick>xfce4-terminal --window --command=\"bash -c 'sudo pacman -Syyu; /usr/bin/xfce4-panel -r'\"</txtclick>"
 echo "<txtclick>/home/olivier/Projects/dot-files/xfce_genmonRefresh.sh</txtclick>"
##echo "<txtclick>gedit</txtclick>"
