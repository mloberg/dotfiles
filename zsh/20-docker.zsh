# Docker helper functions

docker-enter() {
  docker exec -it "$@" /bin/bash
}

docker-clean() {
  local containers
  containers=("${(@f)$(docker ps -aq 2>/dev/null)}")
  docker rm "${containers[@]}" 2>/dev/null
  local volumes
  volumes=("${(@f)$(docker ps --filter status=exited -q 2>/dev/null)}")
	docker rm -v "${volumes[@]}" 2>/dev/null
  local images
  images=("${(@f)$(docker images --filter dangling=true -q 2>/dev/null)}")
  docker rmi "${images[@]}" 2>/dev/null
}

del_stopped() {
  local name=$1
  local state
  state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

  if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}

# shell wrappers for docker run commands
# Inspiration taken from: https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc

redis() {
  del_stopped redis
  docker run -d \
    -p 6379:6379 \
    --name redis \
    redis:alpine redis-server --appendonly yes
}
alias redis-cli="docker exec -it redis redis-cli"

portainer() {
  del_stopped portainer
  docker run -d \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 9000:9000 \
    --name portainer \
    portainer/portainer -H unix:///var/run/docker.sock
  echo
  echo "Portainer started on http://localhost:9000"
}

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
