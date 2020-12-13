#!/usr/bin/env bash
docker stop postgres && docker rm postgres
docker run -itd --name postgres \
    --restart=always \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_DB=postgres \
    -v /opt/postgres/pgdata:/var/lib/postgresql/data \
    -p 5432:5432 \
    -d postgres:9.6.15-alpine
