FROM heroku/heroku:16

ADD entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install python-pip \
    && apk add --virtual .build-deps \
    && pip install shadowsocks \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
