# Start Nginx 

docker stop nginx && docker rm nginx
docker run -it -d --name nginx \
    -p 80:80 \
    -p 443:443 \
    -v /etc/nginx/conf.d:conf.d \
    nginx:1.9.15
