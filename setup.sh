#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew packages
brew bundle --file="$DOTFILES_DIR/Brewfile"

# Symlink dotfiles
ln -s -f "$DOTFILES_DIR/zshrc"         ~/.zshrc
ln -s -f "$DOTFILES_DIR/aliases.sh"    ~/.aliases.sh
ln -s -f "$DOTFILES_DIR/my.zsh-theme"  ~/.oh-my-zsh/themes/my.zsh-theme
touch ~/.hushlogin

# Neovim
mkdir -p ~/.config/nvim
ln -s -f "$DOTFILES_DIR/init.lua"      ~/.config/nvim/init.lua

# Lazygit
mkdir -p ~/.config/lazygit
ln -s -f "$DOTFILES_DIR/lazygit.yml"   ~/.config/lazygit/config.yml

# Ghostty
mkdir -p ~/.config/ghostty
ln -s -f "$DOTFILES_DIR/ghostty.config" ~/.config/ghostty/config

# macOS settings
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Dock settings
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

echo "Setup complete ✅"
