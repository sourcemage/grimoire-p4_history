(

  if    [  -x  ${INSTALL_ROOT}/bin/bash.dynamic  ]
  then  mv     ${INSTALL_ROOT}/bin/bash.dynamic  \
               ${INSTALL_ROOT}/bin/bash          &&
        rm  -f  ${INSTALL_ROOT}/bin/bash.static
  elif  [  -x  ${INSTALL_ROOT}/bin/bash.static   ]
  then  mv     ${INSTALL_ROOT}/bin/bash.static   \
               ${INSTALL_ROOT}/bin/bash          &&
	rm  -f  ${INSTALL_ROOT}/bin/bash.dynamic
  fi                                         &&

  # the following is for gcc 3.4 with bash 2.05b
  OPTS="$OPTS --without-bash-malloc"  &&

  ./configure  --build=$BUILD                \
               --prefix=${INSTALL_ROOT}/usr  \
               --bindir=${INSTALL_ROOT}/bin  \
               $OPTS                         &&
  make                                       &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cp  -f   bash     ${INSTALL_ROOT}/bin
  cp  -f   bashbug  ${INSTALL_ROOT}/bin
  ln  -sf  bash     ${INSTALL_ROOT}/bin/sh

  cd  doc

  for  MANPAGE  in  `ls  *.1`;  do
    gzip  -9  $MANPAGE
    cp  $MANPAGE.gz  ${INSTALL_ROOT}/usr/share/man/man1
  done

  cp  bashref.info  ${INSTALL_ROOT}/usr/share/info/bash.info
  install-info  --info-dir=${INSTALL_ROOT}/usr/share/info  \
                 ${INSTALL_ROOT}/usr/share/info/bash.info

)
