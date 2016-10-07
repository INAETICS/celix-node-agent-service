# Version 1.0
FROM apache/celix-buildroot-builder-basic 
MAINTAINER Pepijn Noltes "pepijnnoltes@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ADD config/.config /usr/buildroot
RUN echo 'source "package/celix/Config.in"' >> /usr/buildroot/Config.in 
ADD packages/celix /usr/buildroot/package/celix

WORKDIR /usr/buildroot

RUN make olddefconfig
RUN make 
RUN make celix

ADD builder.sh /usr/buildroot/
ENTRYPOINT ["/usr/buildroot/builder.sh"]
