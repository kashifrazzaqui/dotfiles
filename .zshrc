
export DOTFILES=$HOME/code/dotfiles

. $DOTFILES/exports.zsh
. $DOTFILES/paths.zsh
. $DOTFILES/powerlevel.zsh
. $DOTFILES/functions.zsh
. $DOTFILES/aliases.zsh
. $DOTFILES/history.zsh

eval "$(atuin init zsh)"
macchina
color_print "exa dust zellij speedtest atuin btm fd http procs tokei tree ytdl ykman miniserve rg xh gping"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
