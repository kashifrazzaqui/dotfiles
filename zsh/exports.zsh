
export ZSH_DISABLE_COMPFIX='true'

# Path to your oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export WORKON_HOME=$HOME/.virtualenvs

# added by setup_fb4a.sh
export JAVA_11=/usr/local/java-runtime/11
export JAVA_8=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
export JAVA_HOME=$JAVA_8
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PUNT_CONFIG='~/.punt'
export DYLD_LIBRARY_PATH=/Users/kashifr/homebrew/lib:$DYLD_LIBRARY_PATH
export LDFLAGS="-L/Users/kashifr/homebrew/lib"
export CPPFLAGS="-I/Users/kashifr/homebrew/include"
export TOGGLE_LAST_DIR
export OPENAI_API_KEY=$(cat /Users/kashifr/code/dotfiles/keys/openapi-cli.key)
export LANGCHAIN_TRAVING_V2="true"
export LANGCHAIN_API_KEY=$OPENAI_API_KEY
export ANTHROPIC_API_KEY=$(cat /Users/kashifr/code/dotfiles/keys/claude-notebook.key)
