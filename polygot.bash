POLYGOT_HOME="${HOME}/.poly"

function usage {
  echo "Usage: polygot.bash command [args]" >&2
  echo "  commands:" >&2
  echo "    list" >&2
  echo "    load" >&2
}

function load {
  CFG="${POLYGOT_HOME}/${1}.sh"
  if [[ -f $CFG ]]
  then
    echo "poly : Loading $1"
    source $CFG
  else
    echo "poly : Error loading $1 - not recognised" >&2
  fi
}

function list {
  find $POLYGOT_HOME -depth 1 -name '*.sh' -exec basename {} .sh \;
  echo ""
}

if [[ $# -lt 1 ]]
then
  usage
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
    *)
      "poly : Unexpected command #{CMD}"
      usage
    ;;
  esac
fi
