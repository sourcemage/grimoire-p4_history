( 

  DESTDIR=/usr/share/xml/docbook/xsl-stylesheets-`echo $VERSION|cut -d . -f 1,2`

  prepare_install    &&

  mkdir -p $DESTDIR  &&
  cp -r *  $DESTDIR 

) > $C_FIFO 2>&1 
