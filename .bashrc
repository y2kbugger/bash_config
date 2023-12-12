#
# ~/.bashrc
#
# check if on windows
if [ -d /c ]; then
    win=true
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

export PATH=$PATH:/home/y2k/bin
export PATH=$PATH:/home/y2k/.cargo/bin

# Allow symlinks, requires enabling developer mode in windows 10
if  [ ${win} = true ]; then
    export MSYS=winsymlinks:nativestrict
fi

# don't keep asking me "Always?"
export DOTNET_WATCH_RESTART_ON_RUDE_EDIT=1

# don't let pip work without using virtualenvs
if  [ ${win} = false ]; then
    export PIP_REQUIRE_VIRTUALENV=true
fi
# allow to overcome the above with pipdo !!
# todo check for conda env??? instead of win check???
function pipdo {
    case "$@" in
      *install*--user*)
        PIP_REQUIRE_VIRTUALENV=false $@
        ;;
      *install*)
        echo 'Remember to `pip install --user`'
        ;;
      *)
        PIP_REQUIRE_VIRTUALENV=false $@
        ;;
    esac
}

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

GIT_CEILING_DIRECTORIES=$HOME

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
    # . /etc/profile.d/git-prompt.sh
    # code below is a modified version of the script above
    PS1='\[\033]0;\w\007\]' # set window title y2k
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'\[\033[32m\]'       # change to green
    PS1="$PS1"'\u@\h '             # user@host<space>
    PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
    PS1="$PS1"'\w'                 # current working directory
    PS1="$PS1"'\[\033[0m\]'        # reset color
    PS1="$PS1"'\n'                 # new line
    PS1="$PS1"'$ '                 # prompt: always $
    MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
fi


if  [ ${win} = true ]; then
    eval "$('/c/ProgramData/CooperConda/Scripts/conda.exe' 'shell.bash' 'hook')"
fi
