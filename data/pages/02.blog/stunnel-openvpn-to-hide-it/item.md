---
taxonomy:
    category:
        - linux
        - mac
    tag:
        - shell
blog_url: /blog
show_sidebar: true
show_breadcrumbs: true
show_pagination: true
---
VPN is helpful to access data at home, to make it little bit more difficult to be traced back maybe to go around some limitations in the current network.. for whatever reason, many people use it.

Here I just want to shortly mention how it was for me.

I used Sophos UTM and now Sophos XG at home. It has couple of VPN protocols integrated. I prefer the VPN via SSL (which is OpenVPN). Unfortunately the OpenVPN is recognizable as not real SSL traffic and therefore it can be easily blocked by other firewalls (probably via DPI deep package inspection). That is the case for a place where I am quite often..



The workaround is to use stunnel ( = ssl tunnel). It creates a tunnel between a server and a client and sends other traffic via that tunnel. It is plain SSL traffic which could be just a visit to a homepage.

I put the port to 443 for the stunnel server because most other ports a blocked or don't allow SSL to pass. I also have a proxy I need to use to leave the network I am in.

The config

Here is my config, which works fine for around 2 years. I use stunnel on a Synology, hopefully soon in a jail or VM on FreeNAS 10

Server config:

cert = /opt/etc/stunnel/cert.pem
#fips = no will use it again in the future but the old version doesn't support it
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
client = n
output = /var/log/stunnel4/stunnel.log

[VPN]
local = 192.168.X.XX
accept = 192.168.X.XX:XXX
connect = 192.168.X.XX:XXXX
TIMEOUTclose = 0
#ciphers = PSK for authorization, future version
#PSKsecrets = psk.txt for authorization, future version
Client config:

cert = stunnel.pem

compression = zlib
fips = no
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[VPN]
client = yes
accept = 1337
protocol = connect
connect = proxy.company.net:80
protocolHost = mydynamicdomain.uri:443
PSKsecrets = psk.txt
Here are some information regarding authentication for the SSL encryption, to prevent MITM attacks: https://www.stunnel.org/auth.html
