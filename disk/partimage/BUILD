(
#  patch -p1 < $SCRIPT_DIRECTORY/partimage-0.6.1.patch &&
  sedit "/partimag.root/d" Makefile.am	&&
  ./autogen.sh 		&&
  touch mkinstalldirs	&&
  default_build
#  ./configure  --prefix=${INSTALL_ROOT}/usr         \
#               --sysconfdir=/etc     \
#               --localstatedir=/var  \
#               --disable-debug       \
#               --enable-final        \
#               $OPTS                 &&
#  make                               &&
#  prepare_install                    &&
#  make    install

) > $C_FIFO 2>&1
