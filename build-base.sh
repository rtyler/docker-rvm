#!/usr/bin/env bash

set -x

source ./rubies

docker build -t ${IMAGE_TAG} .
