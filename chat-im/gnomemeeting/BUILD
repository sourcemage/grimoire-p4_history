(
#
#moved these to the top so if versions change 
#then it is easier to update
#
  export PWLIBDIR=$SOURCE_DIRECTORY/pwlib                   &&
  export OPENH323DIR=$SOURCE_DIRECTORY/openh323             && 
# xml bug
  sedit "s/xmlSAXHandler/xmlSAXHandlerV1/" lib/xdap/xdap.c  && 
#pwlib
  cd $PWLIBDIR                                              &&
  ./configure --disable-shared                              &&
  make -j 1 optnoshared                                     &&
  cd lib                                                    &&
  ln -s libpt_linux_x86_r_s.a libpt.a                       &&
  cd ../..                                                  &&
#openh323
  cd $OPENH323DIR                                           &&
  ./configure --disable-shared                              &&
  make -j 1 optnoshared                                     &&
  cd lib                                                    &&
  ln -s libh323_linux_x86_r_s.a libopenh323.a               &&
#gnomemeeting
  cd $SOURCE_DIRECTORY                                                                &&
  sedit 's/LIBPT_FILE=\"libpt.so\"/LIBPT_FILE=\"\"/' configure                        &&
  sedit 's/LIBOPENH323_FILE=\"libopenh323.so\"/LIBOPENH323_FILE=\"\"/' configure      &&
  sedit 's/ARCH_H323_CFLAGS=\"\"/ARCH_H323_CFLAGS=\"-DSTATIC_LIBS_USED\"/'  configure &&
  ./configure  --prefix=${INSTALL_ROOT}/usr                          \
               --datadir=${INSTALL_ROOT}/usr/share/gnomemeeting      \
               --sysconfdir=${INSTALL_ROOT}/etc/gnomemeeting         \
               --with-openh323-includes=$OPENH323DIR/include         \
               --with-openh323-libs=$OPENH323DIR/lib                 \
               --with-ptlib-includes=$PWLIBDIR/include/ptlib         \
               --with-ptlib-libs=$PWLIBDIR/lib                       \
	       $OPTS					             &&
  make             &&
  prepare_install  &&
  make install     
) > $C_FIFO 2>&1
