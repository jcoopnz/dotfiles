#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
PROFILE="$1"

if [ -z "$PROFILE" ]; then
  echo "Usage: ./setup.sh <personal|work>"
  echo "Available profiles:"
  echo "  personal"
  echo "  work"
  exit 1
fi

if [ "$PROFILE" != "personal" ] && [ "$PROFILE" != "work" ]; then
  echo "Error: unknown profile '$PROFILE'"
  echo "Available profiles: personal, work"
  exit 1
fi

echo "Setting up with profile: $PROFILE"

# Install base + profile Homebrew packages
brew bundle --file="$DOTFILES_DIR/Brewfile"
if [ -f "$DOTFILES_DIR/Brewfile.$PROFILE" ]; then
  brew bundle --file="$DOTFILES_DIR/Brewfile.$PROFILE"
fi

# Symlink base dotfiles
ln -s -f "$DOTFILES_DIR/zshrc"                ~/.zshrc
ln -s -f "$DOTFILES_DIR/aliases.sh"           ~/.aliases.sh
ln -s -f "$DOTFILES_DIR/my-custom.zsh-theme"  ~/.oh-my-zsh/themes/my-custom.zsh-theme
touch ~/.hushlogin

# Symlink profile extensions
if [ -f "$DOTFILES_DIR/aliases.$PROFILE.sh" ]; then
  ln -s -f "$DOTFILES_DIR/aliases.$PROFILE.sh"  ~/.aliases-ext.sh
else
  rm -f ~/.aliases-ext.sh
fi
if [ -f "$DOTFILES_DIR/zshrc.$PROFILE.sh" ]; then
  ln -s -f "$DOTFILES_DIR/zshrc.$PROFILE.sh"  ~/.zshrc-ext.sh
else
  rm -f ~/.zshrc-ext.sh
fi

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

echo "Setup complete ✅ (profile: $PROFILE)"
