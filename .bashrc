#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#ajouter le dossier home/.local/bin a la variable PATH
if [ -d "$HOME/.local/bin" ] ; then
PATH="$HOME/.local/bin:$PATH"
fi



#############
### ALIAS ###
#############

#youtube-dl
alias ydl720="youtube-dl -f 'best[height<=720]'+bestaudio -o '%(title)s.%(ext)s'"
alias update="sudo pacman -Syu"
alias TOS="/home/olivier/Talend/TOS_DI-20200219_1130-V7.3.1/TOS_DI-linux-gtk-x86_64 &"

alias tos="/home/olivier/Talend/TOS_DI-20200219_1130-V7.3.1/TOS_DI-linux-gtk-x86_64 &"
alias ssn="sudo shutdown now"

neofetch