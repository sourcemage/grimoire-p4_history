(

  prepare_install &&
  mkdir -p /usr/doc/$SPELL &&
  mv -f *.txt /usr/doc/$SPELL/ &&
  mkdir -p /usr/lib/zope/Products/$SPELL &&
  cp -fR * /usr/lib/zope/Products/$SPELL

) >$C_FIFO 2>&1
