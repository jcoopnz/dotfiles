#!/bin/bash

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew packages
brew bundle --file=$(pwd)/Brewfile

# Symlink dotfiles
ln -s -f $(pwd)/zshrc         ~/.zshrc
ln -s -f $(pwd)/aliases.sh    ~/.aliases.sh
ln -s -f $(pwd)/my.zsh-theme  ~/.oh-my-zsh/themes/my.zsh-theme
touch ~/.hushlogin

# Neovim
mkdir -p ~/.config/nvim
ln -s -f $(pwd)/init.lua      ~/.config/nvim/init.lua

# Lazygit
mkdir -p ~/.config/lazygit
ln -s -f $(pwd)/lazygit.yml   ~/.config/lazygit/config.yml

# Ghostty
mkdir -p ~/.config/ghostty
ln -s -f $(pwd)/ghostty.config ~/.config/ghostty/config

# macOS settings
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

echo "Setup complete ✅"
