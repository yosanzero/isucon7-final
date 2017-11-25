#!/bin/bash

if [ -z "$1" ]; then
  BRANCH="master"
else
  BRANCH="$1"
fi

echo "Branch: ${BRANCH}"

set -e
cd /home/isucon/webapp/nodejs

# force pull
git fetch origin
git reset --hard origin/${BRANCH}

# build
# sudo chmod -R 777 /home/isucon/webapp/react/public/
# (cd nodejs && npm install && npm cache clean)
# (cd nodejs && MYSQL_HOST=172.29.2.63 node init.js)
# (cd react && npm install && npm cache clean && NODE_ENV=production npm run build)

# copy config
sudo cp etc/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp etc/nginx/sites-enabled/cco.nginx.conf /etc/nginx/sites-enabled/cco.nginx.conf
# sudo cp etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
# sudo cp etc/redis/redis.conf /etc/redis/redis.conf
# sudo cp nodejs/nodejs.service /etc/systemd/system/
# sudo cp react/react.service /etc/systemd/system/

# restart all service
sudo systemctl daemon-reload
sudo systemctl start cco.nodejs.service
# sudo systemctl restart mysql
# sudo systemctl restart redis-server
# sudo systemctl restart react
sudo systemctl restart nginx

# echo "" | sudo tee /var/log/mysql/slow.log
echo "" | sudo tee /var/log/nginx/access.log
