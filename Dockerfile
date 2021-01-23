FROM openjdk:8-jre-alpine


ENV KONGX_RUN_MODE "Docker"
ENV VERSION 2.2.0
ENV SERVER_PORT 8095

RUN \
    echo "http://mirrors.aliyun.com/alpine/v3.8/main" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.8/community" >> /etc/apk/repositories  && \
    apk update upgrade && \
    apk add --no-cache procps curl bash unzip tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /kongx-serve

RUN curl https://gitee.com/raoxy/kongx/attach_files/581737/download/kongx-serve-2.2.0.zip  -L -o kongx-serve-${VERSION}.zip

RUN unzip /kongx-serve-${VERSION}.zip -d /kongx-serve \
    && rm -rf /kongx-serve-${VERSION}.zip \
    && chmod +x /kongx-serve/scripts/startup.sh

ADD docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE $SERVER_PORT

ENTRYPOINT ["/docker-entrypoint.sh"]
