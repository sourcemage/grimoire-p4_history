(
  if [ "$CVS" == "yes" ]; then
	make -f Makefile.cvs
  fi &&
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var	\
	       $OPTS			                                      &&
  make					                                          &&

#  cd  $SOURCE_DIRECTORY/plugins/console               &&
#  if [ "$CVS" == "yes" ]; then
#	  make -f Makefile.cvs
#  fi                                                              &&
#  ./configure  --prefix=/usr		\
#               --sysconfdir=/etc	\
#               --localstatedir=/var	               &&
#  make					                &&

  if  spell_installed  qt-x11;  then
	cd  $SOURCE_DIRECTORY/plugins/qt-gui	                      &&
	if [ "$CVS" == "yes" ]; then
		make -f Makefile.cvs
	fi                                                            &&
	./configure  --prefix=/usr		\
		     --sysconfdir=/etc		\
		     --localstatedir=/var	\
		     $OPTS	                                  &&
	make                                      
   fi                                 &&

	  cd $SOURCE_DIRECTORY/plugins/email                          &&
       if [ "$CVS" == "yes" ]; then
	  make -f Makefile.cvs 
       fi                                                            &&
	  ./configure --prefix=/usr \
				  --sysconfdir=/etc \
				  --localstatedir=/var \
				  $OPTS &&
	  make                                                        &&

          cd $SOURCE_DIRECTORY/plugins/msn           &&
       if [ "$CVS" == "yes" ]; then
	  make -f Makefile.cvs 
       fi                                            &&   
	  ./configure --prefix=/usr \
                      --sysconfdir=/etc   \
                      --localstatedir=/var  \
                      $OPTS  &&
           make                  &&


	  cd $SOURCE_DIRECTORY/plugins/auto-reply                     &&
       if [ "$CVS" == "yes" ]; then
	  make -f Makefile.cvs
       fi                                                             &&
	  ./configure --prefix=/usr \
		      --sysconfdir=/etc \
		      --localstatedir=/var \
			$OPTS &&
	  make                                                        &&

	  cd $SOURCE_DIRECTORY/plugins/rms                            &&
       if [ "$CVS" == "yes" ]; then
	  make -f Makefile.cvs
       fi
	  ./configure --prefix=/usr \
		       --sysconfdir=/etc \
	               --localstatedir=/var \
			  $OPTS &&
	  make            &&

  if [ "$XOSD" == "yes" ] && [ "$CVS" != "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/osd &&
#	  ./build                                               &&
	  ./configure --prefix=/usr			\
	              --sysconfdir=/etc		\
		      --localstatedir=/var	\
			 $OPTS			&&
	  make
  fi	  
	  
        if [ "$CVS" == "yes" ]; then
	  cd $SOURCE_DIRECTORY/licq-data-cvs   &&
	  mkdir -p /usr/share/licq/qt-gui      &&
	  for i in $(find $SOURCE_DIRECTORY/licq-data-cvs -path "*CVS" -type d);\
                  do rm -rf $i; done  &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/qt-gui/* \
			/usr/share/licq/qt-gui                &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/sounds \
	        /usr/share/licq                               &&
	  cp -R $SOURCE_DIRECTORY/licq-data-cvs/translations    /usr/share/licq
        fi          &&

#  fi                                                              &&

  prepare_install                                                 &&

  cd  $SOURCE_DIRECTORY                                           &&
  make    install                                                 &&
  
#  cd  $SOURCE_DIRECTORY/plugins/console                           &&
#  make    install                                                 &&

  if  spell_installed  qt-x11;  then
    cd  $SOURCE_DIRECTORY/plugins/qt-gui                          &&
    make    install
  fi                                                              &&

	  cd $SOURCE_DIRECTORY/plugins/email                          &&
	  make install                                                &&

          cd $SOURCE_DIRECTORY/plugins/msn                         &&
          make install                                             &&
	  
	  cd $SOURCE_DIRECTORY/plugins/auto-reply                     &&
	  make install                                                &&
	  
	  cd $SOURCE_DIRECTORY/plugins/rms                            &&
	  make install                                                &&
	  
  if [ "$XOSD" == "yes" ] && [ "$CVS" != "yes" ]; then
	  cd $SOURCE_DIRECTORY/plugins/osd &&
	  make install
  fi
				  

) > $C_FIFO 2>&1
