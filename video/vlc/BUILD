# shouldn't be needed with gcc 3.3 anymore
#export   CFLAGS="${CFLAGS/pentium4/i686}"          &&
#export   CFLAGS="${CFLAGS/\-msse2/}"               &&


cd  mpeg2dec-$LIBMPEG2_VERSION          &&
./configure  --disable-sdl --without-x  &&
make                                    &&
export OPTS="$OPTS --enable-libmpeg2 --with-libmpeg2-tree=./mpeg2dec-$LIBMPEG2_VERSION"  &&
cd  $SOURCE_DIRECTORY  &&

if  [  "$FFMPEG"  =  "y"  ];  then
  export OPTS="$OPTS --enable-ffmpeg"
fi  &&

default_build
