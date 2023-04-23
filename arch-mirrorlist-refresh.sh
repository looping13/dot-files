#!/usr/bin/bash

# refresh the archlinux mirror list in France from the mirrorlist.pacnew file
# run with root privileges
tput setaf 2
echo "Saving a backup of previous mirrorlist. Using mirrolist.pacnew to update mirrors"
head --lines 4 /etc/pacman.d/mirrorlist.pacnew > /etc/pacman.d/mirrorlist.backup
BLAH=$(date -u +%Y-%m-%dT%H_%M_%S)
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist_$BLAH.old


# uncomment the servers from France https
echo "Filter France https servers"
awk '/^## France$/{f=1; next}f==0{next}/^$/{exit}{print substr($0, 1);}' /etc/pacman.d/mirrorlist.pacnew |
awk '/#Server = https:/' |
awk 'gsub(/^#Server/, "Server")' >> /etc/pacman.d/mirrorlist.backup

# sort the 10 fastest servers
tput setaf 3
echo "Ranking mirrors now. Be patient..."
rankmirrors -n 10 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

# final words
rm -f /etc/pacman.d/mirrorlist*.backup
tput setaf 2
echo "Arch https mirrors list from France was updated."
tput setaf 3
echo "Please run pacman -Syyu"
tput sgr0
