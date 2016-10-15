function find_rb_files {
  if [[ -z "$1" ]]
  then
    LOC='.'
  else
   LOC=$1
  fi

  find "${LOC}" -name '*.rb'
}

source /usr/local/opt/chruby/share/chruby/chruby.sh

alias rbs=find_rb_files
alias be="bundle exec"
alias bi="echo 'bundle install'; bundle install"

function rgem {
  RUBY="
    STDIN.each do |line|
      line.scan(/^(\S+).\((\S+)\)$/).each {|g, v| puts \"gem '#{g}', '~> #{v}'\"}
    end
"
  gem list --remote $1 | ruby -e "$RUBY"
}

poly prompt ruby : pwd git -