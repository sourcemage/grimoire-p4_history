(

  prepare_install                                                         &&
  cd libastro                                                             &&
  make                                                                    &&
  cd ../libip                                                             &&
  make                                                                    &&
  cd ../GUI/xephem                                                        &&
  xmkmf                                                                   &&
  make                                                                    &&
  cp xephem /usr/bin                                                      &&
  mkdir  -p  /etc/xephem                                                  &&
  cp -R auxil /etc/xephem                                                 && 
  cp -R catalogs /etc/xephem                                              &&
  cp -R fifos /etc/xephem                                                 && 
  cp -R fits /etc/xephem                                                  &&
  touch /usr/lib/X11/app-defaults/XEphem                                  &&
  echo "XEphem.ShareDir: /etc/xephem"  > /usr/lib/X11/app-defaults/XEphem &&
  cp xephem.man /usr/man/man1/xephem.1                                    &&
  if grep -q 'doc="y"'  ${SPELL_CONFIG}
  then
    mkdir  -p  /usr/doc/xephem                                            &&
    cp /var/spool/sorcery/${SPELL}-$VERSION.pdf /usr/doc/xephem
  fi

) > $C_FIFO 2>&1
