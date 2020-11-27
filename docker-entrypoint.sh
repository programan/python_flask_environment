#!/bin/bash

set -eu

# docker run -e LOCAL_UID=1000 -e LOCAL_GID=1000

case "$OSTYPE" in
  linux*)
    USER_ID=${LOCAL_UID:-9001}
    GROUP_ID=${LOCAL_GID:-9001}
    USER_NAME=${LOCAL_USER_NAME:-dev}

    echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
    groupadd -g $GROUP_ID $USER_NAME
    useradd -u $USER_ID -g $GROUP_ID -m $USER_NAME
    # addgroup -g $GROUP_ID -S $USER_NAME
    # adduser -u $USER_ID -S -H -G $USER_NAME $USER_NAME
    export HOME=/home/${USER_NAME}
    exec /usr/sbin/gosu ${USER_NAME} "$@"
    ;;
  *)
    exec "$@"
    ;;
esac
