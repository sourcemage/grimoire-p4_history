(
# insert CFLAGS into all subdir makefiles
# and remove references to /usr/local
  for L  in  `ls -d *` ;  do
    if [[ -f $L/Makefile ]] ; then
      sedit "s/CFLAGS=/CFLAGS+=/;s#/local##" $L/Makefile;
    fi
  done			
  make		&&	
#zzzcrash 
# must manually copy directories for install purposes
  prepare_install        	&&
  cp lib/*.so /usr/lib
#  mkdir -p /usr/bin/picoSQL	&&
#  cp bin/* /usr/bin/picoSQL	&&
#  mkdir -p /usr/doc/picoSQL	&&
#  cp -r doc/* /usr/doc/picoSQL  &&
#  cp lib/*.a /usr/lib  		&&
#  cp inc/* /usr/include		&&
#  mkdir -p /usr/share/picoSQL	&&
#  cp -r test /usr/share/picoSQL
  
) > $C_FIFO 2>&1

