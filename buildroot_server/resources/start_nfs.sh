#!/bin/bash

/etc/init.d/S30rpcbind start
/etc/init.d/S60nfs start

while [ true ]; do
    sleep 10
done
