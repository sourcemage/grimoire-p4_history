(

  unpack  $SOURCE2  ${MD5[1]}            &&
  patch  -p1  <  $SOURCE_CACHE/$SOURCE2  &&
  sedit  's/fam_LDADD =/fam_LDADD = -lrt -lpthread/'  fam/Makefile.am  &&
  aclocal                   &&
  libtoolize --copy --force &&
  autoheader                &&
  autoconf                  &&
  automake                  &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&

  # make install does some strange stuff, so do it by hand
  make  -C  fam      install  &&
  make  -C  include  install  &&
  make  -C  libfam   install  &&
  make  -C  man      install  &&

  (
     if  !  grep  -q  "^sgi_fam"  /etc/rpc;  then
       echo  "sgi_fam  391002  fam"  >>  /etc/rpc
     fi
  )

) > $C_FIFO 2>&1
