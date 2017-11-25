#!/bin/bash -xe
ssh -A root@59.106.219.75 /usr/bin/pt-query-digest /var/log/mysql/slow.log
