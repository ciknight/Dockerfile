# Start Nginx 

docker stop nginx && docker rm nginx
docker run -it -d --name nginx \
    -p 80:80 \
    nginx:1.8.1 
