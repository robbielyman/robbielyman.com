FROM ubuntu:noble
WORKDIR /site

RUN apt-get update && apt-get install -y xz-utils

ADD --checksum=sha256:c250e029d978901b0c9a38eab0a860ef9db875bf686fe0f0abf61f180c280dba \
    https://github.com/kristoff-it/zine/releases/download/v0.13.0/x86_64-linux-musl.tar.xz /zine.tar.xz

RUN tar -oxf /zine.tar.xz -C /usr/bin
COPY . /site
RUN zine release
