#!/usr/bin/env bash

set -x

source ./rubies

for RUBY in "${RUBIES[@]}"; do
    echo "> Pushing ${IMAGE_TAG}:${RUBY}"
    docker push ${IMAGE_TAG}:${RUBY}
done;
