(
  PREFIX=/usr/share/picoSQL	&&
# insert CFLAGS into all subdir makefiles

  for L  in  `ls -d *` ;  do
    if [[ -f $L/Makefile ]] ; then
      sedit \
"s/CFLAGS=-O/CFLAGS+=-D_MSC_VER/;s/OFLAGS=-O/OFLAGS=$CFLAGS/" \
		$L/Makefile;
    fi
  done			&&
  make			&&
# must manually copy directories for install purposes
  prepare_install        	&&
  cp lib/*.a /usr/lib  		&&
  cp inc/* /usr/include		&&
  rm bin/*.{bat,js}		&&
  mkdir -p $PREFIX/bin		&&
  cp bin/* $PREFIX/bin		&&
  cp -r test $PREFIX
  
) > $C_FIFO 2>&1

