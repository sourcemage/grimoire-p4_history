sedit  "s:/usr/local/lib/libepplet.la:/usr/lib/libepplet.la:"  \
        src/Makefile.am                                        &&

./autogen.sh  --build=$BUILD  \
             --prefix=/usr    \
         --sysconfdir=/etc    \
      --localstatedir=/var    \
              $OPTS           &&
patch  src/Makefile  $SCRIPT_DIRECTORY/Makefile.patch  &&
make
