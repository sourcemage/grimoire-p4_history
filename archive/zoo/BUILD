(
  patch -p1 < $SCRIPT_DIRECTORY/zoo-gcc3.3.patch &&
  sedit  "s:-O3:$CFLAGS:"  makefile  &&
  make    linux                      &&
  prepare_install

) > $C_FIFO 2>&1   &&

(
   # adapted from the .spec file provided with the source RPM
   install  -m 755  -s  fiz  ${INSTALL_ROOT}/usr/bin/fiz
   install  -m 755  -s  zoo  ${INSTALL_ROOT}/usr/bin/zoo
   install  -m 644  fiz.1  ${INSTALL_ROOT}/usr/man/man1/fiz.1
   install  -m 644  zoo.1  ${INSTALL_ROOT}/usr/man/man1/zoo.1

)
