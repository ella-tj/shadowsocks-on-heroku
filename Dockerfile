FROM ubuntu:18.04

ADD entrypoint.sh /entrypoint.sh

RUN apt update \
    && apt-get -y install shadowsocks-libev \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
