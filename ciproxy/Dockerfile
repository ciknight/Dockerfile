#########################################################
#
# This is My Proxy, it's name CIProxy
# THis is my masterpiece
#
#########################################################

FROM alpine:latest
MAINTAINER haining <ci_knight@msn.cn>

ADD repositories /etc/apk/repositories
ADD shadowsocks.json /etc/shadowsocks.json
ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD polipo.conf /etc/polipo.conf
ADD polipo /bin/polipo
ADD ciproxy.sh /ciproxy.sh

RUN apk add --update python py-pip haproxy \
    && pip install shadowsocks \
    && mkdir -p /usr/share/polipo/www /var/cache/polipo

EXPOSE 51314

CMD ["sh", "ciproxy.sh"]
