# fpath additions: must come before compinit
zinit ice as'completion'; zinit snippet https://raw.githubusercontent.com/rust-lang/cargo/master/src/etc/_cargo

mkdir -p ~/.zfunc
fpath=(~/.zfunc $fpath)

if command -v rustup >/dev/null 2>&1 && [ ! -f ~/.zfunc/_rustup ]; then
  rustup completions zsh > ~/.zfunc/_rustup
fi

fpath=("$HOME/.docker/completions" $fpath)

autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

if type kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi

if command -v xcodes >/dev/null 2>&1 && [ ! -f ~/.zfunc/_xcodes ]; then
  xcodes --generate-completion-script > ~/.zfunc/_xcodes
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

