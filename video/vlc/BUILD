export   CFLAGS="${CFLAGS/pentium4/i686}"          &&
export   CFLAGS="${CFLAGS/\-msse2/}"               &&

export CPPFLAGS="$CPPFLAGS -I/usr/include/ffmpeg"  &&

patch -p1 < ${SCRIPT_DIRECTORY}/vlc.diff	   &&

default_build
