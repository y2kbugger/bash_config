#
# ~/.bashrc
#

# check if on windows
if [ -d /c ]; then
    win=true
    # Check that we haven't already been sourced.
    if [[ -z ${CYG_SYS_BASHRC} ]]; then
        CYG_SYS_BASHRC="1"
    else
        return
    fi
else
    win=false
fi

# If not running interactively, don't do anything
# old ways:
# [[ "$-" in *i* ]] && return
# [[ "${-#*i}" != "$-" ]] && return
# more robust interactivity checker in case "$-" is set to more than just "i".
# See
# https://www.gnu.org/software/bash/manual/html_node/Is-this-Shell-Interactive_003f.html
# and http://unix.stackexchange.com/questions/129231/what-does-i-mean
[[ $- != *i* ]] && return

# make prompt short on android
case ":$PATH:" in
  *com.termux*) PS1='[@pix2 \W]\$ ';;
  *) PS1='[\u@\h \W]
\$ ';;
esac

# Manually set the path to something succinct
if  [ ${win} = true ]; then
    pythonroot=/c/Users/zdkohler/AppData/Local/Continuum/floccrate
    PATH=$pythonroot:$pythonroot/Scripts:
    PATH=$PATH:/c/WINDOWS/system32:/c/WINDOWS
    PATH=/bin:$PATH
    PATH=/usr/bin:$PATH
    PATH=/mingw64/bin:$PATH
fi

# vim stuff
# default editor
export VISUAL='vim'
export EDITOR="$VISUAL"

# don't let pip work without using virtualenvs
export PIP_REQUIRE_VIRTUALENV=true

# preserving bash history across multiple ttys
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

HISTFILESIZE=-1
HISTSIZE=-1
HISTFILE=~/.bash_eternal_history

# blacklist some commands from history
HISTCONTROL=ignoredups
HISTIGNORE=$'[ \t]*' # starting with tab or spac
HISTIGNORE+=':&' # bg procs
HISTIGNORE+=':[fb]g'
HISTIGNORE+=':exit'
HISTIGNORE+=':q'
HISTIGNORE+=':ls'

# aliases
if [ -r ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -r ~/.bash_aliases_win ]; then
    . ~/.bash_aliases_win
fi

if [ -r ~/.bash_aliases_home ]; then
    . ~/.bash_aliases_home
fi

# colors for ls
if [ -r ~/.dir_colors ]; then
    eval "$(dircolors --bourne-shell ~/.dir_colors)"
fi

# enable layered glob echo ~/.vim/**/*.vim
shopt -s globstar

# git completion and cute PS1 DECO
if  [ ${win} = true ]; then
    . /etc/profile.d/git-prompt.sh
fi

# Fixup git-bash in non login env
# shopt -q login_shell || . /etc/profile.d/git-prompt.sh