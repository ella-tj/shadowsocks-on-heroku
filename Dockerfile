FROM ubuntu:18.04

ADD entrypoint.sh /entrypoint.sh

RUN apt update \
    && apt-get -y install shadowsocks-libev \
    && chmod +x /entrypoint.sh \
    && chmod +x /etc/init.d/shadowsocks-libev

CMD ["/entrypoint.sh"]
