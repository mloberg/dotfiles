# shell wrappers for docker run commands
# Inspiration taken from: https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc

function aws() {
  docker run -it --rm \
    -v "${HOME}/.aws:/root/.aws" \
    -v "$(pwd):/tmp/data" \
    -w /tmp/data \
    --log-driver none \
    --name aws \
    jess/awscli --profile "${AWS_PROFILE:-default}" "$@"
}

function jekyll() {
  cache=
  test -f Gemfile && cache="--volume $(pwd)/vendor/bundle:/usr/local/bundle"
  docker run --rm -it \
    --volume "$(pwd):/srv/jekyll" "$cache" \
    --publish 4000:4000 \
    jekyll/jekyll:"${JEKYLL_VERSION:-3.8}" \
    jekyll "$@"
}
