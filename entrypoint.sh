#!/bin/bash

if [ "$SS_METHOD" == "" ]; then
    echo -e "SS_METHOD is null, use aes-256-gcm for default."
    SS_METHOD="aes-256-gcm"
else
    echo -e "cmd use $SS_METHOD"
fi

if [ "$SS_PWD" == "" ]; then
    echo -e "Error:SS_PWD is null!"
    exit 1
fi

sed -i "s/6666/$PORT/g" config.json
sed -i "s/SSMETHOD/$SS_METHOD/g" config.json
sed -i "s/PWD/$SS_PWD/g" config.json

./v2ray
