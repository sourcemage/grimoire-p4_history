(
# avoid fig2dev at present, as there is problem with espgs
# only install my camera
#		--with-drivers=stv0680 \
  ./configure  --build=$BUILD           \
               --prefix=/usr            \
               --sysconfdir=/etc        \
               --localstatedir=/var     \
               --with-doc-formats=html  \
               --without-xmlto          \
               --without-fig2dev        \
               $OPTS                    &&

  make                   &&
  prepare_install        &&
  make    install        

) > $C_FIFO 2>&1
