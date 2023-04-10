#!/bin/bash
###################################
## Review - Modify - Run - Enjoy ##
###################################

echo "## Copying pacman hooks "
sudo mkdir /etc/pacman.d/hooks
sudo mv ~/Projects/dot-files/hooks/*.hook /etc/pacman.d/hooks	

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
