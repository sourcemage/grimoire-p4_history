(

  if [ $OLD_TOO == y ] ; then
    cd $SOURCE_DIRECTORY2                      &&
    ./configure  --build=$BUILD  $OPTS         &&
    make                                       &&
    cd $SOURCE_DIRECTORY
  fi                                           &&

  ./configure  --prefix=/ $OPTS                &&
  make                                         &&
  prepare_install                              &&

  if [ $OLD_TOO == y ] ; then
    cd $SOURCE_DIRECTORY2                      &&
    make install                               &&
    mkdir  -p  /etc/modules.d                  &&
    touch      /etc/modules                    &&
    touch      /etc/modules.conf               &&
    cd $SOURCE_DIRECTORY                       &&
    rm_source_dir $SOURCE_DIRECTORY2
  fi                                           &&

  make moveold
  make install                                 &&
  ./generate-modprobe.conf /etc/modprobe.conf  &&

  #run depmod on all current kernel trees
  for i in `ls /lib/modules/`; do depmod $i; done > /dev/null 
  
) > $C_FIFO 2>&1
