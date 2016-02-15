# Lockscreen Magick

Lockscreen Magick is a script that uses [ImageMagick](http://www.imagemagick.org/script/binary-releases.php) to take a
screenshot (or input file) of your desktop and add effects to it. It
then takes this transformed image and sets it as the Login Background,
which is effectively your lockscreen.

Currently only supports OSX.

It overwrites your current lockscreen picture but does save it as `bak.png`, in the same directory as the screenshots.

### How to Use ###

Make a directory called `screenshots` in `~/tmp/screenshots`. Then run the script with `sudo`. Sudo is needed to overwrite the old lockscreen image.

### Configuration ###

You can change the percentage values that are used in the `convert` command. I suggest not going above **20%** for the `resize` command as it takes quite a while.

### Dependencies ###

Make sure to install `ImageMagick`.

You can installed with brew - `brew install ImageMagick`

Or go to the [site](http://www.imagemagick.org/script/binary-releases.php)

### Example Image ###
![Example image](http://i.imgur.com/87zBEq5.jpg)


### Todo ###

- Introduce new ways to distort the image
- Add parameters for blur / distort amount
- Add optiona parameter for an additional output directory so that the
screenshot can be saved elsewhere
- Add scrot-like time out / count down function
- Add 'random' feature
