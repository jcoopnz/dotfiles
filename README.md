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
./setup.sh
```

This will:
- Install all Homebrew packages and apps from `Brewfile`
- Symlink all config files to their expected locations
- Configure macOS keyboard repeat and Dock auto-hide settings

`Brewfile` and `aliases.sh` each have a commented-out `WORK` section — uncomment it (and the matching bits) on a work machine before running `setup.sh`.

## Personalisation

After running `setup.sh`, update the following with your own details:

1. **Zsh theme git email** — Update the email address in `my-custom.zsh-theme` so the prompt shows the correct git account:
   ```bash
   if [[ "$email" == "me@email.com" ]]; then   # <- your git email
   ```

2. **Lazygit author colors** — Update your name and add collaborator names in `lazygit.yml`:
   ```yaml
   authorColors:
     "Your Name": green
     "friends": blue   # replace with a collaborator names
   ```

3. **Work environment variables** — Create `~/.work-env-vars.sh` with any secrets or env vars needed for work, then uncomment the `source ~/.work-env-vars.sh` line in `zshrc`.

## Fixing nvim

Sometimes you just need to start fresh. Leaving this here as a handy reference.

```bash
rm -rf ~/.config/nvim

rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
```
