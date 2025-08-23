
alias v='nvim'
alias l='ls -lha'
alias h='history'
alias rmf='rm -rvf'
alias c='clear'
alias smycshrc='source ~/.bashrc'
alias mycshrc='v ~/.bash_aliases

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[38;5;46m\]\u\[\e[0m\]@\[\e[38;5;45m\]\h\[\e[0m\][\w] \[\e[38;5;35;2m\]${PS1_CMD1}\n\[\e[0;38;5;202m\]\$\[\e[0m\] '
