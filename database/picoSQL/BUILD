(
# insert CFLAGS into all subdir makefiles

  for L  in  `ls -d *` ;  do
    if [[ -f $L/Makefile ]] ; then
      sedit \
"s/CFLAGS=-O/CFLAGS+=-D_MSC_VER/;s/OFLAGS=-O/OFLAGS=$CFLAGS/" \
		$L/Makefile;
    fi
  done			
  make			&&
# must manually copy directories for install purposes
  prepare_install        	&&
  mkdir -p /usr/bin/picoSQL	&&
  cp bin/* /usr/bin/picoSQL	&&
  mkdir -p /usr/doc/picoSQL	&&
  cp -r doc/* /usr/doc/picoSQL  &&
  cp lib/*.a /usr/lib  		&&
  cp inc/* /usr/include		&&
  mkdir -p /usr/share/picoSQL	&&
  cp -r test /usr/share/picoSQL
  
) > $C_FIFO 2>&1

