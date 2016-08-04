#!/usr/bin/env bash

set -x

source ./rubies

if [ -n $1 ]; then
    RUBIES=( "${1}" )
fi;

for RUBY in "${RUBIES[@]}"; do
    echo "> Pushing ${IMAGE_TAG}:${RUBY}"
    docker push ${IMAGE_TAG}:${RUBY}
done;
