FROM alpine:3.8

ADD entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get -y install shadowsocks-libev \
    && chmod +x /entrypoint.sh \
    && chmod +x /etc/init.d/shadowsocks-libev

CMD ["/entrypoint.sh"]
