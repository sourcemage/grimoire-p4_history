(

  sedit  "s:Attachements:Attachments:"  modules/demux/mkv.cpp  &&

  cd  mpeg2dec-$LIBMPEG2_VERSION          &&
  ./configure  --disable-sdl --without-x  &&
  make                                    &&
  export OPTS="$OPTS --enable-libmpeg2 --with-libmpeg2-tree=./mpeg2dec-$LIBMPEG2_VERSION"  &&
  cd  $SOURCE_DIRECTORY  &&

  if  [  "$FFMPEG"  =  "y"  ];  then
    export OPTS="$OPTS --enable-ffmpeg"
  fi  &&
  if  [  "$JOYSTICK"  =  "y"  ];  then
    export OPTS="$OPTS --enable-joystick"
  fi  &&
  if  [  "$MOZILLA"  =  "y"  ];  then
    export OPTS="$OPTS --enable-mozilla"
  fi  &&

  export OPTS="$OPTS --disable-dependency-tracking --enable-release"
  default_build

) > $C_FIFO 2>&1
