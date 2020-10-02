#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

. $(brew --prefix asdf)/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

export ZSH_CONF=$HOME/.zsh
export ZSH_CACHE=$ZSH_CONF/cache
export ZSH_COMPDUMP="${ZSH_CACHE}/.zcompdump-${(%):-%m}-${ZSH_VERSION}"

autoload -Uz compinit && \
   compinit -C -d $ZSH_COMPDUMP

source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  echo "Initializing..."

  zgen load romkatv/powerlevel10k powerlevel10k
  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/cp
  zgen oh-my-zsh plugins/sublime
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/fd
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/safe-paste
  zgen oh-my-zsh plugins/redis-cli
  zgen oh-my-zsh plugins/nomad
  zgen load unixorn/fzf-zsh-plugin

  zgen save
fi

source $ZSH_CONF/history.zsh
source $ZSH_CONF/functions.zsh
source $ZSH_CONF/alias.zsh
source $ZSH_CONF/sources.zsh
source $ZSH_CONF/exports.zsh
source $ZSH_CONF/eval.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
