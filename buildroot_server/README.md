# INAETICS PXE Boot Environment

## Description

This docker image provides a buildroot_server image that can be used by the cagent_builder.sh to create a server-agent image.
The resulting image can be used to boot an INAETICS cluster.
It adds a dnsmasq daemon, a httpd webserver and an nfs server to the buildroot environment.
These daemons can be started in docker with an external configuration.

The included dnsmasq and www subdirectories are only examples and shall be adapted for your specific environment.
dnsmasq example: includes a DHCP configuration, a DNS configuration (not tested yet) and a PXE/TFTP server
                 TODO: add the latest CoreOS images to the same directory
                    wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
                    wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
webserver example: includes cloud-config files

## Usage

docker run -v `pwd`/buildroot_server/dnsmasq:/tmp --privileged --net=host --name=dnsmasq inaetics/server-agent /usr/sbin/dnsmasq -d -C /tmp/dnsmasq.conf &
# Note: --net=host is needed to boot external machines
# Note: --privileged is needed to update the ARP cache table on the Host/server machine
# Note: take care your firewall is disabled: systemctl stop firewalld
# Note: take care libvirtd is disabled and also the dnsmasq daemon of the host is killed (libvirt uses dnsmasq for dhcp in virtual box machines)

docker run -v `pwd`/buildroot_server/www:/tmp/www --net=host --name=webserver inaetics/server-agent /usr/sbin/lighttpd -D -f /tmp/www/lighttpd.conf &
# Note: the webserver is used to provide an cloud-config file to the worker machines

docker run --privileged -v `pwd`/buildroot_server/nfs/exports:/etc/exports -v `pwd`/buildroot_server/nfs/public:/tmp/public --name=nfsd inaetics/server-agent /bin/bash /opt/start_nfs.sh &
# Note: nfsd needs to access /proc/fs/nfsd on the host to interface with the kernel, therefore privileged!

