# Version 1.0
FROM inaetics/buildroot_basic 
MAINTAINER Florian GAUVIN "florian.gauvin@nl.thalesgroup.com"

ENV DEBIAN_FRONTEND noninteractive
#ENV http_proxy=http://10.160.64.104:8080
#ENV https_proxy=http://10.160.64.104:8080

#Download all the packages needed

#Add missing packages to the buildroot environment
# Copy the configuration file of the app-builder in Buildroot and create 
# a small base of the future image with buildroot and decompress it
ADD buildroot-configure-app-builder/.config /usr/buildroot-2015.05/

WORKDIR /usr/buildroot-2015.05

RUN make dnsmasq
RUN make 

WORKDIR /usr/buildroot-2015.05/output/images


RUN mkdir /usr/server-image && \
    cp rootfs.tar /usr/server-image/server_rootfs.tar

