export DOTFILES=$HOME/code/dotfiles

. $DOTFILES/exports.zsh
. $DOTFILES/paths.zsh
. $DOTFILES/functions.zsh
. $DOTFILES/aliases.zsh
. $DOTFILES/history.zsh
. $DOTFILES/settings.zsh

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
macchina
# color_print "exa dust zellij speedtest atuin btm fd http procs tree ytdl ykman miniserve rg xh gping thefuck(fk) trip fzf"
date
# curl "wttr.in/Barnes?format=2"
