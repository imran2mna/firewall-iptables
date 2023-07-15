# IPSec

Source documentation - https://docs.freebsd.org/en/books/handbook/security/#ipsec

FreeBSD is used as gateway routers' operationg system.
Alpine Linux is used as ISP operating system.

The setup as follows with external IPs:

corporate-router ---------> service-provider <------------  home-lan-router
172.16.5.4                  172.16.5.5,192.168.1.13         192.168.1.12

Internal IPs
10.246.38.1/24                 ()                           10.0.0.5/24

IPs and tunnelling are set be persistent at boot time.

Packet encapuslation is facilitated by BSD kernel, default from FreeBSD 11 upwards.
Packet encryption is provided Racoon daemon.

The pre-shared key file format psk.txt == /etc/hosts
<other-end-IP>  <hexadecimal starting with 0x>

Note: Packet filtering is not applied for the time.
