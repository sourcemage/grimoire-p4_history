(

  sedit  's:/usr/src/linux/include::'  DEFAULTS/Defaults.linux
  make             &&
  prepare_install  &&
  make  INS_BASE=${INSTALL_ROOT}/usr install  &&
  case ${SUDO} in
    y|Y)  chown  root  ${INSTALL_ROOT}/usr/bin/cdrecord
          chmod  u+s   ${INSTALL_ROOT}/usr/bin/cdrecord
          ;;
  esac

) > $C_FIFO 2>&1
