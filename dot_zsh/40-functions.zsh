# mkdir and cd into it
mk() {
  mkdir -p "$1" && cd $_
}

bak() {
  [ -z "$1" ] && echo "Usage: $0 <file>" && return 1

  # if ends with .bak, remove it
  if [ "${1: -4}" == ".bak" ]; then
    mv "$1" "${1:0:-4}"
  elif [ -f "${1}.bak" ]; then
    mv "$1.bak" "$1"
  else
    mv "$1" "$1.bak"
  fi
}

repo() {
  local repo="$1"
  dir="${SRC:-$HOME/src}/$(basename "$repo")"
  shift

  if [ -z "$repo" ]; then
    echo "usage: $0 <repo>" >&2
    return 1
  fi

  [[ "$repo" != */* ]] && repo="${GITHUB_ORG:-articulate}/$repo"

  [ -d "$dir" ] || gh repo clone "$repo" "$dir" -- "$@"
  cd "$dir"
}
