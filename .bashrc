#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '

#preserving bash history accross multiple ttys
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTFILE=~/.bash_eternal_history

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#allow for reverse intelligent searching 'forward' with ctrl-s
stty -ixon

