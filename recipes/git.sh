alias gc='git commit -m'
alias ga='git add'
alias gs='git status'
alias glo='git log --oneline'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""
alias gpr='git pull --rebase'
alias grb='git rebase -i @{u}'

# Set git autocompletion
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
export GIT_PS1_SHOWDIRTYSTATE=true
