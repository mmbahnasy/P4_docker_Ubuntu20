FROM ubuntu:20.04
ENV TZ=America/Toronto
ENV DEBIAN_FRONTEND=noninteractive
COPY ./patches /root/patches
COPY ./user-bootstrap.sh /root/user-bootstrap.sh
COPY ./exercises /root/exercises
COPY ./py3localpath.py /root/py3localpath.py

RUN apt -y update && apt install -y --fix-missing sudo git wget curl \
        build-essential gnupg2 autoconf automake bison iputils-ping \
        clang cmake cpp flex g++ iproute2 libboost-dev \
        libboost-filesystem-dev libboost-graph-dev libboost-iostreams-dev \
        libboost-program-options-dev libboost-system-dev libboost-test-dev \
        libboost-thread-dev libelf-dev libevent-dev libffi-dev libfl-dev libgc-dev \
        libgflags-dev libgmp-dev libjudy-dev libpcap-dev libpython3-dev \
        libreadline-dev libssl-dev libtool libtool-bin linux-headers-$(uname -r) \
        llvm lubuntu-desktop make net-tools pkg-config python3 python3-dev \
        python3-pip python3-setuptools tcpdump unzip valgrind vim xcscope-el xterm \
    && cd /root/ && bash user-bootstrap.sh \
    && add-apt-repository ppa:dreibh/ppa && apt -y update && apt -y install p4lang-p4c \
    && pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir scapy six pypcap ptf

WORKDIR /opt/dataplane-p4
ENTRYPOINT bash
