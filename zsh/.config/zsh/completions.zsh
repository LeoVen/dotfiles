# fpath additions: must come before compinit
zinit ice as'completion'; zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

mkdir -p ~/.zfunc
fpath+=~/.zfunc

if command -v rustup >/dev/null 2>&1 && [ ! -f ~/.zfunc/_rustup ]; then
  rustup completions zsh > ~/.zfunc/_rustup
fi

FPATH="$HOME/.docker/completions:$FPATH"

autoload -Uz compinit && compinit

if type kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# OpenTofu
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/tofu tofu

