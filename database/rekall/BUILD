(
  sed -i "/^GETVALUE/s/;//" libs/kbase/kb_options.cpp	&&
  sed -i "/Q_OBJECT/s/;//" libs/kbase/kb_draglist.h	&&
  sed -i "/Q_OBJECT/s/;//" libs/kbase/kb_optionsdlg.h	&&
#  default_build
  ./configure --prefix=${INSTALL_ROOT}/usr $OPTS 	&&
  sed -i "s/-pedantic//" libs/extra/Makefile		&&
  sed -i "s/-pedantic//" libs/kdeplugins/Makefile	&&
  sed -i "s/-pedantic//" script/python/stub/Makefile    &&
  sed -i "s/-pedantic//" parts/table2/Makefile          &&
  sed -i "s/-pedantic//" parts/form/Makefile            &&
  sed -i "s/-pedantic//" parts/report/Makefile          &&
  sed -i "s/-pedantic//" parts/query/Makefile           &&
  sed -i "s/-pedantic//" parts/copier/Makefile          &&
  sed -i "s/-pedantic//" parts/component/Makefile       &&
  sed -i "s/-pedantic//" parts/editor/Makefile          &&
  sed -i "s/-pedantic//" parts/macro/Makefile           &&
  make                   &&
  prepare_install        &&
  make    install

) > $C_FIFO 2>&1
