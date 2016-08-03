#!/usr/bin/env bash

set -x

source ./rubies

docker push ${IMAGE_TAG}:latest

for RUBY in "${RUBIES[@]}"; do
    echo "> Pushing ${IMAGE_TAG}:${RUBY}"
    docker push ${IMAGE_TAG}:${RUBY}
done;
