(

  xmkmf            &&
  make  World      &&
  cd    Xvnc       &&
  ./configure      &&
  make             &&
  prepare_install  &&
  cd    ..         &&
  ./vncinstall   /usr/bin /usr/man       &&
  mkdir  -p      /usr/share/vnc.classes  &&
  cp  classes/*  /usr/share/vnc.classes  &&

  # Lets lower the default depth, 24 is a bit much for network
  # Fix some paths, give it a proper resolution
  sedit  's:1016x768:1024x768:'                                               /usr/bin/vncserver  &&
  sedit  's:24:16:'                                                           /usr/bin/vncserver  &&
  sedit  's:/usr/local/vnc/classes:/usr/share/vnc.classes:'                   /usr/bin/vncserver  &&
  sedit  's:unix/\:7100:/usr/lib/X11/fonts/misc/,/usr/lib/X11/fonts/75dpi/:'  /usr/bin/vncserver  &&
  sedit  's:"X":`hostname`:'                                                  /usr/bin/vncserver

) > $C_FIFO 2>&1
