(

  HTDIGDIR=/usr/share/htdig/htdocs
  CGIBINDIR=/usr/share/htdig/cgi-bin
  SEARCHFORM=search.html
  WEBPREFIX=/htdig

  export CPPFLAGS="-Wno-deprecated $CPPFLAGS"
  export CFLAGS="-Wno-deprecated $CFLAGS"
  export CXXFLAGS="-Wno-deprecated $CXXFLAGS"

  ./configure  --prefix=/usr                      \
               --sysconfdir=/etc                  \
               --with-config-dir=/etc             \
               --with-default-config-file=/etc/htdig.conf \
               --with-database-dir=/var/lib/htdig \
               --with-common-dir=$HTDIGDIR/common \
               --with-cgi-bin-dir=$CGIBINDIR      \
               --with-image-dir=$HTDIGDIR         \
               --with-search-dir=$HTDIGDIR        \
               --with-image-url-prefix=$WEBPREFIX \
               --with-search-form=$SEARCHFORM     \
               $OPTS &&
  make &&
  prepare_install &&
  make    install                 

) > $C_FIFO 2>&1
