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
I just had a MacBook Pro from the year 2011 which had some trouble booting.

After a couple of Disk Repairs which failed at first and then ran successfully the Mac booted again.

So far so good. I wanted to be sure that the hardware in general is OK and therefore wanted to start the Apple hardware test (AHT)

For that model though I would need the DVD 2 to run the AHT. Yes, there is an online version which I can start by holding "option+D" on boot.

Well, that doesn't go far. The error 2105D appears which doesn't help much.

Thankfully, there is easy and fast help on github for that problem. Look here: https://github.com/upekkha/AppleHardwareTest

Just download the correct version and create a bootable USB flash drive as written in the instructions on the github page.

Plugin the flash drive, start the Mac and hold "option". Then choose the flash drive with the name "AHT" (if you followed the instructions it will have that label) and run the Apple Hardware Test.
