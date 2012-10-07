[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function find_rb_files {
  if [[ -z "$1" ]]
  then
    LOC='.'
  else
   LOC=$1
  fi 

  find "${LOC}" -name '*.rb'
}

alias rbs=find_rb_files
alias be="bundle exec"
alias bi="echo 'bundle install'; bundle install"
