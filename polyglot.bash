RECIPES="${HOME}/.poly/recipes"
PROMPTS="${HOME}/.poly/prompts"

function usage {
  echo "Usage: polygot.bash command [args]" >&2
  echo "  commands:" >&2
  echo "    list" >&2
  echo "    load" >&2
  echo "    prompt" >&2
  echo "" >&2
}

function load {
  CFG="${RECIPES}/${1}.sh"
  if [[ -f $CFG ]]
  then
    echo "poly : Loading $1"
    source $CFG
  else
    echo "poly : Error loading $1 - not recognised" >&2
  fi
}

function push_prompt {
  CFG="${PROMPTS}/${1}"
  PS1="${PS1}$(cat $CFG)"
}

function list {
  echo "Recipes"
  echo "-------"
  find $RECIPES -depth 1 -name '*.sh' -exec basename {} .sh \;
  echo ""
  echo "Prompts"
  echo "-------"
  find $PROMPTS -depth 1 -type f -exec basename {} .sh \;
  echo ""
}

if [[ $# -lt 1 ]]
then
  if [[ -f ./Polyfile ]]
  then
    source ./Polyfile
  else
    echo "No Polyfile found" >&2
  fi
else
  CMD=$1; shift
  case $CMD in
    list) list;;
    load | l)
      for c in $@
      do
        load $c
      done
    ;;
    prompt | p)
      if [[ -z "${@}" ]]
      then
        PS1='$ '
      else
        PS1=""
        for p in $@
        do
          push_prompt $p
        done
      fi
      ;;
    help)
      cat <<EOF
Polyglot is a simple framework for programmers who want to be able to 
switch between different langauages easily without having a really 
complicated .profile or .bashrc. It allows you to create simple little 
setup scripts for each lanaguage you use and then pull them into your 
current shell on-demand using a simple utility.

See https://github.com/mowat27/polyglot for more info.

EOF
      usage
    ;;
    *)
      echo "poly : Unexpected command $CMD" >&2
      echo "" >&2
      usage
    ;;
  esac
fi
