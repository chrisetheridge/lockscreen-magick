#!/bin/bash

# check if convert (image magick) is installed
if [ -z $(which convert) ]; then
    echo 'You need to install ImageMagick'
    echo "This needs the command 'convert' from it."
    exit 1
fi

# variables
SCRIPTS_DIR='/scripts'
use_screenshot=false
random_magic=false
default_magic=true
countown=0

# get params

while :; do
    case $1 in
        -h|-\?|--help)
            # help
            exit
            ;;
        -e|--effect)
            if [ -n "$2" ]; then
                # imagemagick effect opt
                shift
            else
                printf 'ERROR: "--file" requires a non-empty option argument.\n' >&2
                exit 1
            fi
            ;;
        --default)
            # default
            ;;
        -s|--script)
            # specify script
            ;;
        -t|--timeout)
            # specify some timeout
            ;;
        -o|--output)
            # specify some output file
            ;;
        -r|--random)
            # random
            ;;
        -i|--input)
            # input image
            ;;
        --)
            shift
            break
            ;;
        -?*)
            printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
            ;;
        *)               # Default case: If no more options then break out of the loop.
            break
    esac

    shift
done


# check if input image or screenshot


# timeout if timeout option

# check effects

STORAGE_DIR=${HOME}'/tmp/screenshots'

# check we have a storage dir / storage dir provided
test -e ${STORAGE_DIR} || mkdir -p ${STORAGE_DIR}

# remove old screen
rm -r ${STORAGE_DIR}/screen.png

# take a screenshot
screencapture ${STORAGE_DIR}/screen.png

# cd into screenshots dir
cd ${STORAGE_DIR}/

# backup old lock screen picture
# check if it already exists to not overwrite
if [ !  -f ${STORAGE_DIR}/bak.png ]; then
    cp /Library/Caches/com.apple.desktop.admin.png ${STORAGE_DIR}/bak.png
fi

# replace the old lock screen picture with the new blurred one
cp com.apple.desktop.admin.png /Library/Caches/com.apple.desktop.admin.png

# lock the screen
/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
