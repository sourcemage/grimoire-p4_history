(

  cd $SOURCE_DIRECTORY && 

  mkdir  bld                          &&
  cd     bld                          &&
  ../platforms/unix/config/configure  --prefix=/usr \
			 	      --enable-mpg-mmx &&
  make                                   &&
  make    install			 &&

  cd $SOURCE_DIRECTORY 		&&
  ./INSTALL -/usr		&&
  ./INSTALL			&&

  cd $SECOND_DIRECTORY 		&&
  ./INSTALL -/usr 		&&
  ./INSTALL

) > $C_FIFO 2>&1  
