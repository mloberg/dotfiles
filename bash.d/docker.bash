#!/usr/bin/env bash

function docker-enter() {
  docker exec -it "$@" /bin/bash
}

function docker-clean() {
  docker ps --filter status=exited -q | xargs docker rm --volumes
  docker images --filter dangling=true -q | xargs docker rmi
}

function docker-compose-fresh() {
  local COMPOSE_FILE_PARAM=""
  if [ -n "$1" ]; then
    COMPOSE_FILE_PARAM="--file $1"
  fi

  docker-compose $COMPOSE_FILE_PARAM down
  docker-compose $COMPOSE_FILE_PARAM up -d
}

function services() {
  local ACTION=""
  local SERVICE="$2"

  case "$1" in
    start)
      ACTION="up -d"
      ;;
    stop)
      ACTION="rm -sfv"
      ;;
  esac

  if [[ -z "$ACTION" || -z "$SERVICE" ]]; then
    echo "Usage: services [start|stop] [service]"
    return 1
  fi

  docker-compose --file ~/.services.yml $ACTION $SERVICE
}

alias redis-cli="docker-compose --file ~/.services.yml exec redis redis-cli"

function jekyll() {
  tty=
  cache=
  tty -s && tty=--tty
  test -f Gemfile && cache="--volume $(pwd)/vendor/bundle:/usr/local/bundle"
  docker run $tty \
    --interactive \
    --rm \
    --volume $(pwd):/srv/jekyll $cache \
    --publish 4000:4000 \
    jekyll/jekyll:${JEKYLL_VERSION:-3.8} \
    jekyll "$@"
}
