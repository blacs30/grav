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
# Prepare the server

Open the server.app once but don't change anything. Just let it prepare for its work. First as a server it should have a static IP for the computer. After that set the hostname, computername and localhostname with help of the scutil tool

sudo scutil --set HostName pm.example.com
sudo scutil --set ComputerName pm.example.com
sudo scutil --set LocalHostName pm
Lets check with sudo changeip -checkhostname if the result is success. The changeip command is only available after the Server.app has done is initial configuration.

Configuring Profile Manager

Click on Profile Manager in the Services Group on the left side. You can switch it on already. Wait until the status is green.

Notice that the "Device Management" still says Disabled. To change that click the "configure" button below it.

The Profile Manager sets up the Open Directory during the process.

If you get an error that your hostname cannot be resloved check if you might need to tweak some DNS related settings.

Enter the asked information and register with an Apple ID for receiving a push certificate.

Use the Profile Manager

You can then open the web interface with the two buttons "Open in Safari" on the Profile Manager dialog.

More information is available here: krypted.com
