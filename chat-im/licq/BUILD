  if [ "$CVS" == "y" ]; then
	make -f Makefile.cvs
  fi &&
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var	\
	       $OPTS			 &&
  make	 &&

  if [ "$CDK" == "y" ]; then
  cd  $SOURCE_DIRECTORY/plugins/console     &&
  if [ "$CVS" == "y" ]; then
	  make -f Makefile.cvs
  fi        &&
  ./configure  --prefix=/usr		\
               --sysconfdir=/etc	\
               --localstatedir=/var	     &&
  make
  fi          &&

  if  spell_installed  qt-x11;  then
	cd  $SOURCE_DIRECTORY/plugins/qt-gui	                      &&
	if [ "$CVS" == "y" ]; then
		make -f Makefile.cvs
	fi                                                            &&
	./configure  --prefix=/usr		\
		     --sysconfdir=/etc		\
		     --localstatedir=/var	\
		     $OPTS	                                  &&
	make                                      
   fi                                 &&

	  cd $SOURCE_DIRECTORY/plugins/email                          &&
       if [ "$CVS" == "y" ]; then
	  make -f Makefile.cvs 
       fi                                                            &&
	  ./configure --prefix=/usr \
				  --sysconfdir=/etc \
				  --localstatedir=/var \
				  $OPTS &&
	  make                                                        &&

          cd $SOURCE_DIRECTORY/plugins/msn           &&
       if [ "$CVS" == "y" ]; then
	  make -f Makefile.cvs 
       fi                                            &&   
	  ./configure --prefix=/usr \
                      --sysconfdir=/etc   \
                      --localstatedir=/var  \
                      $OPTS  &&
           make                  &&


	  cd $SOURCE_DIRECTORY/plugins/auto-reply                     &&
       if [ "$CVS" == "y" ]; then
	  make -f Makefile.cvs
       fi                                                             &&
	  ./configure --prefix=/usr \
		      --sysconfdir=/etc \
		      --localstatedir=/var \
			$OPTS &&
	  make                                                        &&

	  cd $SOURCE_DIRECTORY/plugins/rms                            &&
       if [ "$CVS" == "y" ]; then
	  make -f Makefile.cvs
       fi
	  ./configure --prefix=/usr \
		       --sysconfdir=/etc \
	               --localstatedir=/var \
			  $OPTS &&
	  make            &&

  if [ "$XOSD" == "y" ] && [ "$CVS" != "y" ]; then
	  cd $SOURCE_DIRECTORY/plugins/osd &&
#	  ./build                                               &&
	  ./configure --prefix=/usr			\
	              --sysconfdir=/etc		\
		      --localstatedir=/var	\
			 $OPTS			&&
	  make
  fi
