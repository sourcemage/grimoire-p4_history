(

  mkdir  buildit
  cd     buildit
#                --build=$BUILD                \

  ../configure  --host=$HOST                  \
                --prefix=/usr                 \
                --infodir=${INSTALL_ROOT}/usr/share/info     \
                --mandir=${INSTALL_ROOT}/usr/share/man       \
 		$OPTS	                      &&
  make                                        &&
  prepare_install                             &&
  make prefix=${INSTALL_ROOT}/usr install

) > $C_FIFO 2>&1
