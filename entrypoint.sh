#!/bin/bash
set -e

if [ "$1" = 'sipp' ]; then
  shift
  exec sipp "$@"
fi

exec "$@"