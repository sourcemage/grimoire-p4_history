(
#
#moved these to the top so if versions change 
#then it is easier to update
#
  export PWLIBDIR=$SOURCE_DIRECTORY/pwlib                   &&
  export OPENH323DIR=$SOURCE_DIRECTORY/openh323             && 
#  export LD_LIBRARY=$PWLIBDIR/lib;$OPENH323DIR/lib          &&
# xml bug
#  sedit "s/xmlSAXHandler/xmlSAXHandlerV1/" lib/xdap/xdap.c  && 
#pwlib
  cd $PWLIBDIR                                              &&
  ./configure --prefix=/usr --enable-plugins                &&
  make                                                       &&
  LD_LIBRARY_PATH=$PWLIBDIR/lib                              &&
  export LD_LIBRARY_PATH                                     &&
#  cd lib                                                    &&
#  ln -s libpt_linux_x86_r_s.a libpt.a                       &&
#  cd ../..                                                  &&
#openh323
  cd $OPENH323DIR                                           &&
  ./configure --prefix=/usr                 &&
  make                                                      &&
#  cd lib                                                    &&
#  ln -s libh323_linux_x86_r_s.a libopenh323.a               &&
#gnomemeeting
  cd $SOURCE_DIRECTORY                                                                &&
#  sedit 's/LIBPT_FILE=\"libpt.so\"/LIBPT_FILE=\"\"/' configure                        &&
#  sedit 's/LIBOPENH323_FILE=\"libopenh323.so\"/LIBOPENH323_FILE=\"\"/' configure      &&
#  sedit 's/ARCH_H323_CFLAGS=\"\"/ARCH_H323_CFLAGS=\"-DSTATIC_LIBS_USED\"/'  configure &&
  ./configure  --prefix=${INSTALL_ROOT}/usr                          \
	       --syscondir=/etc                                      \
	       $OPTS					             &&
  make             &&
  prepare_install  &&
  make install     
) > $C_FIFO 2>&1
