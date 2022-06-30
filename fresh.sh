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

mkdir $HOME/.nvm

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Create a folder for extra configs
mkdir $HOME/Extra

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

mkdir $HOME/themes
ln -s $HOME/Extra/zsh-dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Connect hammerspoon
mkdir $HOME/.hammerspoon
mkdir $HOME/.hammerspoon/Spoons
mkdir $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon

ln -s $HOME/.dotfiles/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
ln -s $HOME/.dotfiles/hammerspoon/apps.lua $HOME/.hammerspoon/apps.lua
ln -s $HOME/.dotfiles/hammerspoon/Spoons/MiroWindowsManager.spoon/docs.json $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon/docs.json
ln -s $HOME/.dotfiles/hammerspoon/Spoons/MiroWindowsManager.spoon/init.lua $HOME/.hammerspoon/Spoons/MiroWindowsManager.spoon/init.lua

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
