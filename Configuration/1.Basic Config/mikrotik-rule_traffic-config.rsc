#
# model = 750
# serial number = 4677029AEDF4
#
/ip firewall address-list
add address=172.20.1.0/24 list=lokal
add address=192.168.1.0/24 list=lokal
add address=192.168.1.0/24 list=kecuali
add address=192.168.1.1 list=kecuali
add address=172.20.1.0/24 list=kecuali
add address=10.20.30.0/24 list=kecuali
/ip firewall raw
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=3m chain=prerouting comment=GAME disabled=yes \
    dst-address-list=!kecuali dst-port=\
    !21,22,23,53,80,81,443,853,5353,8000,8008,8080,8081,8090,8443 protocol=\
    tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=3m chain=prerouting disabled=yes dst-address-list=\
    !kecuali dst-port=\
    !3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 \
    protocol=tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=3m chain=prerouting disabled=yes dst-address-list=\
    !kecuali dst-port=\
    !21,22,23,53,80,81,443,853,5353,8000,8008,8080,8081,8090,8443 protocol=\
    udp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=3m chain=prerouting disabled=yes dst-address-list=\
    !kecuali dst-port=\
    !3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 \
    protocol=udp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting comment=YOUTUBE content=\
    .youtube.com dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting content=.googlevideo.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting content=.ytimg.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting content=\
    yt3.googleusercontent.com dst-address-list=!kecuali src-address-list=\
    lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting content=yt3.ggpht.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP STREAM" \
    address-list-timeout=3m chain=prerouting content=youtubei. \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting comment=TIKTOK content=.tiktok. \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting content=.tiktokv. \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting content=.tiktokcdn.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting content=ibyteimg.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting comment=FACEBOOK content=\
    .facebook. dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP SOSMED" \
    address-list-timeout=3m chain=prerouting content=.fbcdn. \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting comment=CHAT/VOiP \
    dst-address-list=!kecuali dst-port=\
    3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 protocol=\
    tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting dst-address-list=!kecuali \
    dst-port=3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 \
    protocol=udp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting content=.whatsapp.com \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting content=.whatsapp.net \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting content=g.whatsapp.net \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting content=v.whatsapp.net \
    dst-address-list=!kecuali src-address-list=lokal
add action=add-dst-to-address-list address-list="IP CHAT/VOiP" \
    address-list-timeout=3m chain=prerouting content=mmg.whatsapp.net \
    dst-address-list=!kecuali src-address-list=lokal
/ip firewall mangle
add action=change-ttl chain=postrouting comment="Hotspot Protect" \
    dst-address=172.20.1.0/24 new-ttl=set:1 out-interface=MasterBridge \
    passthrough=no
add action=mark-connection chain=prerouting comment=ICMP new-connection-mark=\
    ICMP passthrough=yes protocol=icmp
add action=mark-connection chain=prerouting dst-port=53,5353,853 \
    new-connection-mark=ICMP passthrough=yes protocol=tcp
add action=mark-connection chain=prerouting dst-port=53,5353,853 \
    new-connection-mark=ICMP passthrough=yes protocol=udp
add action=mark-packet chain=forward connection-mark=ICMP in-interface=\
    ether1-Wan new-packet-mark="ICMP DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark=ICMP new-packet-mark=\
    "ICMP UP" out-interface=ether1-Wan passthrough=no
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=5m chain=prerouting comment=GAME dst-address-list=\
    !kecuali dst-port=\
    !21,22,23,53,80,81,443,853,5353,8000,8008,8080,8081,8090,8443 protocol=\
    tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=5m chain=prerouting dst-address-list=!kecuali \
    dst-port=!3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 \
    protocol=tcp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=5m chain=prerouting dst-address-list=!kecuali \
    dst-port=!21,22,23,53,80,81,443,853,5353,8000,8008,8080,8081,8090,8443 \
    protocol=udp src-address-list=lokal
add action=add-dst-to-address-list address-list="IP GAME" \
    address-list-timeout=5m chain=prerouting dst-address-list=!kecuali \
    dst-port=!3478,4244,5222,5223,5228,5288,5242,5349,34784,45395,50318,59234 \
    protocol=udp src-address-list=lokal
