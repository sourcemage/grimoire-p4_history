(

  prepare_install &&
  mkdir -p /usr/doc/$SPELL &&
  mv -f docs/* /usr/doc/$SPELL/ &&
  mv -f *.txt /usr/doc/$SPELL/ &&
  rm -fr docs/ &&
  cp -fR * /usr/lib/zope/Products/

) >$C_FIFO 2>&1
