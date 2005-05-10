if  [  "$EVAS_BUFFER"  =  "y"  ];  then
  OPTS="$OPTS  --enable-buffer"
else
  OPTS="$OPTS  --disable-buffer"
fi  &&

if  [  "$EVAS_SCALE_SAMPLE"  =  "y"  ];  then
  OPTS="$OPTS  --enable-scale-sample"
else
  OPTS="$OPTS  --disable-scale-sample"
fi  &&

if  [  "$EVAS_SCALE_SMOOTH"  =  "y"  ];  then
  OPTS="$OPTS  --enable-scale-smooth"
else
  OPTS="$OPTS  --disable-scale-smooth"
fi  &&

if  [  "$EVAS_YUV"  =  "y"  ];  then
  OPTS="$OPTS  --enable-convert-yuv"
else
  OPTS="$OPTS  --disable-convert-yuv"
fi  &&

if  [  "$EVAS_DITHER_MASK"  =  "y"  ];  then
  OPTS="$OPTS  --enable-small-dither-mask"
else
  OPTS="$OPTS  --disable-small-dither-mask"
fi  &&

if [ "$EVAS_CVS" = "y" ]; then
  ./autogen.sh   &&
  default_build
else
  default_build
fi
