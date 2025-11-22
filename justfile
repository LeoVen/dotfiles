T := "~"

default:
    just --list

everything:
    just alacritty
    just ghostty
    just lazygit
    just nvim
    just ohmyposh
    just television
    just tmux
    just wezterm
    just yazi
    just zsh

remove:
    stow -t {{T}} -D alacritty
    stow -t {{T}} -D ghostty
    stow -t {{T}} -D lazygit
    stow -t {{T}} -D nvim
    stow -t {{T}} -D ohmyposh
    stow -t {{T}} -D television
    stow -t {{T}} -D tmux
    stow -t {{T}} -D wezterm
    stow -t {{T}} -D yazi
    stow -t {{T}} -D zsh

alacritty:
    stow -t {{T}} -S alacritty

ghostty:
    stow -t {{T}} -S ghostty

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

zsh:
    stow -t {{T}} -S zsh

