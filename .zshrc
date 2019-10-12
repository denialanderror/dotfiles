source .zsh_plugins
source .zsh_aliases

# load zsh completions
autoload -U compinit && compinit

# history configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY

# set dirs history and navigation
setopt AUTO_CD PUSHD_IGNORE_DUPS

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

# navi shell widget
source "$(navi widget zsh)"

# TODO:
# - tab expansion isn't working as expected, e.g. cd d/s<TAB> should expand to cd directory/sub-directory
# - missing a ton of aliases

###################
# Application-specific config. Move to new file?
###################
 
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
