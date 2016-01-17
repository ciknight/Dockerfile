# mysql-master
#
# VERSION       1.0

FROM ubuntu:14.04
MAINTAINER ci_knight <ci_knight@msn.cn>

RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && apt-get update

RUN apt-get install -y mysql-server

RUN service mysql start && mysql -e "use mysql; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"

RUN service mysql stop

EXPOSE 3306

CMD ["mysqld_safe"]