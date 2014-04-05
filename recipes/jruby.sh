JRUBY_OPTS="--1.9"
export JRUBY_OPTS

alias tb='torquebox'

alias nruby='JRUBY_OPTS="$JRUBY_OPTS --ng" jruby $*'
alias nrspec='JRUBY_OPTS="$JRUBY_OPTS --ng" rspec $*'