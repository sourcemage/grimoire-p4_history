(

  unpack $SOURCE_CACHE/$SOURCE2 ${MD5[1]} && 
  tail -n 55 $SOURCE_CACHE/$SOURCE2 | head -n 52 | 
  sed -e 's/word$/word lists.\\n"     , stderr);/' | 
  grep -v '^lists' | grep -vx '' | patch prog/compress.c &&

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

