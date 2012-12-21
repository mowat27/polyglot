alias gc='git commit -m'
alias ga='git add'
alias gs='git status'
alias glo='git log --oneline'
alias gl="git log --graph --pretty=\"format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset\""

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
export GIT_PS1_SHOWDIRTYSTATE=true

poly load git-prompt
PS1='\[\033[32m\]$(rvm current)\[\033[00m\]:\[\033[34m\]$(basename $PWD)\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
