#!/bin/bash

set -euxo pipefail

docker build \
    -f infrastructure/statamic-nginx-base.Dockerfile \
    -t statamic-nginx-base \
    .

docker build \
    -f infrastructure/statamic-fpm-base.Dockerfile \
    -t statamic-fpm-base \
    .

