#!/usr/bin/env bash

set -x

source ./rubies
exec docker push ${IMAGE_TAG}:latest
