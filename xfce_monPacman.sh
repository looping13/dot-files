#!/usr/bin/bash

listPackage=$(checkupdates -n | awk -F" " '{print $1}' | sort)
nbPackage=$($listPackage | wc -l)

echo $nbPackage "package update available" ; echo ${listPackage}
