(
#  default_build
#  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS &&
#  make                   &&
  python setup.py build     &&
  prepare_install           &&
  python setup.py install   

#  python install.py
#  make    install        

) > $C_FIFO 2>&1
