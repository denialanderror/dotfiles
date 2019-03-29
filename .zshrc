
### Added by Zplugin's installer
source '/Users/samjoseph/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin load zdharma/history-search-multi-word

zplugin ice compile"*.lzui"
zplugin load zdharma/zui
zplugin light zdharma/zplugin-crasis

# Binary release in archive, from Github-releases page; after automatic unpacking it provides command "fzf"
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# Used also `bpick' which selects Linux packages – in this case not needed, Zplugin
# automatically narrows down the releases by grepping uname etc.
zplugin ice from"gh-r" bpick"*linux*" as"program" mv"docker* -> docker-compose"; zplugin load docker/compose

# Scripts that are built at install (there's single default make target, "install", and
# it constructs scripts by cat-ting a few files). The make ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be default target
zplugin ice pick'$ZPFX/bin/git-*' as"program" make'PREFIX=$ZPFX'
zplugin light tj/git-extras

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-syntax-highlighting
zplugin light tysonwolker/iterm-tab-colors
zplugin light Tarrasch/zsh-bd
zplugin light cal2195/q 

zplugin ice blockf; zplugin light zsh-users/zsh-completions

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# This one to be ran just once, in interactive session
zplugin creinstall %HOME/.zsh/completion  # Handle completions without loading any plugin, see "clist" command

zplugin ice svn; zplugin snippet PZT::modules/git

zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::plugins/thefuck/thefuck.plugin.zsh

zplugin snippet https://github.com/Tarrasch/zsh-bd/blob/master/bd.zsh

zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
alias gst="git status"
alias gpu="git push -u"
alias gfu="git commit --all --amend --no-edit && git push --force-with-lease"
alias grom="git rebase origin/master"
alias gcom="git checkout master"
alias grh="git reset --hard"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mkdir="mkdir -p" # Automatically creates directories in path
alias cat="bat"
alias ping="prettyping --nolegend"
alias myip="curl ipecho.net/plain ; echo"
zplugin snippet OMZ::plugins/globalias/globalias.plugin.zsh
zplugin light MichaelAquilina/zsh-you-should-use

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Forces the delete key to work as expected
bindkey "[3~" delete-char

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_TIME_SHOW=true

printf "%s\n" $(http GET https://icanhazdadjoke.com/ Accept:application/json -b --timeout 2 | jq .joke) | cowthink -p | lolcat

export AWS_MFA_DEVICE=arn:aws:iam::323775272316:mfa/sam.joseph
export GOOGLE_APPLICATION_CREDENTIALS=/Users/samjoseph/.gcp/UkeView-998979501415.json
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/samjoseph/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/samjoseph/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/samjoseph/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/samjoseph/google-cloud-sdk/completion.zsh.inc'; fi
alias config='/usr/bin/git --git-dir=/Users/samjoseph/.cfg/ --work-tree=/Users/samjoseph'
