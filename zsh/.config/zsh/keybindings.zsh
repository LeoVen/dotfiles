autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -e
bindkey '^X^E' edit-command-line
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
