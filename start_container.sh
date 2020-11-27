#!/bin/bash

set -x

# docker-compose run --rm --service-ports -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) app bash
docker-compose run --rm --user buhi --service-ports app bash
