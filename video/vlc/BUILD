(

  if [[ $FFMPEG == "y" ]]; then
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
    export    CFLAGS="$CFLAGS -O3"   # -O3 safeguard.
    export  CXXFLAGS="$CXXFLAGS -O3"
    ./configure  $OPTS
    make -C libavcodec
    cd ..
    OPTS="$OPTS --enable-ffmpeg --with-ffmpeg-tree=./ffmpeg"
    echo "compiling with options: $OPTS"
  fi
  patch -p0 < ${SCRIPT_DIRECTORY}/configure.diff	&&
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var        \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install

) > $C_FIFO 2>&1
