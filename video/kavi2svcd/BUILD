sedit  "s:bool autoClose=false:bool autoClose:"  kavi2svcd/procbaseclass.cpp  &&
sedit  "s:/usr/local/:/usr/:" kavi2svcd/Makefile.in  &&
# fixes compilation with gcc 3.4
sedit  "s/;;/;/" kavi2svcd/prefclass.h &&
sedit  "s/;;/;/" kavi2svcd/vcdclass.h  &&

# fixes bug #6236
touch  kavi2svcd/*.ui  &&
default_build
