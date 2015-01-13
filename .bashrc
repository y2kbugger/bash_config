#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '

#preserving bash history accross multiple ttys
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
