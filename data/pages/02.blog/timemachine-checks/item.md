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

I use Time Machine on my Macs (5 in total) for a couple of years, actually I think right after it was released.

So far I never faced a big problem and when I needed it all files were there. Anyway I want to add another step now to check myself and not just trust the automatism behind it.



I know you can [ALT+Click] on the Time Machine icon and run the "Verify Backups" command. That is fine but I like it more detailed.

Another way is the command tmutil verifychecksums

The most detailed I found so far is the tmutil compare command. That will list every change, every added or delete files and their bytes.

I think a will run a script as background job once a week and it will start watching until a backup is started and then finished. Immediately after that it will run the  tmutil compare command and send me the result via mail.

This commands simply tells 0 or 1 if a backup is running or not.

tmutil status | awk '/Running/ {print $3}' | grep -o '[0-9]'

For testing I started with this small loop:

runnot=1;
while [ $runnot -eq '1' ]; 
do 
    tmstatus=$(tmutil status | awk '/Running/ {print $3}' | grep -o '[0-9]'); 
    if [ $tmstatus -eq '1' ]; then 
        echo "Backup is running"; 
        runnot=0;
        break;
    fi; 
    sleep 15;
done
But well, that's it for today, the result follows later.
