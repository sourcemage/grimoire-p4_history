(

  # aspell cannot be compiled with "speedy"
  CFLAGS=`echo $CFLAGS | sed "s/-O3/-O2/"`  &&
  CXXFLAGS="$CFLAGS"                        &&
  export  CFLAGS                            &&
  export  CXXFLAGS                          &&

  # aspell doesn't include these, which just have to exist
  touch /root/.aspell.conf           &&
  touch /etc/aspell.conf             &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make  install  

) > $C_FIFO 2>&1
