sedit  "s/HAVE_SLN=no/HAVE_SLN=yes/"   MCONFIG
sedit  "s/# ADD_RAW=yes/ADD_RAW=yes/"  MCONFIG
sedit  "s/\$(OPT)//"                   MCONFIG
# Stupid `make install` doesn't honor --prefix
sedit  "s:/dev:${INSTALL_ROOT}/dev:"       MCONFIG
sedit  "s:/etc:${INSTALL_ROOT}/etc:"       MCONFIG
# Stupid people who use TABs in their files...
sedit  "s:	/sbin: ${INSTALL_ROOT}/sbin:"       MCONFIG
sedit  "s:/usr:${INSTALL_ROOT}/usr:g"       MCONFIG
sedit  "s: /bin: ${INSTALL_ROOT}/bin:"       MCONFIG
sedit  "s:/var:${INSTALL_ROOT}/var:g"       MCONFIG

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
