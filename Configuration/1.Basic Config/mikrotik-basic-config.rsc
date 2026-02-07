#
# model = 750
# serial number = 4677029AEDF4
#
/interface ethernet
set [ find default-name=ether1 ] name=ether1-Wan
set [ find default-name=ether5 ] name=ether5-Lan
/system identity
set name=Master
/interface bridge
add name=MasterBridge
/interface bridge port
add bridge=MasterBridge interface=ether2 multicast-router=disabled
add bridge=MasterBridge interface=ether3 multicast-router=disabled
add bridge=MasterBridge interface=ether4 multicast-router=disabled
/ip address
add address=10.20.30.2/24 interface=ether5-Lan network=10.20.30.0
add address=172.20.1.1/24 interface=MasterBridge network=172.20.1.0
/ip cloud
set update-time=no
/ip dns
set allow-remote-requests=yes cache-max-ttl=1d servers=\
    1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4
/system clock
set time-zone-autodetect=no time-zone-name=Asia/Makassar
/system clock manual
set time-zone=+08:00
/system ntp client
set enabled=yes primary-ntp=202.65.114.202 secondary-ntp=212.26.18.41 \
    server-dns-names=asia.pool.ntp.org,id.pool.ntp.org
/ip pool
add name=dhcp_pool_master ranges=172.20.1.5-172.20.1.254
add name=dhcp_pool_lokal ranges=10.20.30.2-10.20.30.10
/ip dhcp-server
add address-pool=dhcp_pool_master disabled=no interface=MasterBridge name=\
    Dhcp-Master
add address-pool=dhcp_pool_lokal disabled=no interface=ether5-Lan name=\
    Dhcp-Lokal
/ip dhcp-server network
add address=10.20.30.0/24 comment="Lokal Network" dns-server=\
    1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4 gateway=10.20.30.1
add address=172.20.1.0/24 comment="Master Network" dns-server=\
    1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4 gateway=172.20.1.1
/ip dhcp-client
add comment=ISP disabled=no interface=ether1-Wan
/ip firewall nat
add action=masquerade chain=srcnat comment=ISP out-interface=ether1-Wan
/ip service
set telnet disabled=yes
set ftp disabled=yes
set ssh disabled=yes
/system reboot=yes

