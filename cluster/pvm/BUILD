(
  export PVM_HOME=/usr                        &&
  export F77=g77                              &&
  export PVM_SRC=$SOURCE_DIRECTORY            &&
  export PVM_ROOT=$PVM_SRC                    &&
  cd ${PVM_SRC}                               &&
  make clean                                  &&
  make                                        &&
  export PVM_ARCH=`ls -1 ${PVM_SRC}/bin`      &&
  install -d ${PVM_HOME}/bin/${PVM_ARCH}      &&
  install -m 755 ${PVM_SRC}/bin/${PVM_ARCH}/* ${PVM_HOME}/bin/${PVM_ARCH} &&
  install -d ${PVM_HOME}/lib/${PVM_ARCH}      &&
  for file in ${PVM_SRC}/lib/*; do            \
    if test -f $file; then                    \
      install -m 755 $file ${PVM_HOME}/lib;   \
    fi;                                       \
  done                                        &&
  install -m 755 ${PVM_SRC}/lib/${PVM_ARCH}/* ${PVM_HOME}/lib/${PVM_ARCH} &&
  install -d ${PVM_HOME}/include              &&
  install -m 755 ${PVM_SRC}/include/*         ${PVM_HOME}/include         &&
  install -d ${PVM_HOME}/man/man1             &&
  install -d ${PVM_HOME}/man/man3             &&
  install -m 755 ${PVM_SRC}/man/man1/*        ${PVM_HOME}/man/man1        &&
  install -m 755 ${PVM_SRC}/man/man3/*        ${PVM_HOME}/man/man3
 
) > $C_FIFO 2>&1

