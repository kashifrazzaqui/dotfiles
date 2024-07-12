export DOTFILES=$HOME/code/dotfiles

. $DOTFILES/zsh/exports.zsh
. $DOTFILES/zsh/paths.zsh
. $DOTFILES/zsh/functions.zsh
. $DOTFILES/zsh/aliases.zsh
. $DOTFILES/zsh/history.zsh
. $DOTFILES/zsh/settings.zsh
. $DOTFILES/zsh/incantation.zsh

eval "$(starship init zsh)"
eval "$(atuin init zsh)"
macchina
# color_print "exa dust zellij speedtest atuin btm fd http procs tree ytdl ykman miniserve rg xh gping thefuck(fk) trip fzf"
date
curl "wttr.in/Barnes?format=2"
