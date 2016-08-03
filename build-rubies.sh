#!/usr/bin/env bash

set -x

source ./rubies

mkdir -p work

for RUBY in "${RUBIES[@]}"; do
    DOCKERFILE="work/dockerfile-${RUBY}"
    cat > $DOCKERFILE <<EOF
FROM ${IMAGE_TAG}:latest

RUN bash -c 'source ~/.rvm/scripts/rvm && rvm install ${RUBY}'
EOF

    echo "> Making ${IMAGE_TAG}:${RUBY}"
    docker build --tag="${IMAGE_TAG}:${RUBY}" --file="${DOCKERFILE}" work

    if [ -f "${DOCKERFILE}" ]; then
        rm -f $DOCKERFILE
    fi;
done;
