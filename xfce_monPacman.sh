#!/usr/bin/bash

listPackage=$(checkupdates | awk -F" " '{print $1,$3,$4}' | sort)
nbPackage=$(printf "%s" "$listPackage" | grep -c "^")

# the genmon
if [ $nbPackage -eq 0 ]
then
  echo "<txt><span fgcolor='Green'>󰏓 </span></txt>"
  echo "<tool>No package update available</tool>"
elif [ $nbPackage -eq 1 ]
then
  echo "<txt><span fgcolor='Red'>󰏔</span><span weight='Bold'> $nbPackage </span></txt>"
  echo "<tool>$nbPackage package update available"
  echo "$listPackage</tool>"
elif [ $nbPackage -gt 1 ]
then
  echo "<txt><span fgcolor='Red'>󰏔</span><span weight='Bold'> $nbPackage </span></txt>"
  echo "<tool>$nbPackage packages update available"
  echo "$listPackage</tool>"
fi
