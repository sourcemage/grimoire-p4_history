(

  D_DIR="/usr/share/doc/${SPELL}"                             &&
  prepare_install                                             &&
  mkdir  -p  ${D_DIR}                                         &&
  install  -o root -g root -m 644  README  ${D_DIR}           &&
  case ${HTB} in
    y|Y)  install  -o root -g root -m 755  wshaper.htb        \
          /usr/sbin/wshaper
          ;;
    n|N)  install  -o root -g root -m 755  wshaper  /usr/sbin
          ;;
  esac

)  >  ${C_FIFO}  2>&1
