(
  if echo $OPT | grep -q tk; then
     export LDFLAGS="$LDFLAGS -L /usr/X11R6/lib" 
  fi                                 &&

  cd  $SOURCE_DIRECTORY/             &&
  ./configure  --prefix=/usr \
               --with-tcl=/usr/lib \
               $OPTS                 &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE_DIRECTORY/             &&
  make    install                    &&

  cd  /                              
  rm_source_dir  $SOURCE_DIRECTORY   && 
  rm_source_dir  $SOURCE2_DIRECTORY  &&

  if echo $OPT | grep -q tk; then
     rm_source_dir  $SOURCE3_DIRECTORY
  fi  
 
) > $C_FIFO 2>&1

