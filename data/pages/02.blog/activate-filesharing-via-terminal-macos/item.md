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
The other day I wanted to access the hard disk of one of the Macs I manage via SMB or AFP (as SMB is now default with macOS Sierra I prever that one). I never had File Sharing activated on that Mac though, the user was working and I didn't want to interrupt him.

Google was my friend and helper and what helped were these 2 lines command lines wich I executed via the UNIX command tool of ARD (Apple Remote Desktop). The last command at the end is to disable the File Sharing.

sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist

sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server.plist EnabledServices -array disk
And to disable it again, - unload it.

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plists
To run this command via ARD tell it to use "root" as user. It works without asking for a password though root is not explicitly enabled on the target system.
