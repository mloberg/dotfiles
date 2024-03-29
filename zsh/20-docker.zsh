# Advance > Docker CLI tools > User
export PATH="$HOME/.docker/bin:$PATH"

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
  state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null || true)
  [ "$state" == "false" ] && docker rm "$name"
}

# Work with local services via Docker Compose. `service help` for help
service() {
  case "$1" in
    ls|list)
      service config | yq e '.services | keys' -
      ;;
    start)
      service up -d "${@:2}"
      ;;
    stop)
      service rm -sfv "${@:2}"
      ;;
    status)
      if [ "$(service ps --status running -q "$2" 2>/dev/null)" == "" ]; then
        echo "$2 is stopped"
      else
        echo "$2 is running"
      fi
      ;;
    run)
      service exec "${@:2}"
      ;;
    port)
      # make sure the service is running
      [ "$(service ps --status running -q "$2" 2>/dev/null)" == "" ] && echo "$2 is not running" && return 1

      port="$3"
      # grab the first listed port if none given
      [ -z "$port" ] && port=$(service config | yq e ".services.$2.ports[0].target" -)

      service -- port "$2" "$port"
      ;;
    -h|--help|help|"")
      cat <<EOF
Wrapper around Docker Compose to work with local services like Redis, Postgres, and MySQL

    service list                        List available services
    service start <service>             Start a Service
    service stop <service>              Stop a service
    service status <service>            Is service running?
    service run <service> <command>     Run a command in the service container
    service port <service> [port]       Display the local port binding for the service
EOF
      ;;
    *)
      [ "$1" == "--" ] && shift
      docker-compose -f "$HOME/.services.yml" "$@"
      ;;
  esac
}

# shell wrappers for docker run commands
# Inspiration taken from: https://github.com/jessfraz/dotfiles/blob/master/.dockerfunc

godev() {
  [ -z "$GO_VERSION" ] && test -f go.mod && GO_VERSION=$(awk '/^go [0-9\.]/{print $2}' go.mod)
  docker run --rm -it \
    -v "${HOME}/.netrc:/root/.netrc" \
    -v "$(pwd):/app" \
    -w /app \
    mlo/golang:"${GO_VERSION:-1.14}" "$@"
}
