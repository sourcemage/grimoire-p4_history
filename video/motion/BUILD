(

    summon ffmpeg &&
    FFMPEGVERSION=`gaze DETAILS ffmpeg | grep VERSION= | cut -d= -f 2`  &&
    FFMPEGSOURCE=`gaze DETAILS ffmpeg | grep SOURCE=  | cut -d= -f 2`  &&
    echo "ffmpeg version: $FFMPEGVERSION"
    echo "ffmpeg source : $FFMPEGSOURCE"
    FFMPEGSOURCE=`echo $FFMPEGSOURCE| sed s/\\$SPELL/ffmpeg/`           &&
    FFMPEGSOURCE=`echo $FFMPEGSOURCE| sed s/\\$VERSION/$FFMPEGVERSION/` &&
    echo "unpacking $FFMPEGSOURCE ..."
    unpack $FFMPEGSOURCE
    echo "building ffmpeg-$FFMPEGVERSION ..."
    cd ffmpeg
    ./configure
    make -C libavcodec
    cd ..
    OPTS="$OPTS --with-libavcodec=./ffmpeg/libavcodec"
    echo "compiling with options: $OPTS"
  
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var        \
               --without-mysql             \
               --without-pgsql             \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install

) > $C_FIFO 2>&1
