#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# make prompt short on android
case ":$PATH:" in
  *com.termux*) PS1='[@6p \W]\$ ';;
  *) PS1='[\u@\h \W]\$ ';;
esac


#preserving bash history accross multiple ttys
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTFILE=~/.bash_eternal_history

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

test -r $d && eval "$(dircolors --bourne-shell ~/.dir_colors)"

# allow for reverse intelligent searching 'forward' with ctrl-s
stty -ixon

# enable layered glob echo ~/.vim/**/*.vim
shopt -s globstar

# Add ~/algs4/bin to the PATH
# export PATH=$PATH:$HOME/algs4/bin

# don't let pip work without using virtualenvs
export PIP_REQUIRE_VIRTUALENV=true
