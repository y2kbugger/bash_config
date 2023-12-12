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

# git (be conservative of what you put here)
alias gs='git status -s'
alias gg='rows=$(stty size | cut -d" " -f1); git --no-pager log --all --graph --decorate --oneline --color=always | head -n $((rows - 3)) | tac | sed "s|\\\\|TEMP|g; s|/|\\\\|g; s|TEMP|/|g"'
alias gd='git diff --color-words'
alias gdd='git diff --cached --color-words'

# vim like shorthands for bash
alias q='exit'

# case insensitive locate
alias locate='locate -i '
