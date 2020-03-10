# shell wrappers for docker run commands
# Inspiration taken from: https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc

jekyll() {
  cache=
  test -f Gemfile && cache="-v $(pwd)/vendor/bundle:/usr/local/bundle"
  docker run --rm -it \
    -v "$(pwd):/srv/jekyll" "$cache" \
    -p 4000:4000 \
    jekyll/jekyll:"${JEKYLL_VERSION:-4.0}" \
    jekyll "$@"
}

godev() {
  [ -z "$GO_VERSION" ] && test -f go.mod && GO_VERSION=$(awk '/^go [0-9\.]/{print $2}' go.mod)
  docker run --rm -it \
    -v "${HOME}/.netrc:/root/.netrc" \
    -v "$(pwd):/app" \
    -w /app \
    mlo/golang:"${GO_VERSION:-1.14}" "$@"
}
