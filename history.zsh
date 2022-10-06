
#set history size
export HISTSIZE=10000000
#save history after logout
export SAVEHIST=$HISTSIZE
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt inc_append_history
#save only one command if 2 common are same and consistent
setopt hist_ignore_dups
#add timestamp for each entry
setopt extended_history
setopt share_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
