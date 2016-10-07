# Buildroot INAETICS node-agent-celix  [![Build Status](https://travis-ci.org/INAETICS/node-agent-c.svg?branch=buildroot_node)](https://travis-ci.org/INAETICS/node-agent-c)
This project builds two docker images:
* celix-buildroot-builder-basic: 
  a ubuntu image that has a buildroot develop environment
* celix-buildroot-builder: 
  a ubuntu image with the above buildroot development environment and the 
  latest Celix development branch. It is used to build the 
  inaetics/celix-agent node that only contains a deployment\_admin bundle 
  and log\_services.
  It also contains a a separate script to 
  support building application bundles against this buildroot and Celix environment.

##############################################################################
The necessary build steps are supported by the included build.sh script.

## Build basic buildroot builder environment
To build the buildroot_basic image:

    docker build -t inaetics/celix-buildroot-builder-basic celix-buildroot-builder-basic

This build takes a long time to retrieve the buildroot environment from the Internet and then build it inside the ubuntu based docker image. At the moment it is based on the buildroot 2015.05 tag.

Note: there is no need to run this docker image directly.

## Build buildroot builder using the latest celix to buildroot environment
To build the target inaetics/buildroot_minimum_celix image:

    docker build -t inaetics/celix-buildroot-builder celix-buildroot-builder

Note: there is no need to run this docker image directly.

## Create the builder script
The builder is a shell script (builder.sh) that can be used to:
- build the inaetics/celix-agent

The nice part is that this builder image is also used to generate the 
needed shell script. Use the following commands to generate the shell script:

        docker run inaetics/celix-buildroot-builder build_script > builder.sh
        chmod +x builder.sh

##############################################################################
The builder.sh can be invoked with the following commands:
	
	./builder.sh make_celix_agent (Generates inaetics/celix-agent)

## TODO

- The celix alpine builder is still under construction
