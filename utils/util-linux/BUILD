sedit  "s/HAVE_SLN=no/HAVE_SLN=yes/"   MCONFIG
sedit  "s/# ADD_RAW=yes/ADD_RAW=yes/"  MCONFIG
sedit  "s/\$(OPT)//"                   MCONFIG

(

 ./configure  --build=$BUILD                  \
              --prefix=${INSTALL_ROOT}/usr    \
	      $OPTS			      &&
  make                                        &&
  if    spell_installed      util-linux-crypto
  then  dispel  --nosustain  util-linux-crypto
  fi                                          &&
  prepare_install                             &&
  make    install

) > $C_FIFO 2>&1
