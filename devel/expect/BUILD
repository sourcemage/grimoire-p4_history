(

  cd  $SOURCE_DIRECTORY/             &&
  ./configure  --prefix=/usr \
	--with-tcl=/usr/lib \
	--with-tk=/usr/lib           &&
  make                               &&

  prepare_install                    &&
  cd  $SOURCE_DIRECTORY/             &&
  make    install                    &&

  cd  /                              &&
  rm_source_dir  $SOURCE_DIRECTORY   &&
  rm_source_dir  $SOURCE1_DIRECTORY   &&
  rm_source_dir  $SOURCE2_DIRECTORY  
 

) > $C_FIFO 2>&1

