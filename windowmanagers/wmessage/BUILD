(
	sedit "s!include <WUtil.h>!include <WINGs/WUtil.h>!" wmessage.h &&
	sedit "s!PREFIX = /usr/local!PREFIX = /usr!" Makefile &&
	make	&&
	make install

) > $C_FIFO 2>&1
