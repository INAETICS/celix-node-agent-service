# Version 1.0
FROM alpine:3.4
MAINTAINER Pepijn Noltes "pepijnnoltes@gmail.com"

#Download all the packages needed
RUN apk update
#RUN apk add openjdk8-jre
RUN apk add zip
RUN apk add build-base
RUN apk add git
RUN apk add cmake
RUN apk add curl-dev jansson-dev zlib-dev libxml2-dev libffi-dev util-linux-dev
RUN mkdir -p /tmp/build/celix-build
WORKDIR /tmp/build
RUN git clone -b develop https://github.com/apache/celix.git
WORKDIR /tmp/build/celix-build
RUN cmake -DCMAKE_C_FLAGS="-w" -DBUILD_REMOTE_SHELL=OFF ../celix
#MAKE fails for 2 reasons: 1) queue.h (needed for dfi) is not on alpine (add to dfi?), 2) usage of pthread_setname_np in thread pools
#RUN make 

##TODO for 'normal' image
#RUN apk update && apk add curl jansson zlib libxml2 libffi libuuid
#TODO export /usr/local from builder to /usr/local on 'normal' image
