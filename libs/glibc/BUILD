(

  # Apply gcc 3.3 patch
  bzcat  ${SOURCE_CACHE}/${SOURCE3}  |  patch  -p1  &&

  cd $SOURCE_DIRECTORY.bld                    &&

  if    !  echo  "$CFLAGS"  |  grep  -q -- "-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi                                          &&

  if    !  echo  "$CXXFLAGS"  |  grep  -q -- "-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi                                          &&

  export  CFLAGS="$(  echo  $CFLAGS  |  sed  s/-ffast-math//  )"  &&

  $SOURCE_DIRECTORY/configure                 \
               --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=/usr                  \
               --enable-add-ons=linuxthreads  \
               --with-elf                     \
               --enable-shared                \
               $OPTS			      &&
  make                                        &&
  prepare_install                             &&
  make    install                             &&
  (  ldconfig  ||  true  )                    &&
  unset   LD_PRELOAD                          &&
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
