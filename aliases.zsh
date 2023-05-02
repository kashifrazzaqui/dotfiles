# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias s="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="exa -lh"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"


# Git
alias gitlog="git log --oneline --decorate --color"
alias gitamend="git commit --amend --no-edit"

# HG
alias hgci="hg commit --interactive"

#Misc

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias emu="./scripts/start_emulator"
alias z="vim $DOTFILES/.zshrc"
alias za="vim $DOTFILES/aliases.zsh"
alias zf="vim $DOTFILES/functions.zsh"
alias grephist='history|grep'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias vd='deactivate'
alias localip="ifconfig -l | xargs -n1 ipconfig getifaddr"
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myip='localip; ip'
alias hoistdost='hoist.py ~/fbo/fbobjc/Libraries/PortalXD/PortalXD ~/code/dost/Sources/dost ~/.hoist/fm_dost'
alias dev228="ssh devvm744.rva0.facebook.com"
alias tunnel="autossh -M 20000 -N  -L2224:devvm744.rva0.facebook.com:22 kashifr@devvm744.rva0.facebook.com -N"
alias ec2="ssh -i ~/.ssh/champion_rsa  ubuntu@ec2-54-166-62-236.compute-1.amazonaws.com"
alias es="exercism submit"
alias python=/usr/local/bin/python3


