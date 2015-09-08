#!/bin/bash
# Lockscreen script

# remove old screen
rm -r ~/tmp/screenshots/screen.png

# take a screenshot
screencapture ~/tmp/screenshots/screen.png

# cd into screenshots
cd ~/tmp/screenshots/

# Blur the screenshot image using ImageMagick
# NSTexturedFullScreenBackgroundColor.png is the name for the login screen
convert -resize 5% screen.png screensized.png
convert -resize 1000% screensized.png com.apple.desktop.admin.png

# backup old lock screen picture
cp /Library/Caches/com.apple.desktop.admin.png ~/tmp/screenshots/bak.png

# replace the old lock screen picture with the new blurred one
cp com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png

# lock the screen
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
