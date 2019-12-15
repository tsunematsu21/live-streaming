#!/bin/sh

SSH_TMP_DIRECTORY="/tmp/.ssh"
SSH_DIRECTORY="/root/.ssh"

# Change SSH files permission if tmporary SSH directory exists
if [ -d "$SSH_TMP_DIRECTORY" ]; then
  cp -r "$SSH_TMP_DIRECTORY" "$SSH_DIRECTORY"
  chmod 700 "$SSH_DIRECTORY"
  chmod 600 "$SSH_DIRECTORY"/*
fi

exec "$@"
