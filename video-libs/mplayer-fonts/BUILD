(

  MPFONTDIR=/usr/share/mplayer/fonts
  if  [  -d  /usr/share/mplayer/font  ]
  then
    rm  -rf  /usr/share/mplayer/font
  fi                                   &&
  prepare_install                      &&
  mkdir  -p  $MPFONTDIR                &&
  cp  -R  *  $MPFONTDIR                &&
  ln  -sf   $MPFONTDIR/font-arial-iso-8859-1/font-arial-18-iso-8859-1  \
            /usr/share/mplayer/font

) > $C_FIFO 2>&1
