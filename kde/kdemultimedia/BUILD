(
  bunzip2 -dc $SCRIPT_DIRECTORY/kdemultimedia-kernelheaders.patch.bz2 | patch -p1 &&

  ./configure  --prefix=${INSTALL_ROOT}/usr        \
               --sysconfdir=${INSTALL_ROOT}/etc    \
               --localstatedir=${INSTALL_ROOT}/var \
               --disable-debug      \
	       --enable-final       \
	       $OPTS                &&
#NON ISO C STUFF                    
  for i in kaudiocreator kioslave/audiocd kscd/libwm mpeglib/lib/input noatun/modules/winskin/vis
  do sedit "s/-ansi//g" $i/Makefile  &&
     sedit "s/-pedantic//g" $i/Makefile
  done                              &&  

  make                              &&
  prepare_install                   &&
  make    install

) > $C_FIFO 2>&1
