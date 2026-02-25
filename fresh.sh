#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

mkdir -p $HOME/.nvm

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Create a folder for extra configs
mkdir -p $HOME/Extra

# Clone Github repositories
./clone.sh

# Symlink .zshrc from the .dotfiles
ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc

mkdir -p $HOME/themes
ln -sf $HOME/Extra/zsh-dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme

ln -sf $HOME/.dotfiles/.claude $HOME/.claude

# Starship prompt config
mkdir -p $HOME/.config
ln -sf $HOME/.dotfiles/starship.toml $HOME/.config/starship.toml

# Connect Ghostty
mkdir -p $HOME/.config/ghostty
ln -sf $HOME/.dotfiles/ghostty/config $HOME/.config/ghostty/config

# Connect hammerspoon
mkdir -p $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon
ln -sf $HOME/.dotfiles/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -sf $HOME/.dotfiles/hammerspoon/apps.lua $HOME/.hammerspoon/apps.lua
ln -sf $HOME/.dotfiles/hammerspoon/Spoons/MiroWindowsManager.spoon/docs.json $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon/docs.json
ln -sf $HOME/.dotfiles/hammerspoon/Spoons/MiroWindowsManager.spoon/init.lua $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon/init.lua

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
