(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  if spell_installed xfree86; then
    cd Xvnc
    make World
    cd ..
  fi
  prepare_install  &&
  ./vncinstall   /usr/bin              &&
  mkdir  -p      /usr/bin/vnc.classes  &&
  cp  java/*  /usr/bin/vnc.classes

) > $C_FIFO 2>&1



