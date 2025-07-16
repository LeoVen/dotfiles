T=~

up: alacritty lazygit nvim ohmyposh tmux zsh

down:
	stow -t $T -D alacritty
	stow -t $T -D lazygit
	stow -t $T -D nvim
	stow -t $T -D ohmyposh
	stow -t $T -D tmux
	stow -t $T -D zsh

alacritty:
	stow -t $T -S alacritty

lazygit:
	stow -t $T -S lazygit

nvim:
	stow -t $T -S nvim

ohmyposh:
	stow -t $T -S ohmyposh

television:
	stow -t $T -S television

tmux:
	stow -t $T -S tmux

zsh:
	stow -t $T -S zsh

.PHONY: up down alacritty lazygit nvim ohmyposh television tmux zsh
