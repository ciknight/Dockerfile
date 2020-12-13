#!/usr/bin/env bash
docker stop rabbitmq && docker rm rabbitmq
docker run -itd --name rabbitmq \
    --restart=always \
    -e RABBITMQ_DEFAULT_USER=guest \
    -e RABBITMQ_DEFAULT_PASS=guest \
    -e RABBITMQ_DEFAULT_VHOST=/ \
    -v /opt/rabbitmq/datadir:/var/lib/rabbitmq/mnesia/ \
    -p 5672:5672 \
    -p 15672:15672 \
    rabbitmq:3.8.5-management-alpine
