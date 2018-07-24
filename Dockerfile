FROM heroku/heroku:16

ARG TZ='Asia/Shanghai'

ENV TZ $TZ
ENV SS_LIBEV_VERSION 3.2.0
ENV KCP_VERSION 20180316
ENV SS_DOWNLOAD_URL https://github.com/shadowsocks/shadowsocks-libev/releases/download/v${SS_LIBEV_VERSION}/shadowsocks-libev-${SS_LIBEV_VERSION}.tar.gz
ENV OBFS_DOWNLOAD_URL https://github.com/shadowsocks/simple-obfs.git
ENV KCP_DOWNLOAD_URL https://github.com/xtaci/kcptun/releases/download/v${KCP_VERSION}/kcptun-linux-amd64-${KCP_VERSION}.tar.gz

ADD entrypoint.sh /entrypoint.sh

RUN apt-get update \
    && apt-get install python-pip \
    && apk add --virtual .build-deps \
    && pip install shadowsocks \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
