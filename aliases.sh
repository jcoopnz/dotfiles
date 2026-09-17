# General aliases
alias rl="source ~/.zshrc && echo 'Re-sourced config ✅'"
alias rc="n ~/.zshrc"
alias n="nvim"
alias lg="lazygit"
alias buu="brew update && brew upgrade && brew cleanup"

# lsport <port>
function lsport {
  readonly port=${1:?"Please provide port"}
  lsof -i tcp:"$port"
}
# killpid <pid>
function killpid {
  readonly pid=${1:?"Please provide PID"}
  kill -9 "$pid"
}

# PERSONAL ------------------------------------
# Raspberry Pi
alias rsp="ssh jordan@plexpi.local"

# # WORK ----------------------------------------
# alias wv="n ~/.work-env-vars.sh"
# alias bd="clear && npx nx build-dev"
# alias bw="clear && npx nx build-watch"
# alias sa="clear && npx nx serve-all"
