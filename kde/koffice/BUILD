(
#gcc3.3 bugfix
if [[ $(gcc -dumpversion)   == 3.3* ]] ; then
#patch -p1 < $SCRIPT_DIRECTORY/koffice-1.2.1-gcc3.3.patch &&
sedit "s/-ansi//g" configure &&
sedit "s/-pedantic//g" configure 
fi                                                           &&
  ./configure  --prefix=${INSTALL_ROOT}/usr                  \
               --disable-debug                               \
	       $OPTS                                         &&
  make                                                       &&
  prepare_install                                            &&
  make    install

) > $C_FIFO 2>&1
