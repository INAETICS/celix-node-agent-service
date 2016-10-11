#!/bin/bash

#TODO strip libs/executable and create a non stripped mirrot with gdb?

cd /root/docker-image
tar c --to-stdout *
