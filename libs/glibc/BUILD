(
  ### remove these from this spells log then
  ### in case glibc had provided these headers before
    for i in $INSTALL_LOGS/glibc*
    do sedit '/\/usr\/include\/asm/D' $i      &&
       sedit '/\/usr\/include\/linux/D' $i
    done                                      &&
  ###


  if [ "$NPTL" = "yes" ] ;then
   OPTS="$OPTS --enable-add-ons=nptl  --with-tls --enable-kernel=current" &&
  # cosmetic patch so /lib/libc.so.6 will give out its version 
   patch -p1 < $SCRIPT_DIRECTORY/glibc-nptl-fix-asserts.patch 
  else  OPTS="$OPTS --enable-add-ons=linuxthreads --enable-kernel-2.4" &&
  ### Apply gcc 3.3 patch
   bzcat   ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1  &&
   tail +5 ${SOURCE_CACHE}/${SOURCE4}  |  patch  -p1  
  fi                                          &&
  if ! echo "$CFLAGS" | grep -q -- "-O"
  then export CFLAGS="$CFLAGS -Os"
  fi                                          &&
  if ! echo "$CXXFLAGS" | grep -q -- "-O"
  then  export CXXFLAGS="$CFLAGS -Os"
  fi                                          &&
  export CFLAGS="$(echo $CFLAGS | sed s/-ffast-math// )"  &&
  export CC=gcc                               &&
  cd $SOURCE_DIRECTORY.bld                    &&
  ### LD_LIBRARY_PATH includes $PWD bug 
  unset LD_LIBRARY_PATH                       &&
  $SOURCE_DIRECTORY/configure                 \
               --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr   \
               --infodir=${INSTALL_ROOT}/usr/share/info \
               --mandir=${INSTALL_ROOT}/usr/share/man   \
               --with-elf                     \
               --enable-shared                \
               --disable-profile              \
               --with-headers="${INSTALL_ROOT}/usr/src/linux/include/" \
               $OPTS			      &&
  make                                        &&
  prepare_install                             &&

 ### making these symlinks and unsetting the (sorcery) preload of old 
 ### libs should finally fix the glibc install problems. Had to add a 
 ### check for saved libraries, as an empty log means none can be saved
 if [ -f $SOURCE_DIRECTORY/old.libraries/ld-*.so ] ; then
  . /$SCRIPT_DIRECTORY/makelinks              &&
  make_install_links                          &&
  unset  LD_LIBRARY_PATH                      &&
 ### must use -X or ldconfig will relink to any alien files found in /lib or /usr/lib
  (  ldconfig -X ||  true  )                  
 fi                                           &&

 ### glibc only installs these if the file differs
  for i in ${INSTALL_ROOT}/usr/include/bits/syscall.h ${INSTALL_ROOT}/usr/include/gnu/stubs.h  
     do if [ -f $i ] ; then  rm -vf $i ; fi
  done                                        &&
 ### old systems have left over files in /usr/lib/locale/* 
  if [ -d ${INSTALL_ROOT}/usr/lib/locale ] 
     then  rm -rf ${INSTALL_ROOT}/usr/lib/locale/ && echo "REMOVING OLD LOCALE FILES" 
  fi &&
 ### INSTALL 
  make install                                &&
  (  ldconfig  ||  true  )                    &&

 ### generate the localedef file from installed specs
  if  [  -z  "$GLIBC_LOCALES"  ];  then
    cat  $SCRIPT_DIRECTORY/locales-$VERSION  |
    while  read  LOCALE  DESCRIPTION;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  ${INSTALL_ROOT}/usr/lib/locale/$INPUTFILE                 &&
      echo "localedef -f $CHARMAP -i $INPUTFILE $INPUTFILE		$DESCRIPTION " &&
      localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE                              &&
      if [ "$UTF" = "yes" ] && ! [ "$CHARMAP" = "UTF-8" ]
         then echo "localedef -f UTF-8 -i $INPUTFILE $INPUTFILE.UTF-8		$DESCRIPTION (UNICODE Charset)" &&
              localedef  -i  $INPUTFILE  -f UTF-8  $INPUTFILE.UTF-8
      fi
    done
    true
  else
    for  LOCALE  in  $GLIBC_LOCALES;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1` 
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  ${INSTALL_ROOT}/usr/lib/locale/$INPUTFILE &&
      echo "localedef -f $CHARMAP -i $INPUTFILE $INPUTFILE" &&
      localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
      if [ "$UTF" = "yes" ] && ! [ "$CHARMAP" = "UTF-8" ]
         then echo "localedef -f UTF-8 -i $INPUTFILE $INPUTFILE.UTF-8" &&
              localedef  -i  $INPUTFILE  -f UTF-8  $INPUTFILE.UTF-8
      fi
    done
    true
  fi 
) > $C_FIFO 2>&1

