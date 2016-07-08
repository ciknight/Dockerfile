docker stop nginx && docker rm nginx
docker rmi -f nginx:1.8.1 
docker build  -t nginx:1.8.1 . 
