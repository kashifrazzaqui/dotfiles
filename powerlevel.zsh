
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_DIR_HOME_BACKGROUND='057'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='057'
POWERLEVEL9K_DIR_ETC_BACKGROUND='067'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='067'

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='white'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(iterm2 vi-mode jsontools python pip sudo colorize colored-man-pages gnu-utils virtualenv)

source ~/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/code/zsh/p10k.zsh.
[[ ! -f ~/code/zsh/p10k.zsh ]] || source ~/code/zsh/p10k.zsh
