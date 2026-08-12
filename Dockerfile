FROM ubuntu:noble
WORKDIR /site

RUN apt-get update && apt-get install -y xz-utils

ADD --checksum=sha256:4182a5905d766fcdd6dd066ccfbd19ce8c203b8171bdb3571640941dc85f3c09 \
    https://github.com/kristoff-it/zine/releases/download/v0.13.0/x86_64-linux-musl.tar.xz /zine.tar.xz

RUN tar -oxf /zine.tar.xz -C /usr/bin
COPY . /site
RUN zine release
