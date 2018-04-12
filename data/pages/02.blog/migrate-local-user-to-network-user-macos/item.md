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
Applied to macOS Sierra 10.12

As I have more and more Macs now in the Network and I want to have more centralised managed I setup OpenDirectory in the Server.app. The problem then was how I can move the local users to be network users. I didn't want to risk to move all data and settings.

One way which worked and I used is the following:

Make sure the user is logged out.
Backup the existing user plist file.
sudo -s 
Password:
cd /var/db/dslocal/nodes/Default/users/ 
mv username.plist /Users/Shared/
This did move the plist file to /Users/Shared and can be removed after it was confirmed that the network users works fine.

You can run id username  the result shows that the user is still a local one. The opendirectoryd service which runs locally on the client server has to be restarted.

Restart the opendirectoryd service
Do it with killall opendirectorydand check again with  id username now the result should be different and show that the users belongs to OpenDirectory or AD or LDAP.
