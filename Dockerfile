FROM alpine:latest

LABEL laudukang="laudukang@gmail.com"

ENV WORK_PATH /work
ENV TZ 'Asia/Shanghai'
ENV FRP_VERSION 0.21.0

RUN mkdir -p $WORK_PATH

WORKDIR $WORK_PATH

RUN apk upgrade --no-cache \
    && apk add --no-cache bash tzdata curl \
    && mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
    && curl -sSLO https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar -zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && mv frp_${FRP_VERSION}_linux_amd64 frp \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf frp_${FRP_VERSION}_linux_amd64.tar.gz /var/cache/apk/*

VOLUME /data

EXPOSE 80 443 6000 7000 7500
