(

  prepare_install                                             &&
  if [ ! -d ${INSTALL_ROOT}/usr/share/$SPELL ] ; then
    mkdir  ${INSTALL_ROOT}/usr/share/$SPELL
  fi                                                          &&
  cp -r  *  ${INSTALL_ROOT}/usr/share/$SPELL                  &&
  sed 's/\$VERSION/'$VERSION'/' < $SCRIPT_DIRECTORY/$SPELL.sh  \
    >  /tmp/$SPELL.sh                                         &&
  sedit "s/\$INSTALL_ROOT/\${INSTALL_ROOT}/g" /tmp/$SPELL.sh  &&
  chmod +x /tmp/$SPELL.sh                                     &&
  mv  /tmp/$SPELL.sh  ${INSTALL_ROOT}/usr/bin		  

) > $C_FIFO 2>&1
