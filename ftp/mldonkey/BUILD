(
  [[ $CROSS_INSTALL == on ]] && OPTS="$OPTS --host=${HOST} --build=${BUILD}"

  case  $ONLY  in
      y|Y)  OPTS="$OPTS --disable-multinet" ;;
  esac  &&
  ./configure --prefix=${INSTALL_ROOT}/usr  \
              --sysconfdir=${INSTALL_ROOT}/etc  \
              --localstatedir=${INSTALL_ROOT}/var  \
              --mandir=${INSTALL_ROOT}/usr/share/man   \
              --infodir=${INSTALL_ROOT}/usr/share/info  \
              $OPTS  &&
  make depend        &&
  make opt           &&
  prepare_install    &&
  make    install
) > $C_FIFO 2>&1
