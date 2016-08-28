#########################################################
#
# This is my masterpiece, you can use Lua support
#
# Configure
# Nginx prefix=/etc/nginx
# Nginx conf=prefix/conf
# https://github.com/nginxinc/docker-nginx/blob/e117bd83e9befe5582bc1da8f72248398fffa16c/mainline/alpine/Dockerfile
# https://github.com/openresty/lua-nginx-module
# 1.9.5 https://github.com/Homebrew/homebrew-nginx/issues/146
#
#########################################################

FROM alpine:latest
MAINTAINER haining <ci_knight@msn.cn>

ENV NGINX_VERSION 1.9.15

# ADD repositories /etc/apk/repositories

RUN addgroup -S nginx \
        && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
        && apk add --update openssl pcre zlib libxslt gd geoip perl \
        && apk add --no-cache --virtual .build-deps \
        libc-dev openssl-dev pcre-dev zlib-dev linux-headers \
        gnupg libxslt-dev gd-dev geoip-dev perl-dev \
        git wget gcc make \
        && cd /tmp \
        && wget -c http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz && tar zxvf nginx-$NGINX_VERSION.tar.gz

RUN CONFIG="--with-poll_module \
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --http-client-body-temp-path=/var/cache/nginx/client_temp \
        --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
        --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
        --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
        --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
        --user=nginx \
        --group=nginx \
        --with-http_ssl_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_dav_module \
        --with-http_gunzip_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_gzip_static_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_auth_request_module \
        --with-http_image_filter_module \
        --with-http_xslt_module \
        --with-http_geoip_module \
        --with-http_perl_module \
        --with-threads \
        --with-mail \
        --with-mail_ssl_module \
        --with-file-aio \
        --with-http_v2_module \
#        --with-http_spdy_module \
        --with-stream \
        --with-stream_ssl_module \
        --with-ipv6 \
        --with-http_slice_module \
        --without-select_module" \
        && cd /tmp/nginx-$NGINX_VERSION && ./configure $CONFIG \
        && make -j$(getconf _NPROCESSORS_ONLN) && make install \
        && rm -rf /etc/nginx/html/ \
        && mkdir /etc/nginx/conf.d/ \
        && mkdir -p /usr/share/nginx/html/ \
        && install -m644 html/index.html /usr/share/nginx/html/ \
        && install -m644 html/50x.html /usr/share/nginx/html/ \
        && rm -rf /tmp/nginx-$NGINX_VERSION \
        && apk del .build-deps gcc wget git make \
        && chown -R nginx:nginx /usr/share/nginx \
        && chmod -R 755 /usr/share/nginx

COPY nginx.conf /etc/nginx/nginx.conf



#        --with-ld-opt="-Wl,-rpath,/path/to/luajit-or-lua/lib" \
#        --add-module=/ngx_devel_kit-0.3.0 \
#        --add-module=/lua-nginx-module-0.10.5 \
#        --add-module=/echo-nginx-module
# Build luajit
# RUN make install PREFIX=/usr/local/luajit
# RUN echo "/usr/local/luajit/lib" > /etc/ld.so.conf.d/usr_local_luajit_lib.conf && ldconfig
# ENV LUAJIT_LIB /usr/local/luajit/lib
# ENV LUAJIT_INC /usr/local/luajit/include/luajit-2.0
#        && wget -c http://luajit.org/download/LuaJIT-2.0.4.tar.gz && tar zxvf LuaJIT-2.0.4.tar.gz \
#        && wget -c https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz && tar zxvf v0.3.0.tar.gz \
#        && wget -c https://github.com/openresty/lua-nginx-module/archive/v0.10.5.tar.gz && tar zxvf v0.10.5.tar.gz \
#        && git clone https://github.com/openresty/echo-nginx-module.git

EXPOSE 80 443
 
CMD ["nginx", "-g", "daemon off;"]
