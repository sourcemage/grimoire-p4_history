(

  ./configure      &&
  make             &&
  if spell_installed xfree86; then
    cd Xvnc
    make World
    cd ..
  fi
  prepare_install  &&
  ./vncinstall   /usr/bin              &&
  mkdir  -p      /usr/bin/vnc.classes  &&
  cp  classes/*  /usr/bin/vnc.classes

) > $C_FIFO 2>&1



