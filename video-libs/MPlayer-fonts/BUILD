(

  if  [  -d  /usr/share/mplayer/font  ]
  then
    rm  -rf  /usr/share/mplayer/font
  fi                                   &&
  prepare_install                      &&
  mkdir  -p  /usr/share/mplayer/fonts  &&
  cp  -R  *  /usr/share/mplayer/fonts  &&
  ln  -sf   /usr/share/mplayer/fonts   \
            /usr/share/mplayer/font

) > $C_FIFO 2>&1
