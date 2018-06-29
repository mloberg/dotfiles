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
