### rabbitmq

该镜像打开rabbitmq_management插件.建立rabbitmq集群需进入container,进行服务器连接.暂未达到自动化.  

默认映射5672端口.


### 编译

```shell
docker build -t rabbitmq:1.0 .
```


### 运行

```shell
docker run -i -t -d --name rabbitmq \  
	-p 15672:15672 \  
	-v /data/rabbitmq:/var/lib/rabbitmq \   # 持久化数据库  
	rabbitmq:node   
```