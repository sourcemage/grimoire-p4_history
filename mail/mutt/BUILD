(

  #
  # patch for multiple signatures and allows selection.
  #
  if [ "$PATCH_SIGNATURE" == "y" ]; then
    message  "${MESSAGE_COLOR}Attempting to apply signatures patch... ${DEFAULT_COLOR}" &&
    ( patch -p1 < $SCRIPT_DIRECTORY/patch-1.4.0.cd.signatures_menu.2.1 || die ) 	
  fi											&&

  #
  # patch for trash bin.
  #
  if [ "$PATCH_TRASH" == "y" ]; then
    message  "${MESSAGE_COLOR}Attempting to apply trash patch... ${DEFAULT_COLOR}"	&&
    ( patch -p1 < $SCRIPT_DIRECTORY/patch-1.4.0.cd.trash_folder.3.1 || die )		
  fi					 						&&


  chmod  a+x  missing                               &&
  touch  README.UPGRADE                             &&
  ./configure  --build=$BUILD                       \
               --prefix=${INSTALL_ROOT}/usr         \
               --sysconfdir=${INSTALL_ROOT}/etc     \
               --localstatedir=${INSTALL_ROOT}/var  \
               --enable-pop                         \
               --enable-imap                        \
               --with-mailpath=/var/spool/mail      \
               $OPTS                                &&
  make                                              &&
  prepare_install                                   &&
  make    install                                   &&
  ln  -sf mutt ${INSTALL_ROOT}/usr/bin/mail         &&
  ln  -sf mutt ${INSTALL_ROOT}/usr/bin/mailx

) > $C_FIFO 2>&1