add action=mark-connection chain=prerouting dst-address-list="IP GAME" \
    new-connection-mark="KONEKSI GAME" passthrough=yes src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI GAME" \
    in-interface=ether1-Wan new-packet-mark="GAME DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI GAME" \
    new-packet-mark="GAME UP" out-interface=ether1-Wan passthrough=no
add action=mark-connection chain=prerouting comment=STREAM dst-address-list=\
    "IP STREAM" new-connection-mark="KONEKSI STREAM" passthrough=yes \
    src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI STREAM" \
    in-interface=ether1-Wan new-packet-mark="STREAM DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI STREAM" \
    new-packet-mark="STREAM UP" out-interface=ether1-Wan passthrough=no
add action=mark-connection chain=prerouting comment=SOSMED dst-address-list=\
    "IP SOSMED" new-connection-mark="KONEKSI SOSMED" passthrough=yes \
    src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI SOSMED" \
    in-interface=ether1-Wan new-packet-mark="SOSMED DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI SOSMED" \
    new-packet-mark="SOSMED UP" out-interface=ether1-Wan passthrough=no
add action=mark-connection chain=prerouting comment=CHAT/VOiP \
    dst-address-list="IP CHAT/VOiP" new-connection-mark="KONEKSI CHAT/VOiP" \
    passthrough=yes src-address-list=lokal
add action=mark-packet chain=forward connection-mark="KONEKSI CHAT/VOiP" \
    in-interface=ether1-Wan new-packet-mark="CHAT/VOiP DOWN" passthrough=no
add action=mark-packet chain=forward connection-mark="KONEKSI CHAT/VOiP" \
    new-packet-mark="CHAT/VOiP UP" out-interface=ether1-Wan passthrough=no
/queue tree
add name="GLOBAL ALL" parent=global queue=default
add max-limit=80M name=DOWNLOAD parent="GLOBAL ALL" queue=\
    pcq-download-default
add max-limit=30M name=UPLOAD parent="GLOBAL ALL" queue=pcq-upload-default
add limit-at=70M max-limit=70M name="4.ALL TRAFIC DOWN" parent=DOWNLOAD \
    priority=3 queue=pcq-download-default
add limit-at=25M max-limit=25M name="4.ALL TRAFIC UP" parent=UPLOAD priority=\
    3 queue=pcq-upload-default
add name="2. ICMP DOWN" packet-mark="ICMP DOWN" parent=DOWNLOAD priority=2 \
    queue=pcq-download-default
add name="2. ICMP UP" packet-mark="ICMP UP" parent=UPLOAD priority=2 queue=\
    pcq-upload-default
add name="1. GAME DOWN" packet-mark="GAME DOWN" parent=DOWNLOAD priority=1 \
    queue=pcq-download-default
add name="1. GAME UP" packet-mark="GAME UP" parent=UPLOAD priority=1 queue=\
    pcq-upload-default
add name="a. stream down" packet-mark="STREAM DOWN" parent=\
    "4.ALL TRAFIC DOWN" priority=3 queue=pcq-download-default
add name="a. stream up" packet-mark="STREAM UP" parent="4.ALL TRAFIC UP" \
    priority=3 queue=pcq-upload-default
add name="b. sosmed down" packet-mark="SOSMED DOWN" parent=\
    "4.ALL TRAFIC DOWN" priority=3 queue=pcq-download-default
add name="b. sosmed up" packet-mark="SOSMED UP" parent="4.ALL TRAFIC UP" \
    priority=3 queue=pcq-upload-default
add name="c. chat/voip down" packet-mark="CHAT/VOiP DOWN" parent=\
    "4.ALL TRAFIC DOWN" priority=3 queue=pcq-download-default
add name="c. chat/voip up" packet-mark="CHAT/VOiP UP" parent=\
    "4.ALL TRAFIC UP" priority=3 queue=pcq-upload-default
/queue simple
add name="ALL TRAFICK" packet-marks=\
    "STREAM DOWN,STREAM UP,SOSMED DOWN,SOSMED UP,CHAT/VOiP DOWN,CHAT/VOiP UP" \
    queue=default/default target=172.20.1.0/24,192.168.2.0/24
add name="1.CLIEN HOTSPOT" parent="ALL TRAFICK" priority=2/2 queue=\
    pcq-upload-default/pcq-download-default target=172.20.1.0/24
add name="2.CLIEN PPPOE" parent="ALL TRAFICK" priority=4/4 queue=\
    pcq-upload-default/pcq-download-default target=10.20.30.0/24
