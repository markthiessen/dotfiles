#!/bin/sh

echo "Cloning repositories..."

EXTRA=$HOME/Extra

# Theme
git clone https://github.com/dracula/zsh.git $EXTRA/zsh-dracula

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.dotfiles}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$HOME/.dotfiles}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-$HOME/.dotfiles}/plugins/zsh-completions
