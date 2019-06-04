source .zsh_plugins
source .zsh_aliases

# history configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# terminal/editor configuration
export VISUAL=vim
export EDITOR="$VISUAL"
SPACESHIP_TIME_SHOW=true
SPACESHIP_VI_MODE_SHOW=false
bindkey "[3~" delete-char

# dotfile management
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# vim mode
set -o vi
bindkey -v
bindkey "^R" history-search-multi-word
