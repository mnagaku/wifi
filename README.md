# wifi
vyosコンテナ+aironet1140をjupyterで組み上げる


前提条件

Debian9(dcoker-compose入り)

/etc/network/interfaces
```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp

auto enx14
iface enx14 inet manual

auto enx19
iface enx19 inet manual

auto br14
iface br14 inet static
address 192.168.14.1
netmask 255.255.255.0
bridge_ports enx14
bridge_maxwait 0
bridge_fd 0
bridge_stp off

auto br19
iface br19 inet static
address 192.168.19.1
netmask 255.255.255.0
bridge_ports enx19
bridge_maxwait 0
bridge_fd 0
bridge_stp off
```



