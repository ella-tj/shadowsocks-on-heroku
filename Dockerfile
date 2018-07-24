FROM heroku/heroku:16

ADD entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get -y install python-pip \
    && pip install shadowsocks \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
