# Set the directory we want to store zinit plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
fi
if [ ! -d $ZINIT_HOME/.git ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/snap/bin/:$PATH

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::npm
zinit snippet OMZP::terraform
zinit snippet OMZP::nvm

# File completions
zinit ice as'completion'; zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

# Manual completions
mkdir -p ~/.zfunc
fpath+=~/.zfunc

# TODO this needs to run only once
if ! [ -x "$(command -v rustup)" ]; then
  rustup completions zsh > ~/.zfunc/_rustup
fi

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Customize prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/main-diamond.yaml)"

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

# NVM
export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait lucid light-mode for lukechilds/zsh-nvm

export CARGO_BUILD_TARGET_DIR=~/.target

alias dc="docker compose"
alias lg="lazygit"
# alias ls="lsd"
alias ls="eza"
alias la="ls -lah"

