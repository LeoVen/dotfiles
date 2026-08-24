profile_zsh_init=false
if [ "$profile_zsh_init" = true ]; then
  zmodload zsh/zprof
fi

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/main-diamond.yaml)"

source "$XDG_CONFIG_HOME/zsh/plugins.zsh"
source "$XDG_CONFIG_HOME/zsh/completions.zsh"
source "$XDG_CONFIG_HOME/zsh/keybindings.zsh"
source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$XDG_CONFIG_HOME/zsh/functions.zsh"

# History
HISTSIZE=100000
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

# Shell integrations
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(tv init zsh)"

if [ "$profile_zsh_init" = true ]; then
  zprof
fi
