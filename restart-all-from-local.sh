#!/bin/bash -xe

if [ -z "$1" ]; then
  BRANCH="master"
else
  BRANCH="$1"
fi

scp restart.sh root@163.43.29.31:restart.sh
scp restart.sh root@59.106.209.101:restart.sh
scp restart.sh root@59.106.218.140:restart.sh
ssh -A root@163.43.29.31 /bin/bash restart.sh
ssh -A root@59.106.209.101 /bin/bash restart.sh
ssh -A root@59.106.218.140 /bin/bash restart.sh
