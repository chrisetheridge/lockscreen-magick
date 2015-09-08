# Blurred Lockscreen Script

I made a very **simple** lockscreen script, which takes a screenshot of your current desktop and blurs it, and sets this as the lockscreen.

It overwrites your current lockscreen picture but does save it as `bak.png`, in the same directory as the screenshots.

### How to Use ###

Make a directory called `screenshots` in `~/tmp/screenshots`. Then run the script with `sudo`. Sudo is needed to overwrite the old lockscreen image.

### Configuration ###

You can change the percentage values that are used in the `convert` command. I suggest not going above **20%** for the `resize` command as it takes quite a while.

### Example Image ###
![Example image](http://i.imgur.com/87zBEq5.jpg)
