export   CFLAGS="${CFLAGS/pentium4/i686}"          &&
export   CFLAGS="${CFLAGS/\-msse2/}"               &&

if  [  "$FFMPEG"  =  "y"  ];  then
  export CPPFLAGS="$CPPFLAGS -I/usr/include/ffmpeg"  &&
  export OPTS="$OPTS --enable-ffmpeg"
fi  &&

default_build
