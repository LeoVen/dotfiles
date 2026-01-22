# Profile zsh startup, along with `zprof` at the end of the file, set it to true
profile_zsh_init=false
if [ "$profile_zsh_init" = true ]; then
  zmodload zsh/zprof
fi

# Setup edit-command-line by using: Ctrl-X + Ctrl-E
export EDITOR="nvim"
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# XDG configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Linux
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
# MacOS
export PATH=$PATH:/opt/homebrew/bin
export PATH=/snap/bin/:$PATH
# Haskell
export PATH=$PATH:~/.ghcup/bin

# Customize prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/main-diamond.yaml)"

# Set the directory we want to store zinit plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
fi
if [ ! -d $ZINIT_HOME/.git ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

if [ command -v vivid &>/dev/null ]; then
  export LS_COLORS="$(vivid generate catppuccin-mocha)"
fi

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git
zinit snippet OMZP::golang
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::npm
# zinit snippet OMZP::nvm # This plugin is waaaay too slow on startup
zinit snippet OMZP::sudo
zinit snippet OMZP::tmux

# File completions
zinit ice as'completion'; zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

# Manual completions
mkdir -p ~/.zfunc
fpath+=~/.zfunc

# TODO: this needs to run only once
if ! [ -x "$(command -v rustup)" ]; then
  rustup completions zsh > ~/.zfunc/_rustup
fi

# Load completions
autoload -Uz compinit && compinit

if ! type kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell Integrations
eval "$(fzf --zsh)"
eval "$(tv init zsh)"

# tmux
if [[ $TMUX ]]; then
  alias clear='clear && tmux clear-history'
fi

# NVM
export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait lucid light-mode for lukechilds/zsh-nvm

# Rust
export CARGO_BUILD_TARGET_DIR=~/.target

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Flutter
export PATH="$HOME/develop/flutter/bin:$PATH"

# Aliases
alias dc="docker compose"
alias lg="lazygit"
alias ls="eza"
alias la="ls -lah"
alias gpap="git pull --all --prune"

# Removing Aliases
unalias gow

zsh_stats () {
  fc -l 2 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep --color=auto -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n20
}

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/leoven/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# OpenTofu
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/tofu tofu

# Profile zsh startup
# Keep this at the very end of the file
if [ "$profile_zsh_init" = true ]; then
  zprof
fi
