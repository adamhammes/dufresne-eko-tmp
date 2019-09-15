#!/bin/bash

set -euxo pipefail

docker-compose -f infrastructure/docker-compose.dev.yml "$@"
