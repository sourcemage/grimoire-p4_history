(

  python setup.py build        &&
  python setup.py build_ext -i &&
  prepare_install              &&

  ZOPE_HOME=$INSTALL_ROOT/usr/lib/zope
  python setup.py install \
    --home=$ZOPE_HOME \
    --install-platlib=$ZOPE_HOME \
    --install-purelib=$ZOPE_HOME

) >$C_FIFO 2>&1
