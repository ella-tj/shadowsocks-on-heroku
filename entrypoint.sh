#!/bin/bash

if [ "$SS_MODULE" == "" ]; then
    echo -e "SS_MODULE is null, use ss-server for default."
    SS_MODULE="ss-server"
else
    echo -e "cmd use $SS_MODULE"
fi

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

$SS_MODULE -s 0.0.0.0 -p $PORT -k $SS_PWD -m $SS_METHOD
