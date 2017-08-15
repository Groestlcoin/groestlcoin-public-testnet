FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz /

RUN apt-get -y update && apt-get -y install build-essential libssl-dev libboost-all-dev libdb5.3 \
    libdb5.3-dev libdb5.3++-dev libtool automake libevent-dev bsdmainutils git ntp make g++ gcc \
    autoconf cpp ngrep iftop sysstat autotools-dev pkg-config libminiupnpc-dev libzmq3-dev \
    libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev && \
    cd /tmp && git clone https://github.com/groestlcoin/groestlcoin && \
    cd groestlcoin && ./autogen.sh && ./configure && make && make install && \
    rm -rf /tmp/*

EXPOSE 15001 15002

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
