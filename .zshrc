# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit

# History Config
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

export AWS_PAGER="less"

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

# Scripts
function avs {
  profile=$1; shift
  aws-vault exec $profile -- "$@";
}

# Aliases
alias open="open_command"
alias nv="nvim"

# LunarVim
export PATH=/Users/olhernandez/.local/bin:$PATH


# Set Date
TODAY=$(date +'%d_%m_%Y')
DATE=$(date +%Y-%m-%d)

# Add autocompletion for commands
source /opt/homebrew/share/zsh/site-functions/*
export HOMEBREW_NO_AUTO_UPDATE=1

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm use --silent default

source virtualenvwrapper.sh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# RBENV
eval "$(rbenv init - zsh)"

# # Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export EDITOR="nvim"
