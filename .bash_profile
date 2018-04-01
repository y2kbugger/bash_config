#
# ~/.bash_profile
#

PATH="$HOME/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
