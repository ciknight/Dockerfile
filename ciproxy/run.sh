# Start 

docker stop ciproxy && docker rm ciproxy
docker run -it -d --name ciproxy \
    -p 51314:51314 \
    ciproxy:0.1 
