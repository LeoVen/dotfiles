# XDG configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"

# Rust
export CARGO_BUILD_TARGET_DIR=~/.target
. "$HOME/.cargo/env"

# uv
export PATH="/Users/leoven/.local/share/../bin:$PATH"

## Homebrew
# Linux
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
# MacOS
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Haskell
export PATH="$PATH:~/.ghcup/bin"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Flutter
export PATH="$HOME/develop/flutter/bin:$PATH"

# libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# python
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"

# NVM
export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"

