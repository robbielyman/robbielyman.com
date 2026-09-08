FROM ubuntu:noble
WORKDIR /site

RUN apt-get update && apt-get install -y xz-utils

ADD --checksum=sha256:897642f46c3872a6311f2ab3d4c622f5f8625bfee8e1de2d0de42597c1385629 \
    https://github.com/kristoff-it/zine/releases/download/v0.14.0/x86_64-linux-musl.tar.xz /zine.tar.xz

RUN tar -oxf /zine.tar.xz -C /usr/bin
COPY . /site
RUN zine release
