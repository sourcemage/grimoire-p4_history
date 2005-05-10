(

  # patch setup to show less menue options
  # and to skip menue if config is allready there
  patch -p0 < $SCRIPT_DIRECTORY/setup.diff &&

  if  [  -f   $CONFIG_CACHE/lirc.config  ];  then
    cp $CONFIG_CACHE/lirc.config .setup.config
  else
    ./setup.sh &&
    cp .setup.config $CONFIG_CACHE/lirc.config
  fi

  ./setup.sh &&
  ./configure.sh --build=$BUILD        \
                 --prefix=/usr         \
                 --sysconfdir=/etc     \
                 --localstatedir=/var  \
                 $OPTS                 &&
  make                                 &&
  make    install                      &&
  prepare_install                      &&
  make    install
  # seems to be a bug in make install, which installs module only correct if done 2 times
) > $C_FIFO 2>&1
