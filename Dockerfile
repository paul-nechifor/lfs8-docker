FROM debian:8

ENV LFS=/mnt/lfs

RUN apt-get -q update && \
    apt-get -q -y install build-essential bison gawk texinfo wget file && \
    apt-get -q -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /bin/sh && \
    cd /bin && \
    ln -s bash sh && \
    mkdir -p /src

COPY build /src/build
COPY sources /src/sources

RUN /src/build version_check
