(
  export PWLIBDIR=$SOURCE_DIRECTORY/pwlib             &&
  cd pwlib                                            &&
#  sedit "s:GETDATE_SOURCE:#GETDATE_SOURCE:" src/ptlib/unix/Makefile &&
  sedit "s/GETDATE_SOURCE = \$(COMMON_SRC_DIR)\//GETDATE_SOURCE = /" src/ptlib/unix/Makefile &&
  make optnoshared                                    &&
  cd lib                                              &&
  ln -s libpt_linux_x86_r_s.a libpt.a                 &&
  cd ../..                                            &&
  export OPENH323DIR=$SOURCE_DIRECTORY/openh323       &&
  cd openh323                                         &&
  make optnoshared                                    &&
  cd lib                                              &&
  ln -s libh323_linux_x86_r_s.a libopenh323.a         &&
  cd ../..                                            &&
  sedit 's/LIBPT_FILE=\"libpt.so\"/LIBPT_FILE=\"\"/' configure                    &&
  sedit 's/LIBOPENH323_FILE=\"libopenh323.so\"/LIBOPENH323_FILE=\"\"/' configure  &&
  ./configure  --prefix=/usr                                   \
               --datadir=/usr/share/gnomemeeting               \
               --sysconfdir=/etc/gnomemeeting                  \
               --with-openh323-includes=$OPENH323DIR/include   \
               --with-openh323-libs=$OPENH323DIR/lib           \
               --with-ptlib-includes=$PWLIBDIR/include/ptlib   \
               --with-ptlib-libs=$PWLIBDIR/lib                 &&
  make                                         &&
  make install

) > $C_FIFO 2>&1
