#  Shortcuts
FB_DEV_SERVER="devvm3489.lla0.facebook.com"
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias s="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="exa -lh"
alias ls="exa"
alias find="fd"

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
alias zc="vim $DOTFILES/zsh/zshrc"
alias za="vim $DOTFILES/zsh/aliases.zsh"
alias zf="vim $DOTFILES/zsh/functions.zsh"
alias grephist='history|grep'
alias venable='python3 -m venv ./venv'
alias vactivate='source ./venv/bin/activate'
alias vdeactivate='deactivate'
alias localip="ifconfig -l | xargs -n1 ipconfig getifaddr"
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias myip='localip; ip'
alias hoistdost='hoist.py ~/fbo/fbobjc/Libraries/PortalXD/PortalXD ~/code/dost/Sources/dost ~/.hoist/fm_dost'
alias dev114="ssh $FB_DEV_SERVER"
alias ec2="ssh -i ~/.ssh/champion_rsa  ubuntu@ec2-54-166-62-236.compute-1.amazonaws.com"
alias fk="thefuck"
alias stocks="ticker -w GME,MSTR,FBTC,TSM,NVDA,ASML,AMD,AMZN,ADBE,META,LLY,GOOG,NFLX,PG,ISRG,COST,FANUY,TER,MSFT,NIFTY,AAPL"
alias fzf='fzf --preview="bat --color=always {}"'
alias vimfzf='vim $(fzf -m --preview="bat --color=always {}")'
alias z="zoxide"
