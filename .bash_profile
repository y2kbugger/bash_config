#
# ~/.bash_profile
#

PATH="$HOME/bin:$PATH"

# https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents
# modified to work on busybox and be more robust
if ! ps aux | grep [s]sh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
    eval "$(<~/.ssh-agent-thing)"
    ssh-add
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
