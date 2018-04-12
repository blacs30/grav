---
taxonomy:
    category:
        - linux
        - mac
        - blog
    tag:
        - shell
blog_url: /blog
show_sidebar: true
show_breadcrumbs: true
show_pagination: true
---

This is just a short line of code but it helps a lot.
All it does is adding a network user (or group) to the local admin group.
This works for Active Directory as well as OpenDirectory.

dseditgroup -o edit -n /Local/Default -u localadmin -p -a networkuser -t user admin



Here is the Apple documentation to it.

https://support.apple.com/en-us/HT202112
