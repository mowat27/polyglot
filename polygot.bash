RECIPES="${HOME}/.poly/recipes"
PROMPTS="${HOME}/.poly/prompts"

function usage {
  echo "Usage: polygot.bash command [args]" >&2
  echo "  commands:" >&2
  echo "    list" >&2
  echo "    load" >&2
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
  find $RECIPES -depth 1 -name '*.sh' -exec basename {} .sh \;
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
    load)
      for c in $@
      do
        load $c
      done
    ;;
    prompt)
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
    *)
      "poly : Unexpected command #{CMD}"
      usage
    ;;
  esac
fi
