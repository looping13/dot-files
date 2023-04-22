#!/usr/bin/bash

# refresh the archlinux mirror list in France from the mirrorlist.pacnew file
# run with root privileges
tput setaf 2
echo "Saving previous mirrorlist"
cp /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist.backup
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old

# uncomment the servers from France https
echo "Filter France https servers"
awk '/^## France$/{f=1; next}f==0{next}/^$/{exit}{print substr($0, 1);}' /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist1.backup
awk '/#Server = https:/' /etc/pacman.d/mirrorlist1.backup > /etc/pacman.d/mirrorlist2.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist2.backup

# sort the 10 fastest servers
tput setaf 3
echo "Ranking mirrors now. Be patient..."
rankmirrors -n 10 /etc/pacman.d/mirrorlist2.backup > /etc/pacman.d/mirrorlist1

# final words
rm -f /etc/pacman.d/mirrorlist*.backup
tput setaf 2
echo "Arch mirrors list from France was updated."
tput setaf 3
echo "Please run pacman -Syyu"
tput sgr0