#
# ~/.bash_profile
#

PATH="${HOME}/bin:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
