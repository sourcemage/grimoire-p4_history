(

  sedit 's|^\(library_dirs[[:space:]]*=\).*$|\1 /usr/lib|'     setup.cfg &&
  sedit 's|^\(include_dirs[[:space:]]*=\).*$|\1 /usr/include|' setup.cfg &&

  python  setup.py  build                     &&
  prepare_install                             &&
  python  setup.py  install

) > $C_FIFO 2>&1
