ssserver -c /etc/shadowsocks.json -d start --log-file /var/log/ssserver.log --pid-file /var/run/ssserver.pid
sslocal -d start -s 127.0.0.1 -p 11200 -b 127.0.0.1 -l 9001 -k password -m aes-128-cfb --pid-file /var/run/shadowsocks_1.pid
sslocal -d start -s 127.0.0.1 -p 11200 -b 127.0.0.1 -l 9002 -k password -m aes-128-cfb --pid-file /var/run/shadowsocks_2.pid
haproxy -D -f /etc/haproxy/haproxy.cfg > /var/log/haproxy.log
polipo -c /etc/polipo.conf
