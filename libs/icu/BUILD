(

  cd  source  &&
  chmod  u+x  runConfigureICU  configure  install-sh  &&
  
  ./runConfigureICU  LinuxRedHat  \
            --prefix=/usr         \
            $OPTS                 &&

  make             &&
  prepare_install  &&
  make  install
  
) > $C_FIFO 2>&1
