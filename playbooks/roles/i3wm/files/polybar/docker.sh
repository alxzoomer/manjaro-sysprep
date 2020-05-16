#!/bin/bash

DOCKER_PID=$(pgrep -x dockerd)

if [ -z "${DOCKER_PID}" ] ; then
  echo "Off"
else
  docker ps -q | wc -l
fi
