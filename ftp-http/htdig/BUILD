(

  HTDIGDIR=/usr/apache/htdocs/htdig
  CGIBINDIR=/usr/apache/cgi-bin
  SEARCHFORM=search.html
  WEBPREFIX=/htdig

  ./configure  --prefix=/usr                      \
               --sysconfdir=/etc                  \
               --with-config-dir=$HTDIGDIR/conf   \
               --with-common-dir=$HTDIGDIR/common \
               --with-database-dir=$HTDIGDIR/db   \
               --with-default-config-file=$HTDIGDIR/conf/htdig.conf \
               --with-cgi-bin-dir=$CGIBINDIR      \
               --with-image-dir=$HTDIGDIR         \
               --with-search-dir=$HTDIGDIR        \
               --with-image-url-prefix=$WEBPREFIX \
               --with-search-form=$SEARCHFORM     \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install                 

) > $C_FIFO 2>&1
