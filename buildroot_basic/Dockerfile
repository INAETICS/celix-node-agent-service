# Version 1.0
FROM ubuntu:14.04
MAINTAINER Florian GAUVIN "florian.gauvin@nl.thalesgroup.com"

ENV DEBIAN_FRONTEND noninteractive
#ENV http_proxy=http://10.160.64.104:8080
#ENV https_proxy=http://10.160.64.104:8080

#Download all the packages needed

RUN apt-get update && apt-get install -y \
	build-essential \
        cmake \
	git \
	python \
	wget \
	unzip \
	bc\
	language-pack-en \
	curl \
	uuid-dev \
    	libjansson-dev \
    	libxml2-dev \
    	libcurl4-openssl-dev \
	mercurial \
	zip \
	openjdk-7-jdk \
	libcups2-dev \
	libfreetype6-dev \
	libasound2-dev\
	libffi-dev \
	libX11-dev \
	libxext-dev \
	libxrender-dev \
	libxtst-dev \
	libxt-dev \
        runit \
        && apt-get clean 
# Update CMAKE
RUN mkdir /cmake && cd /cmake && wget http://www.cmake.org/files/v3.4/cmake-3.4.3.tar.gz && tar xf cmake-3.4.3.tar.gz && cd cmake-3.4.3 && ./configure --prefix=/usr && make && make install

# Get CppUtest 
RUN mkdir /cpputest && cd  /cpputest &&  wget https://github.com/cpputest/cpputest.github.io/blob/master/releases/cpputest-3.7.1.tar.gz?raw=true -O cpputest.tgz && tar xf cpputest.tgz && cd cpputest-3.7.1 && ./configure --prefix=/usr && make && sudo make install

#Download and install the latest version of Docker (You need to be the same version to use this Dockerfile)
RUN wget -qO- https://get.docker.com/ | sh

#Prepare the usr directory by downloading in it : Buildroot, the configuration files of Buildroot, Apache Celix, Apache Felix and Apache Ace

WORKDIR /usr

RUN wget http://git.buildroot.net/buildroot/snapshot/buildroot-2016.02.tar.gz && \
	tar -xf buildroot-2016.02.tar.gz && \
        echo "HOST_FAKEROOT_CONF_OPTS += --with-ipc=tcp" >> /usr/buildroot-2016.02/package/fakeroot/fakeroot.mk && \
        echo 'source "package/etcd/Config.in"' >> /usr/buildroot-2016.02/Config.in

#Add missing packages to the buildroot environment
ADD extra_buildroot_packages/etcd /usr/buildroot-2016.02/package/etcd
 
#ZEROMQ 3.2.5 has to be used instead of the default 4.x
RUN sed -i -e 's/ZEROMQ_VERSION.*/ZEROMQ_VERSION = 3.2.5/' /usr/buildroot-2016.02/package/zeromq/zeromq.mk && rm -f /usr/buildroot-2016.02/package/zeromq/zeromq.hash && rm -f /usr/buildroot-2016.02/package/zeromq/*patch

#Copy the configuration file of the app-builder in Buildroot and create a small base of the future image with buildroot and decompress it
ADD buildroot-configure-app-builder/.config /usr/buildroot-2016.02/
WORKDIR /usr/buildroot-2016.02

RUN make
