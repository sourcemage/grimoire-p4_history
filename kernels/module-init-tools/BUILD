(

  if [ $OLD_TOO == y ] ; then
    cd $SOURCE_DIRECTORY2                         &&
    ./configure  --build=$BUILD                   \
                 --prefix=${INSTALL_ROOT}/        \
                 --mandir=${INSTALL_ROOT}/usr/man \
		 $OPTS                            &&
    make                                          &&
    cd $SOURCE_DIRECTORY
  fi                                              &&

  patch -p0 < $SPELL_DIRECTORY/mk.diff            &&
  ./configure  --prefix=${INSTALL_ROOT}/          \
               $OPTS                              &&
  make                                            &&
  prepare_install                                 &&

  if [ $OLD_TOO == y ] ; then
    cd $SOURCE_DIRECTORY2                                     &&
    make install                                              &&
    mkdir  -p  ${INSTALL_ROOT}/etc/modules.d                  &&
    touch      ${INSTALL_ROOT}/etc/modules                    &&
    touch      ${INSTALL_ROOT}/etc/modules.conf               &&
    cd $SOURCE_DIRECTORY                                      &&
    rm_source_dir $SOURCE_DIRECTORY2                          &&
    make moveold
  fi                                                          &&
  make install                                                &&
  if [ $OLD_TOO == y ] ; then
    ./generate-modprobe.conf ${INSTALL_ROOT}/etc/modprobe.conf
  fi                                                          &&
  cp modprobe.devfs ${INSTALL_ROOT}/etc                       
  
) > $C_FIFO 2>&1
