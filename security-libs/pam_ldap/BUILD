(
  aclocal                            &&
  autoheader                         &&
  libtoolize  --copy  --force        &&
  automake  --add-missing            &&
  autoconf                           &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --libdir=/lib         \
	       $OPTS		     &&

  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
