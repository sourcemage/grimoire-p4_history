(
  python setup.py build  &&
  prepare_install        &&
  install -m 644 scons.1 ${INSTALL_ROOT}/usr/share/man/man1/ &&
  python setup.py install --prefix=${INSTALL_ROOT}/usr

) > $C_FIFO 2>&1
