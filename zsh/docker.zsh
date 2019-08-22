# Docker helper functions

function docker-enter() {
  docker exec -it "$@" /bin/bash
}

function docker-clean() {
  docker ps --filter status=exited -q | xargs docker rm --volumes
  docker images --filter dangling=true -q | xargs docker rmi
}

# service ls|list
# service status [service]
# service start [service]
# service stop [service]
# service run [service] [command]
function service() {
  local ACTION="$1"
  local SERVICE="$2"

  if [[ "$ACTION" == "ls" || "$ACTION" == "list" ]]; then
    docker-compose --file ~/.services.yml ps --services
    return
  fi

  if [[ -z "$ACTION" || -z "$SERVICE" ]]; then
    >&2 echo "Usage: service [start|stop|status|run] [service]"
    return 1
  fi

  case "$ACTION" in
    status)
      if docker-compose --file ~/.services.yml ps | grep "${SERVICE}" >/dev/null; then
        echo "Service ${SERVICE} is running"
      else
        echo "Service ${SERVICE} is stopped"
      fi
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

alias redis-cli="service run redis redis-cli"
alias portainer="(service status portainer | grep running >/dev/null || service start portainer) && open http://localhost:9000"
