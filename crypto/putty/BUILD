cd unix  &&

sedit "s:/usr/local:/usr:" Makefile.gtk &&
sedit "s:-O2 -Wall -Werror -g:$CFLAGS:" Makefile.gtk &&
sedit "580,581d" Makefile.gtk &&

make -f Makefile.gtk
