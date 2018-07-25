FROM ubuntu:18.04

ADD entrypoint.sh /entrypoint.sh
RUN apt update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt -y install sudo \
    && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo \
    && apt -y install shadowsocks-libev \
    && chmod +x /entrypoint.sh \
    && chmod +x /etc/init.d/shadowsocks-libev

USER docker 
CMD ["/entrypoint.sh"]
