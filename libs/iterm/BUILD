(

  prepare_install                                              &&
  for i in lib unix/Xaw/lib unix/Xaw/src #unix/fbiterm
  do
  message  "${MESSAGE_COLOR}Compiling $i...${DEFAULT_COLOR}"   &&
  cd  $i                                                       &&
  ./configure --prefix=${INSTALL_ROOT}/usr                     \
          --sysconfdir=${INSTALL_ROOT}/etc                     \
       --localstatedir=${INSTALL_ROOT}/var                     \
              --mandir=${INSTALL_ROOT}/usr/share/man           \
             --infodir=${INSTALL_ROOT}/usr/share/info          \
                       $OPTS                                   &&
  make                                                         &&
  message  "${MESSAGE_COLOR}Installing $i...${DEFAULT_COLOR}"  &&
  make  install                                                &&
  cd  -
  done                                                         &&
  cd unix/terminfo                                             &&
  tic iterm.terminfo

)  >  ${C_FIFO}  2>&1
