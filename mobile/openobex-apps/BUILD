(
  ./configure  --build=$BUILD        	                \
               --prefix=${INSTALL_ROOT}/usr         	\
               $OPTS                 	                &&
make					                &&
cd $SOURCE_DIRECTORY/src		                &&
cp $SCRIPT_DIRECTORY/obexserver.c .	                &&
cc -o obexserver obexserver.c libmisc.a -lopenobex	&&
cd $SOURCE_DIRECTORY			                &&
prepare_install				                &&
make install				                &&
install  src/obexserver	/usr/bin/	
) > $C_FIFO 2>&1
