(
  export PVM_HOME=/usr/share/pvm              &&
  export PVM_HOME2=/usr                       &&
  export F77=g77                              &&
  export PVM_SRC=$SOURCE_DIRECTORY            &&
  export PVM_ROOT=$PVM_SRC                    &&
  cd ${PVM_SRC}                               &&
  make clean                                  &&
  make                                        &&
  export PVM_ARCH=`ls -1 ${PVM_SRC}/bin`      &&
  install -d ${PVM_HOME}/conf                 &&
  install -m 644 ${PVM_SRC}/conf/${PVM_ARCH}.def ${PVM_HOME}/conf         &&
  install -d ${PVM_HOME}/bin/${PVM_ARCH}      &&
  install -m 755 ${PVM_SRC}/bin/${PVM_ARCH}/* ${PVM_HOME}/bin/${PVM_ARCH} &&
  install -d ${PVM_HOME}/lib/${PVM_ARCH}      &&
  install -m 755 ${PVM_SRC}/lib/${PVM_ARCH}/* ${PVM_HOME}/lib/${PVM_ARCH} &&
  for file in ${PVM_SRC}/lib/*;               \
  do                                          \
    if test -f $file; then                    \
      install -m 755 $file ${PVM_HOME}/lib;   \
    fi;                                       \
  done                                        &&
  install -d ${PVM_HOME}/include              &&
  install -m 644 ${PVM_SRC}/include/* ${PVM_HOME}/include         &&
  ln -s ${PVM_HOME}/include/* $PVM_HOME2      &&
  install -d ${PVM_HOME2}/man/man1            &&
  install -m 644 ${PVM_SRC}/man/man1/* ${PVM_HOME2}/man/man1      &&
  install -d ${PVM_HOME2}/man/man3            &&
  install -m 644 ${PVM_SRC}/man/man3/* ${PVM_HOME2}/man/man3

  pushd .
  cd ${PVM_HOME}/lib/${PVM_ARCH}              &&
  for file in lib*.a;                         \
  do                                          \
    ln -sf ${PVM_HOME}/lib/${PVM_ARCH}/$file  \
           ${PVM_HOME2}/lib/$file;            \
  done                                        &&
  cd ${PVM_HOME}/lib                          &&
  for file in {aimk,pvm,pvmd,pvmgetarch,pvmtmparch,xpvm};  \
  do                                          \
    ln -sf ${PVM_HOME}/lib/$file              \
           ${PVM_HOME2}/bin/$file;            \
  done                                        &&
  popd

  sedit "s/\`pwd.*$/\"\/usr\/share\/pvm\" ;;/" $PVM_HOME/lib/pvm     &&
  sedit "s/\`pwd.*$/\"\/usr\/share\/pvm\" ;;/" $PVM_HOME/lib/pvmd    &&
  sedit "s/\`pwd.*$/\"\/usr\/share\/pvm\" ;;/" $PVM_HOME/lib/xpvm    &&
  sedit "s/\/\*/\#\*/" $PVM_HOME/lib/pvm     &&
  sedit "s/\/\*/\#\*/" $PVM_HOME/lib/pvmd    &&
  sedit "s/\/\*/\#\*/" $PVM_HOME/lib/xpvm    &&
  sedit "s/exec \$XPVM_ROOT\/src/exec \$XPVM_ROOT\/lib/" $PVM_HOME/lib/xpvm 
  sedit "s/XPVM_ROOT=.*$/XPVM_ROOT=\"\/usr\/share\/xpvm\"/" $PVM_HOME/lib/xpvm 

) > $C_FIFO 2>&1

