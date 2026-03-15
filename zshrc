export ZSH="$HOME/.oh-my-zsh"

# Update frequency (in days)
zstyle ":omz:update" frequency 5

ZSH_THEME="my-custom"

source $ZSH/oh-my-zsh.sh
source ~/.aliases.sh

# Better <C-r> for searching previously run commands
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Profile-specific config (symlinked by setup.sh)
[ -f ~/.zshrc-ext.sh ] && source ~/.zshrc-ext.sh
