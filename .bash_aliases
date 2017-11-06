#~/.bash_aliases

# colorize output
alias ls='ls --color=always'
# Use a long listing format
alias ll='ls -lA --color=always'
# Show hidden files
alias l.='ls -d .* --color=always'
# Recent Files
alias lrt='ls -lArt --color=always'

# vim stuff
# default editor
export EDITOR='vim --servername vim'
alias vi='vim --servername vim'
alias vim='vim --servername vim'

# easily reboot and shutdown
alias rb='systemctl reboot'
alias sd='systemctl poweroff'
alias sus='systemctl suspend'

# for remote systems
function ssht () {
    '/usr/bin/ssh' -t $@ "tmux attach || tmux new";}
alias p182up='wol 00:1d:60:c9:44:b0'
alias p182rb='ssh y2k@192.168.1.210 "sudo systemctl reboot"'
alias p182sus='ssh y2k@192.168.1.210 "sudo systemctl suspend"'
alias p182ssh='ssht y2k@192.168.1.210'

alias itxs8rb='ssh y2k@192.168.1.228 -t "sudo systemctl reboot"'
alias itxs8sus='ssh y2k@192.168.1.228 -t "sudo systemctl suspend"'
alias itxs8ssh='ssht y2k@192.168.1.228'

alias 6pssh='ssht -p 8022 y2k@192.168.1.202'

# vim like shorthands for bash
alias q='exit'

# case insensitive locate
alias locate='locate -i '

# temporarily enable touchpad, leave click buttons on
function touchpad () {
        #synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0') #toggle
        synclient TouchpadOff=0
        sleep 4m
        synclient TouchpadOff=1
}

# alias for todo.sh and the corresponding match to autocomplete
source /usr/share/bash-completion/completions/todo.sh
alias t='todo.sh -t -c'
complete -F _todo t

# cute little mo0ocow
alias moo='figlet -f mini y2kbugger | cowthink -n -d'

# entering the matrix
function neo () {
    xterm -e '
        #sleep .1
        i3-msg fullscreen
        wakeupneo.py
        cmatrix'
}
