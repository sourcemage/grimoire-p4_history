(

  python setup.py build  &&
  prepare_install  &&
  python setup.py install  --prefix=${INSTALL_ROOT}/usr  \
                       --sysconfdir=${INSTALL_ROOT}/etc

) > $C_FIFO 2>&1
