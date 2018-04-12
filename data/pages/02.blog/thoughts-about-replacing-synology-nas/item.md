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
I have a Synology 414 NAS. It is a 4-Bay NAS. I have an 8TB USB 3.0 drive attached and another Synology 2-Bay NAS with 2x 5TB for remote backup.

The speed and the maintenance is a bit limited I have to say and I am playing with the thought to switch to a FreeNAS system again. I was couple of years ago playing with a FreeNAS but not that seriously and the need was not there. But now the need for much space is here.

My wife is taking pictures (Link to Photo Homepage) and is filling a good amount of space on the hard drives (and backup drives).



Here I capture a couple of links and ideas from which I am inspired and which I might use for my own future FreeNAS system.



https://blog.brianmoses.net/2016/02/diy-nas-2016-edition.html
https://blog.brianmoses.net/2016/05/my-2016-diy-nas-upgrade.html
https://www.reddit.com/r/homelab/comments/5mdui3/freenas_diybuild_2017/
How to mirror the FreeNAS USB

https://blog.brianmoses.net/2016/04/mirroring-the-freenas-usb-boot-device.html
Interesting about 10GB Ethernet

https://blog.brianmoses.net/2016/06/building-a-cost-conscious-faster-than-gigabit-network.html
Info about FreeNAS

https://forums.freenas.org/index.php?resources/hardware-recommendations-guide.12/
https://www.ixsystems.com/docs/
http://doc.freenas.org/9.10/storage.html#scrubs
https://forums.freenas.org/index.php?threads/slideshow-explaining-vdev-zpool-zil-and-l2arc-for-noobs.7775/
Hardware I have selected so far for production:

Fractal FD-CA-DEF-R4-BL R4
Corsair CP-9020090-EU RMX Serie RM550X
Cooler Master Hyper 212 Evo
Noctua Tower Cooling NF-F12PWM
4x Western Digital Red 4TB
4x HGST Deskstar NAS 4TB
2x USB Flash drive
2x Intel DC S3700 100GB
Intel E3 1220v5
4x 16GB Samsung unbuffered ECC
Supermicro Mainboard X11SSL-CF
For a clone environment I choose little bit weaker hardware for the CPU, less memory, slightly different board and a different tower

NANOXIA Deep Silence 3
Corsair CP-9020090-EU RMX Serie RM550X
Cooler Master Hyper 212 Evo
Noctua Tower Cooling NF-F12PWM
3x Western Digital Red 4TB
3x HGST Deskstar NAS 4TB
2x USB Flash drive
1x Intel DC S3700 100GB
Intel Core i3
2x 16GB Samsung unbuffered ECC
Supermicro Mainboard X11SSM-F


But I wait until FreeNAS 10 to build first the test server (the second one) and see how it's performing.
