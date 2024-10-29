FROM ubuntu:20.04

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Asia/Singapore /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -q -y --no-install-recommends vim wget git apt-transport-https gnupg2 ca-certificates dbus-x11 g++ make libmbedtls-dev libssl-dev liblz4-dev cmake \
    && rm -rf /var/lib/apt/lists/* \
    && export O3=/O3 && mkdir $O3 && export DEP_DIR=$O3/deps && mkdir $DEP_DIR \
    && export DL=$O3/dl && mkdir $DL && cd $O3 \
    && git clone https://github.com/OpenVPN/openvpn3.git core \
    && cd core/scripts/linux/ && ./build-all && cd $O3/core \
    && mkdir build && cd build && cmake .. && cmake --build . \
    && apt-get purge -y dbus-x11 g++ make libmbedtls-dev libssl-dev liblz4-dev cmake vim git tzdata && apt -y autoremove && rm -rf /O3/core/build/test/unittests
WORKDIR /O3/core/build