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
This is a small script for AppleScript to change System preferences.

Below is one example on a slider and another on a checkbox.

This example set the tracking speed of the mouse

tell application "System Preferences"
    activate
end tell

tell application "System Events"
    tell process "System Preferences"
        click menu item "Mouse" of menu "View" of menu bar 1
        delay 2
        set theSlider to slider "Tracking speed" of window "Mouse"
        tell theSlider
            set sliderStatus to value of theSlider as number
            if sliderStatus is not 0 then set value of theSlider to 9 as number
            delay 1
        end tell
    end tell
end tell
This example disables the background download of updates.

tell application "System Preferences"
    activate
end tell

tell application "System Events"
    tell process "System Preferences"
        click menu item "App Store" of menu "View" of menu bar 1
        delay 1
        set theCheckbox to checkbox "Download newly available updates in the background" of window "App Store"
        tell theCheckbox
            set checkboxStatus to value of theCheckbox as boolean
            if checkboxStatus is true then click theCheckbox
            delay 1
        end tell
    end tell
end tell
If you didn't notice while running the scripts, macOS needs your approval to run the script. Without that the script could not run and not do anything.

And of course there are much more examples and tipps out in the world: http://macosxautomation.com
