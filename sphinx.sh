gem install rawk

function stop_sphinx {
 ps -ef | grep search | rawk 'every {|line| puts line.cols[1] if line.cols[1] =~ /^\d/}' | xargs kill
}

