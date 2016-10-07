# Version 1.0
FROM ubuntu:14.04
MAINTAINER Pepijn Noltes "pepijnnoltes@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

#Download all the packages needed
RUN apt-get update && apt-get install -y \
	build-essential \
	git \
	python \
	wget \
	unzip \
	language-pack-en \
	curl \
	uuid-dev \
    libcurl4-openssl-dev \
	mercurial \
	zip \
    libncurses5-dev \
    runit \
    && apt-get clean 

# Update CMAKE
#RUN mkdir /cmake && cd /cmake && wget https://cmake.org/files/v3.5/cmake-3.5.2.tar.gz && tar xf cmake-*.tar.gz && cd cmake-* && ./configure --prefix=/usr && make && make install

#Download and install the latest version of Docker (You need to be the same version to use this Dockerfile)
RUN wget -qO- https://get.docker.com/ | sh

#Prepare the usr directory by downloading in it : Buildroot, the configuration files of Buildroot, Apache Celix, Apache Felix and Apache Ace

WORKDIR /usr

RUN wget http://git.buildroot.net/buildroot/snapshot/buildroot-2016.08.tar.gz && \
	tar -xf buildroot-*.tar.gz && \
    ln -s /usr/buildroot-2016.08 /usr/buildroot && \
    echo "HOST_FAKEROOT_CONF_OPTS += --with-ipc=tcp" >> /usr/buildroot/package/fakeroot/fakeroot.mk 

RUN apt-get update && apt-get install -y \
    bc \
    && apt-get clean

WORKDIR /usr/buildroot

