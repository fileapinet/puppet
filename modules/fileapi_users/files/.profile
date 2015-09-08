if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

git config --global color.ui true
alias gs="git status"
alias gsh="git show"
alias gch="git checkout"
alias gl="git log --no-merges --pretty=format:'%Cred%h%Creset  %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset'"
alias gl2="git log --pretty=format:'%Cred%h%Creset %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gl3="git log --no-merges --pretty=format:'%Cred%h%Creset  %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch"
alias gputb='git pull upstream `thisbranch`'
alias thisbranch="git branch | awk '/^\* (.+)/ { print $1 }' | sed 's/\* //'"
alias thiscommit="git rev-parse HEAD"

alias ll="ls -opgh"
alias composer="php composer.phar"
