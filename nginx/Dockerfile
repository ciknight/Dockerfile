#########################################################
#
# This is My Nginx, you can use Lua support
#
# Configure
# Nginx prefix=/usr/local/nginx
# Nginx conf=prefix/conf
#
#########################################################

FROM ubuntu:14.04
MAINTAINER haining <ci_knight@msn.cn>

RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y wget gcc make git 

# dependency
# gzip-zlib rewrite-pcre ssl-openssl
Run apt-get install -y libssl-dev libpcre3 libpcre3-dev

# Download
RUN wget -c http://nginx.org/download/nginx-1.8.1.tar.gz && tar zxvf nginx-1.8.1.tar.gz 
RUN wget -c http://luajit.org/download/LuaJIT-2.0.4.tar.gz && tar zxvf LuaJIT-2.0.4.tar.gz
RUN wget -c https://github.com/simpl/ngx_devel_kit/archive/v0.3.0.tar.gz && tar zxvf v0.3.0.tar.gz
RUN wget -c https://github.com/openresty/lua-nginx-module/archive/v0.10.5.tar.gz && tar zxvf v0.10.5.tar.gz
RUN git clone https://github.com/openresty/echo-nginx-module.git

# Build luajit
WORKDIR /LuaJIT-2.0.4
RUN make install PREFIX=/usr/local/luajit
RUN echo "/usr/local/luajit/lib" > /etc/ld.so.conf.d/usr_local_luajit_lib.conf && ldconfig
ENV LUAJIT_LIB /usr/local/luajit/lib
ENV LUAJIT_INC /usr/local/luajit/include/luajit-2.0

WORKDIR /nginx-1.8.1

RUN ./configure --with-poll_module \
        --without-select_module \
        --with-http_ssl_module \
        --with-ipv6 \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-ld-opt="-Wl,-rpath,/path/to/luajit-or-lua/lib" \
        --add-module=/ngx_devel_kit-0.3.0 \
        --add-module=/lua-nginx-module-0.10.5 \
        --add-module=/echo-nginx-module
RUN make -j2 && make install

RUN ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
ADD nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 80
 
CMD ["nginx"]
