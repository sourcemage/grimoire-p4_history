(
   patch -p1 < $SCRIPT_DIRECTORY/vim-6.2.patch &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --enable-gui=$GUI     \
               $OPTS                 &&
  sedit '/shUntil\|link shRepeat/{
       /shUntil/N
       /^/i\
       if exists("b:is_kornshell") || exists("b:is_bash")
       p
       /$/i\
       endif
       d
       }' "runtime/syntax/sh.vim"    &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  ln  -sf  vim  /usr/bin/vi

) > $C_FIFO 2>&1
