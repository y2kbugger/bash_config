#
# ~/.bash_profile
#

PATH="${HOME}/bin:${PATH}"
PATH="${HOME}/.local/bin:${PATH}"

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx


# check if on windows
if [ -d /c ]; then
    win=true
else
    win=false
fi

if  [ ${win} = true ]; then
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval "$('/c/ProgramData/CooperConda/Scripts/conda.exe' 'shell.bash' 'hook')"
# <<< conda initialize <<<
fi

