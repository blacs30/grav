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
# Let Windows use the Open Directory user authentication

Tested with Windows 7 and 10
This is a short guide on how to configure Windows to use a third party tool to connect to Open Dirctory and be able to login with the OD users.
Additionally auto logon should be activated for easier use.

The pGina fork works very well: http://mutonufoai.github.io/pgina/

Download and install the Software. Choose the latest version (here 3.9.9.7)

Use following settings:

General:

Unlock: User original username to unlock computer
Login: Display last user name in logon Screen
Plugin Selection:

LDAP:
Authentication
LDAP Hosts: od.lis.priv
LDAP Port: 636, Use SSL
Search DN: dc=osxserver01,dc=lis,dc=priv
User Dn Pattern: uid=%u,cn=users,dc=osxserver01,dc=od,dc=lis,dc=priv
Gateway
Always add to local group "Users"
Plugin Order:

LDAP first
Activate Autologin for a user with password

from the "run" window or command line open the User Accounts dialog by typing "netplwiz"
select the user which should automatically login
uncheck the checkbox at the top with name "Users must enter a user name and password to use this computer"
click "OK" and type the password in the opened dialog.
Hide specific users from the logon screen

Open the Windows Registry with Administrative privileges(command: regedit)
Navigate to: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\
Create a new Key (Folder) with name: SpecialAccounts
Create another new Key (Folder) with name: UserList
Create in the UserList Key a new DWORD (32-Bit) entry.
a) The name should be the user to hide
b) The value is either 0 to hide or 1 to show the user in the logon screen
The info was found here: Computerperformance.co.uk
