if ! type pathmunge &>/dev/null; then
  # prevent duplicate directories in your PATH
  function pathmunge() {
    if ! [[ $PATH =~ (^|:)$1($|:) ]]; then
      export PATH=$1:$PATH
    fi
  }
fi
