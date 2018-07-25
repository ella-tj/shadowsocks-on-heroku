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
/etc/init.d/shadowsocks-libev start 
