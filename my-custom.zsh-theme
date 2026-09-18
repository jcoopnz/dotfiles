# Function to get Node.js version
current_node_version() {
  if command -v node &> /dev/null; then
    echo "$(node -v)"
  else
    echo "n/a"
  fi
}

# Function to determine current git account
current_git_account() {
  if [[ "$(git config user.email)" == "personal@email.com" ]]; then
    echo "personal"
  else
    echo "UNKNOWN GIT ACC"
  fi
}

PROMPT="%B%F{cyan}%c %f%b"
PROMPT+='$(git_prompt_info)' # styles in the section below

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{blue}|🌝"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{blue}|🌚"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{cyan}:%f%b "

RPROMPT='%F{blue}n:%F{yellow}$(current_node_version)%F{blue} |%f '
RPROMPT+='%F{yellow}$(current_git_account)%f'
