#!/bin/bash
# Lockscreen script

# check if convert (image magick) is installed
if [ -z $(which convert) ]; then
    echo 'You need to install ImageMagick'
    echo "This needs the command 'convert' from it."
    exit 1
fi

STORAGE_DIR=${HOME}'/tmp/screenshots'
test -e ${STORAGE_DIR} || mkdir -p ${STORAGE_DIR}


# remove old screen
rm -r ${STORAGE_DIR}/screen.png

# take a screenshot
screencapture ${STORAGE_DIR}/screen.png

# cd into screenshots
cd ${STORAGE_DIR}/

# Blur the screenshot image using ImageMagick
# com.apple.desktop.admin.png is the name for the login screen
convert -resize 5% screen.png screensized.png
convert -resize 1000% screensized.png com.apple.desktop.admin.png

# backup old lock screen picture
# check if it already exists to not overwrite
if [ !  -f ${STORAGE_DIR}/bak.png ]; then
    cp /Library/Caches/com.apple.desktop.admin.png ${STORAGE_DIR}/bak.png
fi

# replace the old lock screen picture with the new blurred one
cp com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png

# lock the screen
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
