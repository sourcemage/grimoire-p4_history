(
  sed -i "/^GETVALUE/s/;//" libs/kbase/kb_options.cpp	&&
  sed -i "/Q_OBJECT/s/;//" libs/kbase/kb_draglist.h	&&
  sed -i "/Q_OBJECT/s/;//" libs/kbase/kb_optionsdlg.h	&&
#  default_build
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS 	&&
  sed -i "s/-pedantic//" libs/extra/Makefile		&&
  sed -i "s/-pedantic//" libs/kdeplugins/Makefile	&&
  make                   &&
  prepare_install        &&
  make    install

) > $C_FIFO 2>&1
