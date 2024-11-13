# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "${ZINIT_HOME}" ]]; then
  mkdir -p "$(dirname ${ZINIT_HOME})"
  git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi

source "${ZINIT_HOME}/zinit.zsh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit ice depth=1
# zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git

# Load autocompletions
autoload -U compinit && compinit
zinit cdreplay -q

# History Config
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=${HISTSIZE}
HISTDUP=erase
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"

setopt APPEND_HISTORY        # append to history file (Default)
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# zstyle ':completion:*' matcher-list 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export AWS_PAGER="less"


# Aliases
alias open="open_command"
alias nv="nvim"
alias ls="ls --color"
alias k="kubectl"
alias t="terraform"
alias tv="terraform validate"
alias ta="terraform apply"
alias ti="terraform init"
alias tiu="terraform init -upgrade"
alias tr="terrafirm refresh"
alias tv="terraform -version"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# FUNCTIONS
# AWS Vault for Terraform
function avt {
  profile=$1; shift
  aws-vault exec $profile -- terraform "$@";
}

# AWS Vault for AWS
function ava {
  profile=$1; shift
  aws-vault exec $profile -- aws "$@";
}

# AWS Vault for Kubectl
function avk {
  profile=$1; shift
  aws-vault exec $profile -- kubectl "$@";
}

# EKS CLI
function ave {
  profile=$1; shift
  aws-vault exec $profile -- eksctl "$@";
}

# Set Date
TODAY=$(date +'%d_%m_%Y')
DATE=$(date +%Y-%m-%d)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm use --silent default

# Exports
export EDITOR="nvim"

export JAVA_HOME=`/usr/libexec/java_home -v 17`

# Postgres - Money Lovers
export SVR_HOST="localhost"
export SVR_PORT="8080"
export DB_HOST="localhost" 
export DB_PORT="5432"
export DB_NAME="money_lovers"
export DB_USER="postgres"
export DB_ENABLED_SSL="disable"
export DB_PASSWD="secret"
export MONEY_LOVERS_DB='postgres://postgres:secret@localhost/money_lovers?sslmode=disable'

# zsh-completions

fpath=( /opt/homebrew/share/zsh/site-functions $fpath )
rm -f ${HOME}/.zcompdump
compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/olhernandez/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/olhernandez/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/olhernandez/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/olhernandez/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
