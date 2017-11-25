#!/bin/bash -xe

if [ -z "$1" ]; then
  BRANCH="master"
else
  BRANCH="$1"
fi

scp webapp/restart.sh isucon@localhost:webapp/restart.sh
ssh -A isucon@localhost /bin/bash webapp/restart.sh
