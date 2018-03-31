# ~/.bash_aliases

# colorize output
alias ls='ls --color=always'
alias grep='grep --color'
alias pytest="pytest --color=yes"
# Use a long listing format
alias ll='ls -lA --color=always'
# Show hidden files
alias l.='ls -d .* --color=always'
# Recent Files
alias lrt='ls -lArt --color=always'
###
vim=nvim

# git (be conservative of what you put here)
alias gs='git status -s'
alias gg='git log --all --graph --decorate --oneline -n17 --date=relative'

# vim like shorthands for bash
alias q='exit'

# case insensitive locate
alias locate='locate -i '
