#
#~/.bash_aliases
#

# colorize output
alias ls='ls --color=always'
# Use a long listing format
alias ll='ls -lA --color=always'
# Show hidden files
alias l.='ls -d .* --color=always'

#quick way to tether to android phone
alias et='easytether connect'

##vim stuff
##default editor
#export EDITOR='gvim -v'
##copy and paste via X gvim binary + sudo editing
#function vim () {
#if [ -a $1 ] && [ -z $2 ] && [ ! -w $1 ]
#then
#  sudoedit "$@"
#else
#  gvim -v "$@"
#fi
#}
alias vi='vim'

#easily reboot and shutdown
alias rb='systemctl reboot'
alias sd='systemctl poweroff'

#start vm
alias windows='vboxmanage startvm Windows'

#vim like shorthands for bash
alias q='exit'

alias chrome='chromium'

#temporarily enable touchpad, leave click buttons on
function touchpad () {
        #synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0') #toggle
        synclient TouchpadOff=0
        sleep 4m
        synclient TouchpadOff=1
}

#alias for todo.sh and the corresponding match to autocomplete
source /usr/share/bash-completion/completions/todo.sh
alias t='todo.sh -t -c'
complete -F _todo t


#cute little mo0ocow
alias moo='figlet -f mini y2kbugger | cowthink -n -d'

#entering the matrix
function neo () {
    xterm -e '
        #sleep .1
        i3-msg fullscreen
        wakeupneo.py
        cmatrix'
}
