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
I use Devonthink on macOS for many years already. It is a great help with all the paper stuff. The first thing when any letter comes into my home is to scan it. The scanner saves to file to FTP and a Server has mounted that folder. A folder action in macOS is checking if a new file appears.

All that is quite common I guess. I like the function from the delivered script "Import, OCR, Delete" - except the Delete. I want an archive folder an see which documents have been scanned and OCRed.

I modified that Apple Script slightly. Here is my version:

```
-- DEVONthink - Import, OCR & Delete.applescript
-- Created by Christian Grunenberg on Fri Jun 18 2010.
-- Modified by C. Lisowski Jan 2017
-- Copyright (c) 2010-2014. All rights reserved.

on adding folder items to this_folder after receiving added_items
  set archiveFolder to (this_folder & "archive:") as text
  
  try
    if (count of added_items) is greater than 0 then
      tell application id "DNtp" to launch
      repeat with theItem in added_items
        set lastFileSize to 0
        set currentFileSize to 1
        repeat while lastFileSize ≠ currentFileSize
          delay 0.5
          set lastFileSize to currentFileSize
          set currentFileSize to size of (info for theItem)
        end repeat
        
        try
          set thePath to theItem as text
          if thePath does not end with ".download:" then
            tell application id "DNtp"
              set theRecord to ocr file thePath to incoming group
              if exists theRecord then tell application "Finder" to move theItem to (contents of archiveFolder)
            end tell
          end if
        end try
      end repeat
    end if
  end try
end adding folder items to
```
