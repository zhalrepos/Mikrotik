#
# model = 750
# serial number = 4677029AEDF4
#

/ip hotspot profile
add dns-name=masterhotspot.com hotspot-address=172.20.1.1 login-by=\
    cookie,http-chap,http-pap,mac-cookie name=Hotspot-Server-Profile
/ip hotspot
add address-pool=dhcp_pool_master addresses-per-mac=1 disabled=no interface=\
    MasterBridge name=Hotspot-Server profile=Hotspot-Server-Profile
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat comment="masquerade hotspot network" \
    src-address=172.20.1.0/24
/ip hotspot user profile
add address-pool=dhcp_pool_master insert-queue-before=bottom \
    mac-cookie-timeout=1d name="Home Default" rate-limit=512k/512k
/ip hotspot user
add name=admin password=iamrizalakbar
