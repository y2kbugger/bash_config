#
# ~/.bash_profile
#

PATH="${PATH}:/home/y2k/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

