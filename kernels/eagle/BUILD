(

  message "${MESSAGE_COLOR}Warning:"
  message "THE INSTALL SCRIPT START ADSL ON STARTUP"
  message "IS NOT COMPATIBLE WITH SORCERY INIT SCRIPTS."
  message "This part of the install script is disabled. ${DEFAULT_COLOR}"

  sedit "s:USEINITTAB=1:USEINITTAB=0:" scripts/makescripts &&

read toto

  sedit "s:-fno-strict-aliasing -pipe:-fno-strict-aliasing -pipe ${CFLAGS} :" driver/Makefile &&
  sedit "s:CFLAGS=-O2 -pipe -Wall -pedantic:CFLAGS=-O2 -pipe -Wall -pedantic ${CFLAGS}:" driver/firmware/Makefile &&
  sedit "s:CFLAGS=-O2 -pipe -Wall -pedantic -DLINUX -g:CFLAGS=-O2 -pipe -Wall -pedantic -DLINUX ${CFLAGS}:" driver/user/Makefile &&
  sedit "s:CFLAGS= -O2 -Wall -Wstrict-prototypes -ansi -pedantic $(DEFINES) $(PATHS):CFLAGS= -O2 -Wall -Wstrict-prototypes -ansi -pedantic $(DEFINES) $(PATHS) ${CFLAGS}:" pppoa/Makefile &&

  make clean &&
  make &&

  prepare_install &&

  make install

) > $C_FIFO 2>&1  
