(
  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host ${HOST} --build ${BUILD}"
  ./configure --prefix ${INSTALL_ROOT}/usr            \
              --mandir ${INSTALL_ROOT}/usr/share/man  \
              $OPTS             &&
  make world                    &&
  make opt                      &&
  make opt.opt                  &&
  prepare_install               &&
  make    install
) > $C_FIFO 2>&1
