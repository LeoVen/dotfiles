T := "~"

default:
    just --list

sync package:
    stow -t {{T}} -S {{package}}

remove package:
    stow -t {{T}} -D {{package}}

