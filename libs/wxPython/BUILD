(

  export WXPREF=/usr/lib/wxPython
  mkdir build
  cd build
  ../configure --with-gtk 		\
             --prefix=$WXPREF 		\
             --enable-rpath=$WXPREF/lib \
	     --with-opengl 		\
	     --enable-geometry 		\
	     --enable-optimise 		\
	     --enable-debug_flag 	\
	     $OPTS			&&
	     
  make		&&
  cd ../locale 	&&
  make allmo	&&
  cd ../build	&&
  
  prepare_install       &&
  make install	&&
					 
  cd ../wxPython &&
  python setup.py \
        IN_CVS_TREE=1 WX_CONFIG=$WXPREF/bin/wx-config \
	build install

) > $C_FIFO 2>&1
