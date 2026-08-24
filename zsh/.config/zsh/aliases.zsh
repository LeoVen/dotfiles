alias dc="docker compose"
alias lg="lazygit"
alias ls="eza"
alias la="ls -lah"
alias gpap="git pull --all --prune"
alias k="kubectl"

unalias gow

if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi
