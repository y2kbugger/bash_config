#
#~/.bash_aliases
#
alias ls='ls --color=auto'
alias et='easytether connect'

#vim stuff
#default editor
export EDITOR='gvim -v'
#copy and paste via X gvim binary + sudo editing
function vim () {
if [ -a $1 ] && [ -z $2 ] && [ ! -w $1 ]
then
  sudoedit "$@"
else
  gvim -v "$@"
fi
}
alias vi='vim'

#easily reboot and shutdown
alias rb='systemctl reboot'
alias sd='systemctl poweroff'

#start vm
alias windows='vboxmanage startvm Windows'

#edit files using sudo vim
#export EDITOR=vim

#vim like shorthands for bash
alias :q='exit'

alias chrome='chromium'

#temporarily enable touchpad, leave click buttons on
function touchpad () {
        #synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0') #toggle
        synclient TouchpadOff=0
        sleep 4m
        synclient TouchpadOff=1
}
