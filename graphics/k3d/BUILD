(

  if ! test -f /usr/bin/python2 ; then ln -sf /usr/bin/python /usr/bin/python2; fi &&

  sedit  's:python2.2:python2.3:g'  acinclude.m4  &&
  sedit  's:python2.2:python2.3:g'  aclocal.m4    &&
  sedit  's:python2.2:python2.3:g'  configure     &&
  # remove undefined symbol 'mkdir_p'
  sedit '/mkdir_p/D' Makefile.in    &&

  ./configure  --prefix=/usr/share/k3d               \
               --bindir=/usr/share/k3d               \
               --datadir=/usr/share/k3d              \
               --without-docbook                     \
               ${OPTS}                               &&
  make                                               &&
  prepare_install                                    &&
  make  install                                      &&
  install  -m  755  ${SCRIPT_DIRECTORY}/k3d  /usr/bin

)  >  ${C_FIFO}  2>&1
