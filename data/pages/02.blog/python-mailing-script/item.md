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
# Python Mailing Script HowTo

Background:
I have some macOS Server but Mail is not configured nor used. Some LaunchDaemon jobs run every night, e.g. for backups and I want to receive mails from them. Python is already installed on every Mac so the solution to enable mailing via python is near at hand.

Run the following script in this way:
echo "This is the body content" | python /PATH_TO_THE_SCRIPT/mailing.py $MAIL_RECPT1,$MAIL_RECPT2,$MAIL_RECPT3 "SUBJECT_TEXT" "$ATTACHMENT"

Adjust the values inside the script:

fromaddr enter your sender address
IP_OR_SMTP_HOSTNAME and PORT enter the smtp server (can be also google or an internal relay)
activate STARTTLS if required by uncommenting server.starttls() and server.login(fromaddr, "YOUR PASSWORD")
adjust the PASSWORD if it is used

```python
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText
from email.MIMEBase import MIMEBase
from email import encoders
import sys
import os.path

fromaddr = "sender@example.com"

if len(sys.argv) > 1:
    toaddr = sys.argv[1]
else:
    print('You have to specifiy the mail receiver as first subject')
    quit()

if len(sys.argv) > 2:
    subjectContent = sys.argv[2]
else:
    print('You have to specifiy the subject as second parameter')
    quit()

msg = MIMEMultipart()

msg['From'] = fromaddr
msg['To'] = toaddr
#msg['Subject'] = "[ALERT] Postgres Dump from localhost failed]"
msg['Subject'] = subjectContent

#body = "[ALERT] Postgres Dump from localhost] failed"
body = sys.stdin.readlines()
for b in body:
    msg.attach(MIMEText(b, 'plain'))

if len(sys.argv) > 3:
    att_file = sys.argv[3]
    attachment = open(att_file, "rb")
    filename = os.path.basename(att_file)
    part = MIMEBase('application', 'octet-stream')
    part.set_payload((attachment).read())
    encoders.encode_base64(part)
    part.add_header('Content-Disposition', "attachment; filename= %s" % filename)
    msg.attach(part)

server = smtplib.SMTP('IP_OR_SMTP_HOSTNAME', PORT)
#### starttls is optional here
# server.starttls()
# server.login(fromaddr, "YOUR PASSWORD")
text = msg.as_string()
server.sendmail(fromaddr, toaddr.split(","), text)
server.quit()
```
