# INAETICS Development tools 

## Description

This docker image provides a buildroot_tools image that can be used by the cagent_builder.sh to create a tools-agent image.
The resulting image can be used to do additional tests in an INAETICS cluster.

Included tools:
qperf:	network bandwidth and latency both UDP and TCP
iperf:	network bandwidth both UDP, TCP including multicast
lmbench: OS system and hardware benchmarking
netcat:	 UDP and TCP sender/receiver
netperf: TBD

## Examples QPERF

### Network benchmarking

Local  host  
Configuration used:
conf:
    loc_node   =  c42a787b942a
    loc_cpu    =  8 Cores: Mixed CPUs
    loc_os     =  Linux 3.10.0-229.20.1.el7.x86_64
    loc_qperf  =  0.4.9
    rem_node   =  d02d5c020630
    rem_cpu    =  8 Cores: Mixed CPUs
    rem_os     =  Linux 3.10.0-229.20.1.el7.x86_64
    rem_qperf  =  0.4.9

Container 1:
docker run  -p 5000:5000 -p 5001:5001 inaetics/tools-agent /usr/bin/qperf -lp 5000
docker ps to get container_id
docker inspect to get IP address on docker bridge
Container 2:
#### Test 1: (Fastest local host option) share network stack of first container in second container. Both have same IP address
docker run --net=container:d02d5c020630 inaetics/tools-agent /usr/bin/qperf 127.0.0.1 -lp 5000 -ip 5001 tcp_bw tcp_lat conf
tcp_bw:
    bw  =  6.12 GB/sec
tcp_lat:
    latency  =  4.95 us
#### Test 2:
docker run --link d02d5c020630 inaetics/tools-agent /usr/bin/qperf 172.18.0.13 -lp 5000 -ip 5001 tcp_bw tcp_lat conf
tcp_bw:
    bw  =  5.72 GB/sec
tcp_lat:
    latency  =  5.57 us
#### Test 3: (same as test 2)
 docker run inaetics/tools-agent /usr/bin/qperf 172.18.0.13 -lp 5000 -ip 5001 tcp_bw tcp_lat conf
tcp_bw:
    bw  =  5.75 GB/sec
tcp_lat:
    latency  =  5.48 us
#### Test 4: (different messages sizes and longer runs)
 docker run inaetics/tools-agent /usr/bin/qperf 172.18.0.13 -t 10 -oo msg_size:1:64K:*2 -vu -lp 5000 -ip 5001 tcp_bw tcp_lat conf

