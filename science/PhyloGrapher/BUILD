(

  prepare_install                                             &&
  if [ ! -d  /usr/share/$SPELL ] ; then
    mkdir  /usr/share/$SPELL
  fi                                                          &&
  cp -r  *  /usr/share/$SPELL                                 &&
  sed 's/\$VERSION/'$VERSION'/' < $SCRIPT_DIRECTORY/$SPELL.sh  \
    >  /tmp/$SPELL.sh                                         &&
  chmod +x /tmp/$SPELL.sh                                     &&
  mv  /tmp/$SPELL.sh  /usr/bin

) > $C_FIFO 2>&1
