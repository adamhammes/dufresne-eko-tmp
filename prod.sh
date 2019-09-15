#!/bin/bash

set -euxo pipefail

docker-compose -f infrastructure/docker-compose.prod.yml "$@"
