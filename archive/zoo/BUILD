(
  sedit  "s:-O3:$CFLAGS:"  makefile  &&
  make    linux                      &&
  prepare_install

) > $C_FIFO 2>&1   &&

(
   # adapted from the .spec file provided with the source RPM
   install  -m 755  -s  fiz  /usr/bin/fiz
   install  -m 755  -s  zoo  /usr/bin/zoo
   install  -m 644  fiz.1  /usr/man/man1/fiz.1
   install  -m 644  zoo.1  /usr/man/man1/zoo.1

)
