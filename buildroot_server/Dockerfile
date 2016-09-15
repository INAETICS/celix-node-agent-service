# Version 1.0
FROM inaetics/buildroot_basic 
MAINTAINER Florian GAUVIN "florian.gauvin@nl.thalesgroup.com"

ENV DEBIAN_FRONTEND noninteractive
#ENV http_proxy=http://10.160.64.104:8080
#ENV https_proxy=http://10.160.64.104:8080

#Download all the packages needed
RUN apt-get install -y cvs

#Add missing packages to the buildroot environment
ADD expect /usr/buildroot-2016.02/package/expect

# Copy the configuration file of the app-builder in Buildroot and create 
# a small base of the future image with buildroot and decompress it
ADD buildroot-configure-app-builder/.config /usr/buildroot-2016.02/

WORKDIR /usr/buildroot-2016.02
ADD resources/start_nfs.sh /usr/buildroot-2016.02/output/target/opt/start_nfs.sh

RUN make 

WORKDIR /usr/buildroot-2016.02/output/images

ADD resources/S60nfs /usr/buildroot-2016.02/output/images/etc/init.d/S60nfs

RUN tar -f rootfs.tar --delete ./etc/init.d/S60nfs; chmod 755 ./etc/init.d/S60nfs; tar -f rootfs.tar -u ./etc/init.d/S60nfs

RUN mkdir /usr/server-image && \
    cp rootfs.tar /usr/server-image/server_rootfs.tar

