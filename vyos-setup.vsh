#!/bin/vbash
source /opt/vyatta/etc/functions/script-template

configure


set system name-server 8.8.8.8
set system time-zone Asia/Tokyo
set service snmp community cacticonnect


set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '192.168.14.0/24'
set nat source rule 100 translation address masquerade

set nat source rule 200 outbound-interface 'eth0'
set nat source rule 200 source address '192.168.19.0/24'
set nat source rule 200 translation address masquerade


set service dhcp-server disabled 'false'

set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 default-router '192.168.14.3'
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 dns-server '192.168.14.3'
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 domain-name 'br14'
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 lease '3600'
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 start '192.168.14.129' stop '192.168.14.254'

set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 static-mapping ap64 ip-address 192.168.14.64
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 static-mapping ap64 mac-address b0:fa:eb:f5:3f:64

set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 static-mapping ap83 ip-address 192.168.14.83
set service dhcp-server shared-network-name WIFI_LAN subnet 192.168.14.0/24 static-mapping ap83 mac-address b0:fa:eb:f5:45:83

set service dhcp-server shared-network-name WIRE_LAN subnet 192.168.19.0/24 default-router '192.168.19.3'
set service dhcp-server shared-network-name WIRE_LAN subnet 192.168.19.0/24 dns-server '192.168.19.3'
set service dhcp-server shared-network-name WIRE_LAN subnet 192.168.19.0/24 domain-name 'br19'
set service dhcp-server shared-network-name WIRE_LAN subnet 192.168.19.0/24 lease '3600'
set service dhcp-server shared-network-name WIRE_LAN subnet 192.168.19.0/24 start '192.168.19.129' stop '192.168.19.254'


set service dns forwarding cache-size '0'
set service dns forwarding listen-on 'eth1'
set service dns forwarding listen-on 'eth2'
set service dns forwarding name-server '8.8.8.8'
set service dns forwarding name-server '8.8.4.4'


commit
save
