(
 [ "$NPTL" = "yes" ] && OPTS="$OPTS --enable-add-ons=nptl  --with-tls" &&
 # cosmetic patch so /lib/libc.so.6 will give out its version \
 patch -p1 < $SCRIPT_DIRECTORY/glibc-nptl-fix-asserts.patch ;

 [ "$NPTL" = "no" ] && OPTS="$OPTS --enable-add-ons=linuxthreads" &&
 ### Apply gcc 3.3 patch
 bzcat   ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1  &&
 tail +5 ${SOURCE_CACHE}/${SOURCE4}  |  patch  -p1  ;


  if    !  echo  "$CFLAGS"  |  grep  -q -- "-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi                                          &&
  if    !  echo  "$CXXFLAGS"  |  grep  -q -- "-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi                                          &&
  export  CFLAGS="$(  echo  $CFLAGS  |  sed  s/-ffast-math//  )"  &&
  export  CC=gcc                              &&

  cd $SOURCE_DIRECTORY.bld                    &&
  ### LD_LIBRARY_PATH includes $PWD bug 
  unset  LD_LIBRARY_PATH                      &&
  $SOURCE_DIRECTORY/configure                 \
               --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr   \
               --with-elf                     \
               --enable-shared                \
               --enable-kernel=current        \
               --disable-profile              \
               $OPTS			      &&
  make                                        &&

 ### so many problems with glibc installs ! 
 ### these symlinks and unsetting the (sorcery) preload of old libs should finally fix them
 prepare_install                                                            &&
 ln -sf $SOURCE_DIRECTORY.bld/libc.so ${INSTALL_ROOT}/lib/libc.so.6         &&
 ln -sf $SOURCE_DIRECTORY.bld/rt/librt.so ${INSTALL_ROOT}/lib/librt.so.1    &&
 ln -sf $SOURCE_DIRECTORY.bld/math/libm.so ${INSTALL_ROOT}/lib/libm.so.6    &&
 ln -sf $SOURCE_DIRECTORY.bld/dlfcn/libdl.so ${INSTALL_ROOT}/lib/libdl.so.2 &&
 ln -sf $SOURCE_DIRECTORY.bld/nis/libnsl.so ${INSTALL_ROOT}/lib/libnsl.so.1 &&
 ln -sf $SOURCE_DIRECTORY.bld/crypt/libcrypt.so ${INSTALL_ROOT}/lib/libcrypt.so.1 &&
 ln -sf $SOURCE_DIRECTORY.bld/login/libutil.so ${INSTALL_ROOT}/lib/libutil.so.1 &&
 [ "$NPTL" = "yes" ] && ln -sf $SOURCE_DIRECTORY.bld/nptl/libpthread.so ${INSTALL_ROOT}/lib/libpthread.so.0 ;
 [ "$NPTL" = "no" ] && ln -sf $SOURCE_DIRECTORY.bld/linuxthreads/libpthread.so ${INSTALL_ROOT}/lib/libpthread.so.0 ;
 ln -sf $SOURCE_DIRECTORY.bld/elf/ld.so ${INSTALL_ROOT}/lib/ld-linux.so.2   &&
 unset  LD_LIBRARY_PATH                                                     &&
 (  ldconfig  ||  true  )                                                   &&

 ### glibc only installs these if the file differs (or is removed :) )
  for i in ${INSTALL_ROOT}/usr/include/bits/syscall.h \
        ${INSTALL_ROOT}/usr/include/gnu/stubs.h  
     do [ -f $i ] && rm -vf $i 
  done                                        &&
 ### old systems have left over files in /usr/lib/locale/* 
 [ -d ${INSTALL_ROOT}/usr/lib/locale ] && rm -rf ${INSTALL_ROOT}/usr/lib/locale/ && echo "REMOVING OLD LOCALE FILES" ;

 ### INSTALL 
  make install                                &&
  (  ldconfig  ||  true  )                    &&

 ### generate the localedef file from installed specs
  if  [  -z  "$GLIBC_LOCALES"  ];  then
    cat  $SCRIPT_DIRECTORY/locales  |
    while  read  LOCALE  DESCRIPTION;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  ${INSTALL_ROOT}/usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  else
    for  LOCALE  in  $GLIBC_LOCALES;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  ${INSTALL_ROOT}/usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  fi &&
 ### copy the headers if wanted
 [ "$HEADERS" = "yes" ] && rm -rf ${INSTALL_ROOT}/usr/include/{asm,asm-generic,linux} && for i in asm asm-generic linux; do cp -aL \
 ${INSTALL_ROOT}/lib/modules/$(uname -r)/build/include/$i ${INSTALL_ROOT}/usr/include ; done ;
) > $C_FIFO 2>&1

