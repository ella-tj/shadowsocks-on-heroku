FROM ubuntu:18.04

ADD entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get -y install python-pip \
    && pip install shadowsocks \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
