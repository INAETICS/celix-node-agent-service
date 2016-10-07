FROM fedora:23

#Install required libs for building, docker, python and dokerize
RUN dnf group install -y "C Development Tools and Libraries"
RUN dnf -y install \
    cmake \
    ninja-build \
    make \
    git \
    java \
    libcurl-devel \
    jansson-devel \
    libffi-devel \
    libxml2-devel \
    libuuid-devel \
    docker \
    python3

#jdk installed for jar command
RUN dnf install -y java-1.8.0-openjdk-devel

#dockerize will be used to extract a single executable with required deps
RUN pip install dockerize

#Building and installing celix
WORKDIR /root
RUN git clone -b develop https://github.com/apache/celix.git
RUN mkdir /root/celix/build

WORKDIR /root/celix/build
RUN cmake -DCMAKE_C_FLAGS="-w" ..
RUN make -j && make install


#Create docker image
RUN mkdir /root/docker-image
RUN dockerize -n -o /root/docker-image --add-file /usr/lib64/libjansson.so.4 /lib64/libjansson.so.4 /usr/local/bin/celix
#RUN docker save celix-standalone > /tmp/celix-standalone.tar

#TODO maybe move dokerize to main.sh and also optional strip celix + libs, and/or add gdb-server

#Adding scripts
WORKDIR /root
ADD main.sh /root/
RUN chmod +x /root/main.sh

ENTRYPOINT "/root/main.sh"
