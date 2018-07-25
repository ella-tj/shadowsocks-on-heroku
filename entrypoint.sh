cd /v2raybin
if [ "$VER" = "latest" ]; then
  wget http://storage.googleapis.com/v2ray-docker/v2ray 
  wget http://storage.googleapis.com/v2ray-docker/v2ctl
  wget http://storage.googleapis.com/v2ray-docker/geoip.dat
  wget http://storage.googleapis.com/v2ray-docker/geosite.dat
else
  wget -O v2ray.zip http://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip
  unzip v2ray.zip 
  mv /v2raybin/v2ray-v$VER-linux-64/v2ray .
  mv /v2raybin/v2ray-v$VER-linux-64/v2ctl .
  mv /v2raybin/v2ray-v$VER-linux-64/geoip.dat .
  mv /v2raybin/v2ray-v$VER-linux-64/geosite.dat .
fi

chmod +x v2ray
chmod +x v2ctl

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
