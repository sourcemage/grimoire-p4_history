(

  sedit  "s:PILOT_LINK_DIR = \$(TREETOP)/pilot-link-0.11.5:PILOT_LINK_DIR = /usr/lib:g"  Makefile  &&
  make                                                                                             &&
  prepare_install                                                                                  &&
  cp  malsync  ${INSTALL_ROOT}/usr/bin

) > $C_FIFO 2>&1
