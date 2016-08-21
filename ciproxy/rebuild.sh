docker stop ciproxy && docker rm ciproxy
docker rmi -f ciproxy:0.1
docker build  -t ciproxy:0.1 . 
