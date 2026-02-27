# Dotfiles

My development environment config for mac.

## What's Included

| File | Purpose |
|------|---------|
| `Brewfile` | Homebrew packages and applications |
| `ghostty.config` | Ghostty terminal configuration |
| `zshrc` | Zsh configuration with Oh My Zsh |
| `my.zsh-theme` | Custom Zsh prompt theme |
| `aliases.sh` | Shell aliases and helper functions |
| `init.lua` | Neovim configuration (lazy.nvim + plugins) |
| `lazygit.yml` | Lazygit configuration |

## Installation

```bash
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

This will:
- Install all Homebrew packages and apps from `Brewfile`
- Symlink all config files to their expected locations
- Configure macOS keyboard repeat and Dock auto-hide settings

## Manual Configuration

After running `setup.sh`, you'll need to edit these files:

### `~/.work-env-vars.sh`
Create this file. It's sourced by `.zshrc` (uncomment line 10 to enable).

### `~/.oh-my-zsh/themes/my.zsh-theme`
Update the email addresses for the git account indicator in your prompt:
```bash
if [[ "$email" == "work@email.com" ]]; then # replace email
if [[ "$email" == "personal@email.com" ]]; then # replace email
```

### `~/.config/lazygit/config.yml`
Add collaborator names for colored git authors:
```yaml
authorColors:
  "Colleague Name": blue  # replace "friends"
```

## Terminal

I use [Ghostty](https://ghostty.org) as my terminal. The config is included and symlinked automatically by `setup.sh`.

## Uninstalling Neovim

To completely remove Neovim and start fresh:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```
