#!/usr/bin/env bash
docker stop mysql && docker rm mysql
docker run -itd --name mysql \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=mysql \
    -v /opt/mysql/datadir:/var/lib/mysql \
    -p 3306:3306 \
    mysql:8.0.21 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
