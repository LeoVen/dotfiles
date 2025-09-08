T := "~"

default:
    just --list

everything:
    just alacritty
    just lazygit
    just nvim
    just ohmyposh
    just tmux
    just zsh

remove:
    stow -t {{T}} -D alacritty
    stow -t {{T}} -D lazygit
    stow -t {{T}} -D nvim
    stow -t {{T}} -D ohmyposh
    stow -t {{T}} -D television
    stow -t {{T}} -D tmux
    stow -t {{T}} -D zhs

alacritty:
    stow -t {{T}} -S alacritty

lazygit:
    stow -t {{T}} -S lazygit

nvim:
    stow -t {{T}} -S nvim

ohmyposh:
    stow -t {{T}} -S ohmyposh

television:
    stow -t {{T}} -S television

tmux:
    stow -t {{T}} -S tmux

wezterm:
    stow -t {{T}} -S wezterm

yazi:
    stow -t {{T}} -S yazi

zhs:
    stow -t {{T}} -S zhs

