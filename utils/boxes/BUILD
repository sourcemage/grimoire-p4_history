(
 sedit "s/-traditional/ /g" src/regexp/Makefile &&
 sedit "s/\/usr\/local/\/usr/g" Makefile &&
 sedit "s/\/usr\/local/\/usr/g" src/boxes.h &&
 touch src/* &&
 
 make &&
 
 cp doc/boxes.1 /usr/man/man1 &&
 cp boxes-config /usr/share/boxes &&
 cp src/boxes /usr/bin/


) > $C_FIFO 2>&1
