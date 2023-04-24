# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
echo "new tools: starship exa dust zellij"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle ':znap:*' repos-dir ~/code/znap
source ~/code/zsh-snap/znap.zsh

export DOTFILES=$HOME/code/dotfiles

. $DOTFILES/exports.zsh
. $DOTFILES/paths.zsh
. $HOME/code/zsh-snap/znap.zsh
. $DOTFILES/powerlevel.zsh
. $DOTFILES/functions.zsh
. $DOTFILES/aliases.zsh
. $DOTFILES/history.zsh


# Search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search


znap source marlonrichert/zsh-autocomplete
