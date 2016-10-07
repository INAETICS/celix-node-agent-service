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
    python3 \
    gdb-gdbserver

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

#Adding scripts
WORKDIR /root
ADD main.sh /root/
RUN chmod +x /root/main.sh

ENTRYPOINT "/root/main.sh"
