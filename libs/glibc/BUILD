(
  
	# Add a blank to those files so that they get tracked
  echo >> /usr/include/bits/syscall.h
  echo >> /usr/include/gnu/stubs.h

  # Apply gcc 3.3 patch
  bzcat  ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1  &&

  cd $SOURCE_DIRECTORY.bld                    &&

  #possible fix for mysterious bug where LD_LIBRARY_PATH gets set to PWD ? 
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH//$PWD/}   && 

  if    !  echo  "$CFLAGS"  |  grep  -q -- "-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi                                          &&

  if    !  echo  "$CXXFLAGS"  |  grep  -q -- "-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi                                          &&

  export  CFLAGS="$(  echo  $CFLAGS  |  sed  s/-ffast-math//  )"  &&
  ### Fix the "gcc" problem for some machines
  export  CC=gcc                              &&

  $SOURCE_DIRECTORY/configure                 \
               --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=${INSTALL_ROOT}/usr                  \
               --enable-add-ons=linuxthreads  \
               --with-elf                     \
               --enable-shared                \
               $OPTS			      &&
  make                                        &&
  prepare_install                             &&
#old systems have left over files in /usr/lib/locale/*
#they are from a previous untracked release of glibc
#and should be removed
if [ -d ${INSTALL_ROOT}/usr/lib/locale ];
then rm -rf ${INSTALL_ROOT}/usr/lib/locale/   &&
     echo "REMOVING OLD LOCALE FILES"
fi                                            &&
  make    install                             &&
  (  ldconfig  ||  true  )                    &&

#comment this out to allow tracking of locale stuff
#might need re-instating for a major version update
#  unset   LD_PRELOAD                          &&

  if  [  -z  "$GLIBC_LOCALES"  ];  then
    cat  $SCRIPT_DIRECTORY/locales  |
    while  read  LOCALE  DESCRIPTION;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  /usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  else
    for  LOCALE  in  $GLIBC_LOCALES;  do
      INPUTFILE=`echo  $LOCALE  |  cut  -d /  -f1`
        CHARMAP=`echo  $LOCALE  |  cut  -d /  -f2`
      mkdir  -p  /usr/lib/locale/$INPUTFILE
      echo "localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE"
            localedef  -i  $INPUTFILE  -f  $CHARMAP  $INPUTFILE
    done
    true
  fi

) > $C_FIFO 2>&1
