#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#preserving bash history accross multiple ttys
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


#allow for copy and paste via x with beefyier vim binary
alias vim='gvim -v'
export EDITOR=vim
