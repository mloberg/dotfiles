# Docker helper functions

function docker-enter() {
  docker exec -it "$@" /bin/bash
}

function docker-clean() {
  docker ps --filter status=exited -q | xargs docker rm --volumes
  docker images --filter dangling=true -q | xargs docker rmi
}

# dcg ls|list
# dcg status [service]
# dcg start [service]
# dcg stop [service]
# dcg run [service] [command]
function dcg() {
  local ACTION="$1"
  local SERVICE="$2"

  if [[ "$ACTION" == "ls" || "$ACTION" == "list" ]]; then
    docker-compose --file ~/.docker-compose.yml ps --services
    return
  fi

  if [[ -z "$ACTION" || -z "$SERVICE" ]]; then
    >&2 echo "Usage: dcg [start|stop|status|run] [service]"
    return 1
  fi

  case "$ACTION" in
    status)
      if docker-compose --file ~/.docker-compose.yml ps | grep "${SERVICE}" | grep -q Up; then
        echo "Service ${SERVICE} is running"
      else
        echo "Service ${SERVICE} is stopped"
      fi
      ;;
    start)
      docker-compose --file ~/.docker-compose.yml up -d "${SERVICE}"
      ;;
    stop)
      docker-compose --file ~/.docker-compose.yml rm -sfv "${SERVICE}"
      ;;
    run)
      docker-compose --file ~/.docker-compose.yml exec "${SERVICE}" "${3:-bash}"
      ;;
    purge)
      docker-compose --file ~/.docker-compose.yml down -v
      ;;
    *)
      >&2 echo "Usage: dcg [start|stop|status|run] [service]"
      return 1
      ;;
  esac
}

alias redis-cli="dcg run redis redis-cli"
alias portainer="(dcg status portainer | grep -q running || dcg start portainer) && open http://localhost:9000"
