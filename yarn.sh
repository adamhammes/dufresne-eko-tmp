#!/bin/bash

set -euxo pipefail

yarn --cwd statamic/site/themes/dufresnes/ "$@"
