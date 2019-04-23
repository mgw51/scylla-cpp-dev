FROM ubuntu
RUN apt-get update && apt-get install -y wget libssl1.0.0 cmake g++ gdb && \
    mkdir cass-deps && \
    mkdir scylla-src && \
    cd cass-deps && \
    wget http://downloads.datastax.com/cpp-driver/ubuntu/16.04/cassandra/v2.11.0/cassandra-cpp-driver_2.11.0-1_amd64.deb && \
    wget http://downloads.datastax.com/cpp-driver/ubuntu/16.04/cassandra/v2.11.0/cassandra-cpp-driver-dev_2.11.0-1_amd64.deb && \
    wget http://downloads.datastax.com/cpp-driver/ubuntu/16.04/dependencies/libuv/v1.24.0/libuv1_1.24.0-1_amd64.deb && \
    wget http://downloads.datastax.com/cpp-driver/ubuntu/16.04/dependencies/libuv/v1.24.0/libuv1-dev_1.24.0-1_amd64.deb && \
    dpkg -i libuv1_1.24.0-1_amd64.deb && \
    dpkg -i libuv1-dev_1.24.0-1_amd64.deb && \
    dpkg -i cassandra-cpp-driver_2.11.0-1_amd64.deb && \
    dpkg -i cassandra-cpp-driver-dev_2.11.0-1_amd64.deb && \
    cd ../ && \
    rm -rf cass-deps && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*
WORKDIR scylla-src
ENTRYPOINT ["/bin/bash", "-c"]
