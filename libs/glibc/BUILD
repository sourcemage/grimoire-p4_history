(
### Apply gcc 3.3 patch
  bzcat   ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1  &&
  tail +5 ${SOURCE_CACHE}/${SOURCE4}  |  patch  -p1  &&

  cd $SOURCE_DIRECTORY.bld                    &&

### LD_LIBRARY_PATH includes $PWD bug ?
  unset  LD_LIBRARY_PATH                      &&

  if    !  echo  "$CFLAGS"  |  grep  -q -- "-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi                                          &&
  if    !  echo  "$CXXFLAGS"  |  grep  -q -- "-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi                                          &&
  export  CFLAGS="$(  echo  $CFLAGS  |  sed  s/-ffast-math//  )"  &&
  export  CC=gcc                              &&
  $SOURCE_DIRECTORY/configure                 \
               --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr   \
               --enable-add-ons=linuxthreads  \
               --with-elf                     \
               --enable-shared                \
               $OPTS			      &&
  make                                        &&
  prepare_install                             &&
  (  ldconfig  ||  true  )                    &&

### glibc install only installs these if the file differs 
### we like tracking files and removing them creates a major difference :)
for i in ${INSTALL_ROOT}/usr/include/bits/syscall.h \
         ${INSTALL_ROOT}/usr/include/gnu/stubs.h  
do if [ -f $i ]
   then  rm -vf $i
   fi
done                                          &&
### old systems have left over files in /usr/lib/locale/* they are 
### from a previous untracked release of glibc and should be removed
if [ -d ${INSTALL_ROOT}/usr/lib/locale ];
then rm -rf ${INSTALL_ROOT}/usr/lib/locale/   &&
     echo "REMOVING OLD LOCALE FILES"
fi                                            &&
  make    install                             &&
  (  ldconfig  ||  true  )                    &&

### comment this out to allow tracking of locale stuff might need 
### re-instating for a major version update 
### unset   LD_PRELOAD                          &&

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
  fi

) > $C_FIFO 2>&1
