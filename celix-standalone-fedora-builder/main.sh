#!/bin/bash

#TODO optional strip executables/libs
mkdir /root/docker-image
dockerize -n -o /root/docker-image --add-file /usr/lib64/libjansson.so.4 /lib64/libjansson.so.4 /usr/local/bin/celix /usr/bin/gdbserver
cd /root/docker-image
tar c --to-stdout *
