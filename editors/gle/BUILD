(

  cp  config.i  config.i.bak
  sed 's/\/usr\/local\/lib/\/usr\/lib/' < config.i > config.i.new
  cp  config.i.new  config.i
  sed 's/\/usr\/local\/bin\/gle/\/usr\/share\/gle/' < config.i > config.i.new
  cp  config.i.new  config.i

  make                                         &&
  prepare_install                              &&
  make install                                 &&
  make test                                    &&
  cp  /var/spool/sorcery/$SOURCE2  /usr/doc    &&
  ln -s  /usr/share/gle/gle_ps  /usr/bin

) > $C_FIFO 2>&1
