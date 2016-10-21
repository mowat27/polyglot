function find_rb_files {
  if [[ -z "$1" ]]
  then
    LOC='.'
  else
   LOC=$1
  fi

  find "${LOC}" -name '*.rb'
}

function rgem {
  RUBY="
  STDIN.each do |line|
  line.scan(/^(\S+).\((\S+)\)$/).each {|g, v| puts \"gem '#{g}', '~> #{v}'\"}
  end
  "
  gem list --remote $1 | ruby -e "$RUBY"
}

alias rbs=find_rb_files
alias be="bundle exec"
alias bi="echo 'bundle install'; bundle install"
