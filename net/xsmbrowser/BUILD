(

  sedit 's!^\(set default_pixmaps_dir\).*!\1 "/usr/share/pixmaps/xsmbrowser"!' \
      xsmbrowser &&

  prepare_install  &&

  mkdir  -p  /usr/share/pixmaps/xsmbrowser/  &&
  install  -m 644  pixmaps/*  /usr/share/pixmaps/xsmbrowser/  &&
  install  -m 755  xsmbrowser  /usr/bin/

) > $C_FIFO 2>&1
