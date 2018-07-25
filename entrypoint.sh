#!/bin/bash

if [ "$SS_METHOD" == "" ]; then
    echo -e "SS_METHOD is null, use aes-256-cfb for default."
    SS_METHOD="aes-256-cfb"
else
    echo -e "cmd use $SS_METHOD"
fi

if [ "$SS_PWD" == "" ]; then
    echo -e "Error:SS_PWD is null!"
    exit 1
fi

# ssserver -p $PORT -k $SS_PWD -m $SS_METHOD
echo { > /etc/shadowsocks-libev/config.json
echo "server":"127.0.0.1", >> /etc/shadowsocks-libev/config.json
echo "server_port":$PORT, >> /etc/shadowsocks-libev/config.json
echo "local_port":1080, >> /etc/shadowsocks-libev/config.json
echo "password":"$SS_PWD", >> /etc/shadowsocks-libev/config.json
echo "timeout":60, >> /etc/shadowsocks-libev/config.json
echo "method":"$SS_METHOD", >> /etc/shadowsocks-libev/config.json
echo } >> /etc/shadowsocks-libev/config.json

sudo /etc/init.d/shadowsocks-libev start 
