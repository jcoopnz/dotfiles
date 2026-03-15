# Dotfiles

My development environment config for mac.

## What's Included

| File | Purpose |
|------|---------|
| `Brewfile` | Homebrew packages and applications |
| `ghostty.config` | Ghostty terminal configuration |
| `zshrc` | Zsh configuration with Oh My Zsh |
| `my-custom.zsh-theme` | Custom Zsh prompt theme |
| `aliases.sh` | Shell aliases and helper functions |
| `init.lua` | Neovim configuration (lazy.nvim + plugins) |
| `lazygit.yml` | Lazygit configuration |

## Prerequisites

Install these manually before running `setup.sh`:

1. **Homebrew** — https://brew.sh
2. **git** — `brew install git`
3. **Oh My Zsh** — https://ohmyz.sh (sourced in `zshrc`)
4. **Node.js** — https://nodejs.org (nvm is bundled with node and sourced in `zshrc`)

## Installation

```bash
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
chmod +x setup.sh
./setup.sh <personal|work>
```

This will:
- Install all Homebrew packages and apps from `Brewfile` (plus any profile-specific ones)
- Symlink all config files to their expected locations (plus any profile-specific config)
- Configure macOS keyboard repeat and Dock auto-hide settings

## Personalisation

After running `setup.sh`, update the following with your own details:

1. **Zsh theme git emails** — Update the email addresses in `my-custom.zsh-theme` so the prompt shows the correct git account:
   ```bash
   if [[ "$email" == "work@email.com" ]]; then      # <- your work email
   if [[ "$email" == "personal@email.com" ]]; then   # <- your personal email
   ```

2. **Lazygit author colors** — Update your name and add collaborator names in `lazygit.yml`:
   ```yaml
   authorColors:
     "Your Name": green
     "Colleague Name": blue   # replace "friends"
   ```

3. **Work environment variables** _(work profile only)_ — Create `~/.work-env-vars.sh` with any secrets or env vars needed for work. This is sourced automatically by `zshrc.work.sh`.

## Fixing nvim

Sometimes you just need to start fresh. Leaving this here as a handy reference.

```bash
rm -rf ~/.config/nvim

rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```
