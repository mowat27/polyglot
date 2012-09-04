function rails-new {
  if [[ -z $1 ]]
  then
    echo "Please supply a project name" >&2
    return 1
  elif [[ -d $1 ]]
  then
    echo "$1 already exists" >&2
    return 2
  fi 

  project_name=$1
  
  echo "Creating $project_name" 
  rails new $project_name -T -m https://raw.github.com/edgecase/ecrails_templates/master/rails_templates/ecuk_standard_app.rb
  [[  $? -eq 0 ]] || return 3  

  cd $project_name
  for d in models views helpers controllers
  do
    echo "Creating spec/$d"
    mkdir -p spec/$d
  done
  echo "Creating spec helper"
  touch spec/spec_helper.rb  
}

function restart {
#  [[ ! -z $(git remote) ]] && git pull origin
  bundle install && 
  bundle exec rake db:migrate db:test:prepare &&
  bundle exec rspec && 
  bundle exec rails s
}
