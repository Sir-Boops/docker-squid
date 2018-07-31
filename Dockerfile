FROM alpine:3.8

ENV SQU_VER="4.1"

RUN apk -U upgrade && \
    apk add -U --virtual deps \
    gcc make g++ perl file && \
    apk add libstdc++ libgcc && \
    cd ~ && \
    wget http://www.squid-cache.org/Versions/v4/squid-$SQU_VER.tar.xz && \
    tar xf squid-$SQU_VER.tar.xz && \
    cd squid-$SQU_VER && \
    ./configure --prefix=/opt/squid && \
    make -j$(nproc) && \
    make install && \
    apk del --purge deps
