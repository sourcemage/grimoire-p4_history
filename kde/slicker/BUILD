(
  cd $BUILD_DIRECTORY				&&
  cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/slicker co slicker	&&
  cd $SOURCE_DIRECTORY				&&
  make -f Makefile.cvs				&&
  ./configure  --prefix=/usr            \
               --sysconfdir=/etc/ssh    \
               --with-md5-passwords     \
               --mandir=/usr/share/man  \
               $OPTS                    	&&
  make						&& 
  prepare_install				&&
  make install
) > $C_FIFO 2>&1

