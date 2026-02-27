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

After running `setup.sh`, you'll need to edit a few things:

**Work environment variables** — Create `~/.work-env-vars.sh` and uncomment line 10 in `.zshrc` to source it.

**Zsh theme git emails** — Update the email addresses in `my.zsh-theme` so the prompt shows the correct git account:
```bash
if [[ "$email" == "work@email.com" ]]; then      # <- your work email
if [[ "$email" == "personal@email.com" ]]; then  # <- your personal email
```

**Lazygit author colors** — Add collaborator names in `lazygit.yml`:
```yaml
authorColors:
  "Colleague Name": blue  # replace "friends"
```

## Fixing nvim

Sometimes you just need to start fresh. Leaving this here as a handy reference.

```bash
rm -rf ~/.config/nvim

rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```
