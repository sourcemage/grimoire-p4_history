(

  ./configure  --build=$BUILD        \
               --prefix=/usr/share   \
               --bindir=/usr/bin     \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&

  sedit  's/c++/g++/'      Makefile  &&
  sedit  's/-I\/usr\/include -I\/usr\/include\/freetype2/-I\/usr\/include\/freetype2/'  Makefile  &&

  make                               &&
  prepare_install                    &&
  make    install

)  >  $C_FIFO  2>&1
