(
# avoid fig2dev at present, as there is problem with espgs
# only install my camera
#		--with-drivers=stv0680 \

  if test "`gaze installed gphoto2`" = "2.1.0" ; then dispel gphoto2 ; fi 
  # upgrading from 2.1.0 fix for gphoto2, compiling gphoto2 later will dispel these new libs if old gphoto2 <= 2.1.0.
  # the libs will then be wiped, and that would be bad news, so we wipe it early if upgrading.
  # this spell used to be inside gphoto2, in case you are wondering.

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
