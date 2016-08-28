docker stop nginx && docker rm nginx
docker rmi -f nginx:1.9.15
docker build  -t nginx:1.9.15 . 
