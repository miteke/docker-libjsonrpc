FROM ubuntu:artful
ENV VERSION 1.0.0
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libargtable2-dev cmake libmicrohttpd-dev libjsoncpp-dev libhiredis-dev git
RUN mkdir /build && \
    cd /build && \
    git clone git://github.com/cinemast/libjson-rpc-cpp.git && \
    mkdir -p libjson-rpc-cpp/build && \
    cd libjson-rpc-cpp/build && \
    cmake .. && \
    make && \
    make install && \
    ldconfig
ENTRYPOINT ['jsonrpcstub']


