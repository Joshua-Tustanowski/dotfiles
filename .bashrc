#!/bin/bash

# Enable tab completion
export GIT_PATH="$HOME/dotfiles/git"
source "$GIT_PATH/git-completion.bash"

#aliases
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias h=history
alias python=python3
alias ls='ls -lGH'

# colours
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"
yellow="\[\033[0;33m\]"
Red="\[\033[0;31m\]"
UCyan="\[\033[4;36m\]"
Cyan="\[\033[0;36m\]"
On_Yellow="\[\033[43m\]"


# PATH details
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/Users/josh/Library/Python/3.8/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# FLAG details
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export CPPFLAGS="-I/usr/local/opt/libffi/include"
export PATH="/usr/local/opt/cython/bin:$PATH"

# Change command prompt
source "$GIT_PATH/git-prompt.sh"
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$Cyan \A $yellow\u$Red \w $ $green\$(__git_ps1) $reset $Cyan\n > "

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

export NVM_DIR="$HOME/dotfiles/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/sbin:$PATH"
