(

  ./configure  --prefix=/usr   &&

  sedit  "s/include <parser.h>/include <libxml\/parser.h>/"  src/compiler-framework/fwcompiler.h
  sedit  "s/include <tree.h>/include <libxml\/tree.h>/"      src/compiler-framework/fwcompiler.h
  sedit  "s/include <parser.h>/include <libxml\/parser.h>/"  src/gui/Resources.hh
  sedit  "s/include <tree.h>/include <libxml\/tree.h>/"      src/gui/Resources.hh
  sedit  "s/include <parser.h>/include <libxml\/parser.h>/"  src/gui/Resources.cc
  sedit  "s/include <tree.h>/include <libxml\/tree.h>/"      src/gui/Resources.cc
  sedit  "s/include <parser.h>/include <libxml\/parser.h>/"  src/gui/Preferences.hh
  sedit  "s/include <tree.h>/include <libxml\/tree.h>/"      src/gui/Preferences.hh
  sedit  "s/include <parser.h>/include <libxml\/parser.h>/"  src/gui/Preferences.cc
  sedit  "s/include <tree.h>/include <libxml\/tree.h>/"      src/gui/Preferences.cc

  make                         &&

  prepare_install              &&

  make install

) > $C_FIFO 2>&1
