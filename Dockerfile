FROM ubuntu:18.04

ADD entrypoint.sh /entrypoint.sh
RUN apt update \
    && apt -y install sudo \
    && useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo \
    && apt -y intsall shadowsocks-libev \
    && chmod +x /entrypoint.sh \
    && chmod +x /etc/init.d/shadowsocks-libev

CMD ["/entrypoint.sh"]
