(

  patch -p0 < $SCRIPT_DIRECTORY/configure.in.shared-ffmpeg.patch  &&
  if  spell_installed  ffmpeg-cvs;  then
    patch -p1 < $SCRIPT_DIRECTORY/ffmpeg-cvs.patch
  fi  &&
  autoconf                                 &&
  ./configure  --prefix=/usr               \
               --sysconfdir=/etc           \
               --localstatedir=/var        \
               --without-mysql             \
               --without-pgsql             \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  (
    install  motion       /usr/bin       &&
    install  motion.1     /usr/man/man1  &&
    install  motion.conf  /etc
  )

) > $C_FIFO 2>&1
