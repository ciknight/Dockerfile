# Start Nginx 
PWD=`pwd`

docker stop nginx && docker rm nginx
docker run -it -d --name nginx \
    -p 80:80 \
    -p 443:443 \
    -v $PWD/sites-enabled:/etc/nginx/sites-enabled\
    -v $PWD/cert:/etc/nginx/cert\
    -v $PWD/nginx.conf:/etc/nginx/nginx.conf \
    -v $PWD/pages:/usr/share/nginx/blog.ibeats.top \
    -v /tmp:/tmp \
    nginx:1.9.15
