(

  ./configure  $OPTS -d  &&
  make                   &&
  prepare_install        &&
  make    install  &&

  if [ ! -h /usr/share/man/whatis ]; then
    touch /var/cache/whatis &&
    if [ -f /usr/share/man/whatis ]; then
      mv -f /usr/share/man/whatis /var/cache/whatis
    fi &&
    ln -fs /var/cache/whatis /usr/share/man/whatis
  fi &&

  if  spell_installed  less; then
    sedit "s/PAGER		\/bin\/less -is/PAGER		\/bin\/less -isR/" /usr/share/misc/man.conf
  fi &&

  sedit "s/1:8:2:3:4:5:6:7:9:tcl:n:l:p:o/1:1p:8:0p:2:3:3p:3w:4:5:6:7:n/" /usr/share/misc/man.conf


) > $C_FIFO 2>&1
