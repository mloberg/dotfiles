# mkdir and cd into it
function mk {
  mkdir -p "$1" && cd $_
}

repo() {
  local repo="$1"
  dir="${SRC:-$HOME/src}/$(basename "$repo")"
  shift

  if [ -z "$repo" ]; then
    echo "usage: $0 <repo>" >&2
    exit 1
  fi

  [[ "$repo" != */* ]] && repo="${GITHUB_ORG:-articulate}/$repo"

  [ -d "$dir" ] || gh repo clone "$repo" "$dir" -- "$@"
  cd "$dir" || exit 1
}
