### mysql-master

mysql主库.默认打开远程登录,可自行根据需求修改.之后再次优化mysql配置文件

默认映射3306端口.


### 编译

```shell
docker build -t mysql:master .
```


### 运行

```shell
docker run -i -t -d --name mysql \
	-v /root/docker/mysql/master/my.cnf:/etc/mysql/my.cnf \
	-v /root/docker/mysql/master/mysql:/var/lib/mysql/ \  # 持久化数据库文件
	mysql:master
```