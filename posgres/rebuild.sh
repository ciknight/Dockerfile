docker stop postgres && docker rm postgres
docker rmi -f postgres:9.6
docker build  -t postgres:9.6 .
