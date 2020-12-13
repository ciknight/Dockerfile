#!/usr/bin/env bash
docker stop redis && docker rm redis
docker run -itd --name redis \
    --restart=always \
    -v /opt/redis/rsdata:/data \
    -p 6379:6379 \
    redis:5.0.7-alpine redis-server --appendonly yes
