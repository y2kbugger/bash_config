#
# ~/.bash_profile
#

PATH="$HOME/bin:$PATH"

# https://wiki.archlinux.org/index.php/SSH_keys#SSH_agents
# modified to work on busybox and be more robust
# also took some hints from the termux source-ssh-agent
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi
ssh-add -L
res=$?
case "$res" in
    2)
        ssh-agent > ~/.ssh-agent-thing
        eval "$(<~/.ssh-agent-thing)"
        ssh-add
    ;;
    0)
        echo "Already running; pid $SSH_AGENT_PID"
    ;;
esac

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
