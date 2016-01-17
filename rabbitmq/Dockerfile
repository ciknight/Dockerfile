# rabbitmq
#
# VERSION       1.0

FROM ubuntu:14.04

MAINTAINER ci_knight <ci_knight@msn.cn>

ADD conf/rabbitmq /etc/rabbitmq

RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && apt-get update && \
	apt-get install -y rabbitmq-server

# set cookie order by Building cluster
RUN echo 'HVNIYSUUPMXSDQDJSDGQ' > /var/lib/rabbitmq/.erlang.cookie && \
	chmod 400 /var/lib/rabbitmq/.erlang.cookie && chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie

EXPOSE 5672

CMD ["rabbitmq-server"]