# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"
macchina
color_print "dust zellij btm fd http procs tree ytdl pastel"
color_print "ykman miniserve rg xh gping thefuck(fk) trip fzf networkQuality"
echo
date
