#!/bin/bash

set -e

for item in *; do
    if [ "$item" = ".git" ] || [ "$item" = "install.sh" ]; then
        continue
    fi
    if [ "$item" = ".tmux.conf" ]; then
        ln -sf "$PWD/$item" "$HOME/$item"
    elif [ "$item" = "bin" ]; then
        mkdir -p "$HOME/.mark"
        ln -sf "$PWD/$item" "$HOME/.mark/$item"
    else
        ln -sf "$PWD/$item" "$HOME/.config/$item"
    fi
done
