#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure

set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '192.168.14.0/24'
set nat source rule 100 translation address masquerade

set service dhcp-server disabled 'false'
set service dhcp-server shared-network-name LAN subnet 192.168.14.0/24 default-router '192.168.14.2'
set service dhcp-server shared-network-name LAN subnet 192.168.14.0/24 dns-server '192.168.14.2'
set service dhcp-server shared-network-name LAN subnet 192.168.14.0/24 domain-name 'br14'
set service dhcp-server shared-network-name LAN subnet 192.168.14.0/24 lease '600'
set service dhcp-server shared-network-name LAN subnet 192.168.14.0/24 start '192.168.14.129' stop '192.168.14.254'

set service dns forwarding cache-size '0'
set service dns forwarding listen-on 'eth1'
set service dns forwarding name-server '8.8.8.8'
set service dns forwarding name-server '8.8.4.4'

commit
save
