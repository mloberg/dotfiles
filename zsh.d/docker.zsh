# Docker helper functions

function docker-enter() {
  docker exec -it "$@" /bin/bash
}

function docker-clean() {
  docker ps --filter status=exited -q | xargs docker rm --volumes
  docker images --filter dangling=true -q | xargs docker rmi
}

# dockter ls
# dockter status redis
# dockter start portainer
# dockter stop mysql
# dockter run redis redis-cli
function dockter() {
  local ACTION="$1"
  local SERVICE="$2"

  if [ "$ACTION" == "ls" ]; then
    docker-compose --file ~/.services.yml ps --services
    return
  fi

  if [[ -z "$ACTION" || -z "$SERVICE" ]]; then
    >&2 echo "Usage: dockter [start|stop|status|run] [service]"
    return 1
  fi

  case "$ACTION" in
    status)
      _dockter-status "${SERVICE}"
      ;;
    start)
      docker-compose --file ~/.services.yml up -d "${SERVICE}"
      ;;
    stop)
      docker-compose --file ~/.services.yml rm -sfv "${SERVICE}"
      ;;
    run)
      docker-compose --file ~/.services.yml exec "${SERVICE}" "${3:-bash}"
      ;;
    *)
      >&2 echo "Usage: dockter [start|stop|status|run] [service]"
      return 1
      ;;
  esac
}

function _dockter-status() {
  if docker-compose --file ~/.services.yml ps | grep "$1" >/dev/null; then
    echo "Service ${1} is running"
  else
    echo "Service ${1} is stopped"
  fi
}

alias redis-cli="dockter run redis redis-cli"
alias portainer="(dockter status portainer | grep running >/dev/null || dockter start portainer) && open http://localhost:9000"
