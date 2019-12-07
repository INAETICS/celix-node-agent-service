# Version 1.0
FROM inaetics/buildroot_basic 
MAINTAINER Florian GAUVIN "florian.gauvin@nl.thalesgroup.com"

ENV DEBIAN_FRONTEND noninteractive
#ENV http_proxy=http://10.160.64.104:8080
#ENV https_proxy=http://10.160.64.104:8080

#Download all the packages needed
RUN echo 'source "package/qperf/Config.in"' >> /usr/buildroot-2016.02/Config.in 

#Add missing packages to the buildroot environment
ADD extra_buildroot_packages/qperf /usr/buildroot-2016.02/package/qperf

WORKDIR /usr/buildroot-2016.02

RUN make qperf; make iperf; make netperf; make netcat; make tcpdump
RUN make 

WORKDIR /usr/buildroot-2016.02/output/images


RUN mkdir /usr/tools-image && \
    cp rootfs.tar /usr/tools-image/

