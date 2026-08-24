ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
fi
if [ ! -d "$ZINIT_HOME/.git" ]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

if command -v vivid &>/dev/null; then
  export LS_COLORS="$(vivid generate catppuccin-mocha)"
fi

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

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

zinit wait lucid light-mode for lukechilds/zsh-nvm
