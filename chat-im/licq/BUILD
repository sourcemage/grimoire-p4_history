(
  if [ "$CVS" = "yes" ]; then
	make -f Makefile.cvs
  fi &&
  if [ ! "$CVS" = "yes" ]; then
	patch -p1 < $SCRIPT_DIRECTORY/licq-nptl.patch
  fi &&
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var	\
	       $OPTS			                                      &&
  make					                                          &&

  cd  $SOURCE_DIRECTORY/plugins/console	                          &&
  if [ "$CVS" = "yes" ]; then
	  make -f Makefile.cvs
  fi                                                              &&
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var	                              &&
  make								                              &&

  if  spell_installed  qt-x11;  then
	cd  $SOURCE_DIRECTORY/plugins/qt-gui	                      &&
	if [ "$CVS" = "yes" ]; then
		make -f Makefile.cvs
	fi                                                            &&
	./configure  --prefix=/usr		\
		     --sysconfdir=/etc		\
		     --localstatedir=/var	\
		     $OPTS			                                      &&
	make
  fi                                                              &&

  if [ "$CVS" = "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/email                          &&
	  make -f Makefile.cvs                                        &&
	  ./configure --prefix=/usr \
				  --sysconfdir=/etc \
				  --localstatedir=/var \
				  $OPTS &&
	  make                                                        &&

	  cd $SOURCE_DIRECTORY/plugins/auto-reply                     &&
	  make -f Makefile.cvs                                        &&
	  ./configure --prefix=/usr \
				  --sysconfdir=/etc \
				  --localstatedir=/var \
				  $OPTS &&
	  make                                                        &&

	  cd $SOURCE_DIRECTORY/plugins/rms                            &&
	  make -f Makefile.cvs                                        &&
	  ./configure --prefix=/usr \
				  --sysconfdir=/etc \
				  --localstatedir=/var \
				  $OPTS &&
	  make

  fi                                                              &&
  if [ "$XOSD" = "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/$SOURCE4_NAME-$SOURCE4_VERSION &&
	  sedit 's/-1.7//g' build									  &&
	  ./build                                                     &&
	  ./configure --prefix=/usr			\
				 --sysconfdir=/etc		\
				 --localstatedir=/var	\
				 $OPTS			&&
	  make
  fi                                                              &&

  prepare_install                                                 &&

  cd  $SOURCE_DIRECTORY                                           &&
  make    install                                                 &&
  
  cd  $SOURCE_DIRECTORY/plugins/console                           &&
  make    install                                                 &&

  if  spell_installed  qt-x11;  then
    cd  $SOURCE_DIRECTORY/plugins/qt-gui                          &&
    make    install
  fi                                                              &&

  if [ "$CVS" = "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/email                          &&
	  make install                                                &&
	  
	  cd $SOURCE_DIRECTORY/plugins/auto-reply                     &&
	  make install                                                &&
	  
	  cd $SOURCE_DIRECTORY/plugins/rms                            &&
	  make install                                                &&
	  
	  cd $SOURCE_DIRECTORY/licq-data-cvs                          &&
	  mkdir -p /usr/share/licq/qt-gui                             &&
	  for i in $(find $SOURCE_DIRECTORY/licq-data-cvs -path "*CVS" -type d); do rm -rf $i; done                        &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/qt-gui/* \
			/usr/share/licq/qt-gui                                &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/sounds \
	        /usr/share/licq                                       &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/translations /usr/share/licq
  fi                                                              &&
  if [ "$XOSD" = "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/$SOURCE4_NAME-$SOURCE4_VERSION &&
	  make install
  fi
				  

) > $C_FIFO 2>&1
